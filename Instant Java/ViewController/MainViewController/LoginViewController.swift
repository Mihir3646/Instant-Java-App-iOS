//
//  LoginViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 06/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import FBSDKShareKit
import GoogleSignIn
import Toaster
import Amplitude_iOS

class LoginViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate
{
     //# MARK: - variable and outlet -
    
    var hud: MBProgressHUD?
    var strSocial = String()
    var strUserid = String()
    var strToken = String()
    var strGoal = String()
    var strClient : String = "ios"
    var strCategory = String()
    var strPursuing = String()
    var strCurrentlyIn = String()
    var strVersion : String = "1"
    let defaults = UserDefaults.standard
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

     //# MARK: - View life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.strCategory =  defaults.string(forKey:"profession")!
        self.strPursuing =  defaults.string(forKey:"pursuing")!
        self.strCurrentlyIn = defaults.string(forKey:"currentlyIn")!
        
        
         if((defaults.object(forKey: "userid")) != nil)
         {
        self.strUserid = defaults.string(forKey:"userid")!
        }
        else
         {
            self.strUserid = " "
        }
    }
    //# MARK: - facebook login
 
    @IBAction func facebook_Action(_ sender: Any)
    {
            if ConnectionCheck.isConnectedToNetwork()
            {
                FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self){(result,err)in
                    
                    if err != nil
                    {
                        return
                    }
                    if ((result as AnyObject).isCancelled)!
                    {
                        return
                    }
                    let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name,first_name,picture.width(198).height(120)"], tokenString: FBSDKAccessToken.current().tokenString, version: nil, httpMethod: "GET")
                    req?.start(completionHandler: { (connection, result, error) -> Void in
                        if(error == nil)
                        {
                            if !ConnectionCheck.isConnectedToNetwork()
                            {
                                let toast = Toast(text: "No internet connection")
                                toast.show()
                            }
                            let dictionary = result as! NSDictionary
                            print(dictionary)
                            let pictureData = dictionary.object(forKey: "picture") as! NSDictionary
                            let username = dictionary.object(forKey: "name") as! String
                            self.appDelegate.strUsername = username
                            let imageData = pictureData.object(forKey: "data") as! NSDictionary
                            let dataURL = imageData.object(forKey: "url") as! String
                            self.appDelegate.profilePicUrl = dataURL
                            print(dataURL)
                            self.strSocial = "Facebook"
                            let accessToken = FBSDKAccessToken.current().tokenString
                            self.defaults.set(self.appDelegate.strUsername, forKey: "USERNAME")
                            self.defaults.set(self.appDelegate.profilePicUrl, forKey: "profilePicUrl")
                            self.strToken = accessToken!
                            self.callApi(source: "fb")
                        }
                        else
                        {
                        }
                    })
                }

            }
            else{
                let toast = Toast(text: "No internet connection")
                toast.show()
            }
        }

    
    //# MARK: - google login
    @IBAction func GoogleSigni(_ sender: Any)
    {
        if ConnectionCheck.isConnectedToNetwork()
        {
        GIDSignIn.sharedInstance().clientID = clientId
       GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signIn()
        }
        else
        {
            let toast = Toast(text: "No internet connection")
            toast.show()
        }
    }
    
    func signInWillDispatch(signIn: GIDSignIn!, error: Error!)
    {
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
   
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //completed sign In
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {

        if (error == nil) {
            let idToken = user.authentication.idToken // Safe to send to the server
            self.strToken = idToken!
            self.strSocial = "Google"
            appDelegate.strUsername = user.profile.name
             defaults.set(appDelegate.strUsername, forKey: "USERNAME")
            var pic = user.profile.imageURL(withDimension: 120) as! URL
            appDelegate.profilePicUrl = pic.absoluteString
            defaults.set(appDelegate.profilePicUrl, forKey: "profilePicUrl")
            
            print(pic)
            callApi(source: "google")
        } else {
            print("\(error.localizedDescription)")
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
}
    
     //# MARK: - api call method
    func callApi(source : String)  {
        
        if ConnectionCheck.isConnectedToNetwork()
        {
            hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud?.label.text = "Loading"
           let  Dicparams =
             [
                "social": strSocial,
                "userid": strUserid,
                "token": strToken,
                "goal": strGoal,
                "client": strClient,
                "category": strCategory,
                "pursuing": strPursuing,
                "currentlyin": strCurrentlyIn,
                "version": strVersion,
               ]
           
            let jsonData = try! JSONSerialization.data(withJSONObject: Dicparams, options: JSONSerialization.WritingOptions.prettyPrinted)
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
            let postString = "data=\(jsonString)"
            let paramData = postString.data(using: .utf8)
            
            ApiCall.sharedInstance.requestPostMethod(apiUrl: BaseUrl + WSList.login
                , params: paramData!)
            {(success, responseData) in
                let arrData = responseData ?? AnyObject.self as! NSArray
                let strMessage = arrData.value(forKey: "Message") as! String
              
                if strMessage == "SUCCESS"
                {
                
                DispatchQueue.main.async
                {
                    
                    if ConnectionCheck.isConnectedToNetwork()
                    {
                        self.appDelegate.strOnbonding = 5
                        self.defaults.set(self.appDelegate.strOnbonding, forKey: "onbonding")
                        self.hud?.hide(animated: true)
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        self.appDelegate.pushtoHome()
                        
                        //amplitude
                        Amplitude.instance().logEvent("Onboarding-SigninCompleted", withEventProperties: ["signinmode": source])
                    }
                    else
                    {
                        let toast = Toast(text: "No internet connection")
                        toast.show()
                    }
                    
                }
            }
           }
        }
        else
        {
            DispatchQueue.main.async
            {
                    let toast = Toast(text: "No internet connection")
                    toast.show()

                   self.hud?.hide(animated: true)
            }
        }
    }
    //# MARK: - memory management

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

}
