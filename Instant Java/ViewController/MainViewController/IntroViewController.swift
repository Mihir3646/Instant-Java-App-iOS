//
//  IntroViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 04/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import Toaster
import Amplitude_iOS

let COLLECTIONVIEWHEIGHT : CGFloat = 481
class IntroViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    //# MARK: - variable and Outlet
    
    var arrItems : [String] = []
    var arrlabelitems : [String] = []
    var Intindex = 0
    let defaults = UserDefaults.standard
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var begin_Out: UIButton!
    @IBOutlet var collectionView_Out: UICollectionView!
    
     //# MARK: - View life cycle
    
    override func viewDidLoad()
    {
         super.viewDidLoad()
          appDelegate.strOnbonding = 1
       
       defaults.set(appDelegate.strOnbonding, forKey: "onbonding")
         arrItems = ["Image_1","image_2","image_3"]
         begin_Out.setTitle("NEXT", for: .normal)
         arrlabelitems = ["Learn and master new\n programming skills","Scientifically designed games","Courses supported by research"]
    }

    
      //# MARK: - Collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
         return self.arrItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView_Out.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! IntroCollectionViewCell
        cell.introImageView.image = UIImage(named: arrItems[indexPath.row])
        cell.lblData_Out.text = arrlabelitems[indexPath.row]
     
        return cell
    }
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        return  CGSize(width: ScreenSize.Width, height: ScreenSize.Height - 140)
    }
    
    //# MARK: - page controll
    
    @IBOutlet var pageControll_Out: UIPageControl!
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
         Intindex = arrItems.count-1
         let pageNumber = round(collectionView_Out.contentOffset.x / collectionView_Out.frame.size.width)
         pageControll_Out.currentPage = Int(pageNumber)
        
         let frame: CGRect = CGRect(x : collectionView_Out.contentOffset.x ,y : self.collectionView_Out.contentOffset.y ,width : self.collectionView_Out.frame.width,height : self.collectionView_Out.frame.height)
        
         self.collectionView_Out.scrollRectToVisible(frame, animated: true)
        
        if pageControll_Out.currentPage < arrItems.count-1
         {
                begin_Out.setTitle("NEXT", for: .normal)
         }
         else if pageControll_Out.currentPage == Intindex
         {
               begin_Out.setTitle("LET'S BEGIN", for: .normal)
         }
         collectionView_Out.reloadData()
    }
    
    //# MARK: - button action
    
    @IBAction func Begin_Action(_ sender: Any)
    {
        Intindex = arrItems.count-1
        let visibleItems: NSArray = self.collectionView_Out.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        var nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
       
        if nextItem.row < arrItems.count
        {
              self.collectionView_Out.scrollToItem(at: nextItem, at: .left, animated: true)
              let pageNumber = round(collectionView_Out.contentOffset.x / collectionView_Out.frame.size.width)
              pageControll_Out.currentPage = Int(pageNumber+1)
        }
        if nextItem.row < arrItems.count-1
        {
              begin_Out.setTitle("NEXT", for: .normal)
            
        }
        if nextItem.row == arrItems.count-1
        {
              begin_Out.setTitle("LET'S BEGIN", for: .normal)
        }
        
        if nextItem.row == arrItems.count
        {
           // apiCallWelcome()
            
            self.setNextView()

        }
        
        

    }
    
    func setNextView()
    {
        //amplitude
        Amplitude.instance().logEvent("onboarding_intro_screen_completed")
        
        appDelegate.strOnbonding = 2
        defaults.set(appDelegate.strOnbonding, forKey: "onbonding")
        let nextViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func apiCallWelcome()
    {
        let  Dicparams =
            [
                "client": "ios",
                "fcmtoken": appDelegate.strDeviceToken,
            ]
        print("Param = \(appDelegate.strDeviceToken)")
        
        let jsonData = try! JSONSerialization.data(withJSONObject: Dicparams, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
        let filterjason = String(jsonString.characters.filter { !"\n".characters.contains($0) })
        let strResult =  filterjason.replacingOccurrences(of: " ", with: "")
        let postString = "data=\(strResult)"
        let strurl = BaseUrl + WSList.welcome + "?\(postString)" as String
        
//        let strurl = BaseUrl + WSList.home + "?\(postString)" as String

        let escapedString = strurl.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        print(escapedString)
        
        if ConnectionCheck.isConnectedToNetwork()
        {
            ApiCall.sharedInstance.requestGetMethod(apiUrl: escapedString!)
            {(success, responseData) in
                
                print(responseData)
                
                let dataArr = responseData ?? AnyObject.self as! NSArray
                let strMessage = dataArr.value(forKey: "Message") as! String
                
                if strMessage == "SUCCESS"
                {
                    self.defaults.set(dataArr.object(forKey: "userid") as! String, forKey: "userid")
//                    print(dataArr.object(forKey: "userid"))
                    self.setNextView()
                }
                else
                {
                    let toast = Toast(text: "Somethng went wrong.")
                    toast.show()
                }
            }
        }
        else
        {
            DispatchQueue.main.async
                {
                    let toast = Toast(text: "No internet connection")
                    toast.show()
            }
        }
    }
    
     //# MARK: - memory management
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
