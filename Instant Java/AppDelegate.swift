//
//  AppDelegate.swift
//  Instant Java
//
//  Created by abhishekbihani on 03/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn
import IQKeyboardManagerSwift
import Amplitude_iOS
import UserNotifications

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate
{
    var intPagenumberSubTopic : Int = 1
    var isWSCalled = Bool()
    var strOnbonding : Int = Int()
    
    var arrMCQAppdelegate =  NSArray()
    var arrallDetailAppdelegate =  NSArray()
    var arrSubtopicQuestionAppdelegate =  NSArray()
    var arrDurationAppdelegate =  NSArray()
    var arrAllSubTopicAppdelegate =  NSArray()
    var dicDetailSubTopicAppdelegate = NSDictionary()
    var arrDetailSubTopicDataAppdelegate =  NSArray()
    var arrQuizAppdelegate =  NSArray()
    var arrStar:[Int] = []
    var strGoalSelected =  String()
 
    var arrHomeSelectedIndex:[Int] = []
    var arrSubtopicSelectedIndex :[Int] = []
    var arrPage = NSArray()
    var strTitleAppdelegate =  String()
    var strUsername = String()
    var strsubtopicAppdelegate =  String()
    var strMcqAppdelegate =  String()
    var IntHomeSelected:Int =  0
    var IntSubtopicSelected:Int =  0
    var dicresult :[NSArray] = []
    var star:Int = 0
    var arrayOfDict:[[Int]] = []
    var isStarAvailable = Bool()

    var ishome = Bool()
    var isSub = Bool()
    var isstar = Bool()
    var isLastIndex = Bool()
    var profilePicUrl = String()
    var intHome:Int = Int()
    var intsub:Int = Int()
    var isCommingSoon:Bool = false
    var isCommingsoonLastIndex:Bool = false
    
    var result = NSArray()
    var intCorrect = 0
    var intIndex1 =  0
    var intIndexQuiz =  0
    var intRent = 0
    var intTotalStar = 0
    
    var strDeviceToken : String = "1234"
    
    var window: UIWindow?

    var isThirdTopic = Bool()
    
    //# MARK: - Appdelegate life cycle -


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        //Amplitude
        Amplitude.instance().trackingSessionEvents = true
        Amplitude.instance().initializeApiKey("22ab1394d654362a4faa9b99683caea1")
       
        self.requestForDeviceToken(application: application)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
            if !accepted {
                print("Notification access denied.")
            }
        }
        
        IQKeyboardManager.sharedManager().enable = true
        
        let defaults = UserDefaults.standard
        if ((defaults.object(forKey: "isCommingSoon")) != nil)
        {
            isCommingSoon = defaults.value(forKey: "isCommingSoon") as! Bool
        }

        
        if ((defaults.object(forKey: "USERNAME")) != nil)
        {
           strUsername = defaults.object(forKey: "USERNAME") as! String
        }
        if ((defaults.object(forKey: "profilePicUrl")) != nil)
        {
            profilePicUrl = defaults.object(forKey: "profilePicUrl") as! String
        }
//        if ((defaults.object(forKey: "onbonding")) != nil)
//        {
        /*
        if let login : Bool = UserDefaults.standard.bool(forKey: "isLogin") as? Bool
        {
            if login
            {
                pushtoHome()
            }
            else
            {
                if ((defaults.object(forKey: "onbonding") as? Int) == 1)
                {
                    let nextViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: instantiateID.IntroViewController) as! IntroViewController
                    let nvc: UINavigationController = UINavigationController(rootViewController: nextViewController)
                    self.window?.rootViewController = nvc
                    nvc.navigationBar.isHidden = true
                }
                    
                else if ((defaults.object(forKey: "onbonding")as? Int) == 2)
                {
                    let nextViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: instantiateID.WelcomeViewController) as! WelcomeViewController
                    let nvc: UINavigationController = UINavigationController(rootViewController: nextViewController)
                    self.window?.rootViewController = nvc
                    nvc.navigationBar.isHidden = true
                    
                }
                else if ((defaults.object(forKey: "onbonding")as? Int) == 3)
                {
                    let nextViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: instantiateID.PicUpGoalViewController) as! PicUpGoalViewController
                    let nvc: UINavigationController = UINavigationController(rootViewController: nextViewController)
                    self.window?.rootViewController = nvc
                    nvc.navigationBar.isHidden = true
                    
                }
                else if ((defaults.object(forKey: "onbonding")as? Int) == 4)
                {
                    let nextViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: instantiateID.LoginViewController) as! LoginViewController
                    let nvc: UINavigationController = UINavigationController(rootViewController: nextViewController)
                    self.window?.rootViewController = nvc
                    nvc.navigationBar.isHidden = true
                }
                else if ((defaults.object(forKey: "onbonding")as? Int) == 5)
                {
                    pushtoHome()
                }
                else
                {
                    let nextViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: instantiateID.IntroViewController) as! IntroViewController
                    let nvc: UINavigationController = UINavigationController(rootViewController: nextViewController)
                    self.window?.rootViewController = nvc
                    nvc.navigationBar.isHidden = true
                }
            }
        }
        
       */
        if((UserDefaults.standard.array(forKey: "star")) != nil)
        {
            arrStar = defaults.object(forKey: "star") as! [Int]
        }
        if ((UserDefaults.standard.object(forKey: "intTotalStar")) != nil) {
            intTotalStar = defaults.object(forKey: "intTotalStar") as! Int
        }
        if ((UserDefaults.standard.object(forKey: "rent")) != nil) {
            intRent = defaults.object(forKey: "rent") as! Int
        }
        if((UserDefaults.standard.array(forKey: "totalStar")) != nil)
        {
            intTotalStar = defaults.object(forKey: "totalStar") as! Int
        }
        if defaults.object(forKey: "homeselectedIndex") == nil {
           if((UserDefaults.standard.array(forKey: "SavedStringArray")) != nil){
                arrHomeSelectedIndex = defaults.object(forKey: "SavedStringArray") as! [Int]
            }
           //defaults.set(IntSubtopicSelected, forKey: "SubtopicselectedIndex")

           defaults.set(IntHomeSelected, forKey: "homeselectedIndex")
       }
        else
       {
            if((UserDefaults.standard.array(forKey: "SavedStringArray")) != nil)
            {
               arrHomeSelectedIndex = defaults.object(forKey: "SavedStringArray") as! [Int]
            }
        
           IntHomeSelected = defaults.object(forKey: "homeselectedIndex") as! Int
        }
        
        if defaults.object(forKey: "SubtopicselectedIndex") == nil {
            if((UserDefaults.standard.array(forKey: "SavedSubStringArray")) != nil){
                arrayOfDict =  defaults.object(forKey: "SavedSubStringArray") as! [[Int]]
               
           }
            if((UserDefaults.standard.array(forKey: "SubTopic")) != nil)
            {
                arrSubtopicSelectedIndex = defaults.object(forKey: "SubTopic") as! [Int]
            }

           defaults.set(IntSubtopicSelected, forKey: "SubtopicselectedIndex")
        }
        else
       {
           if((UserDefaults.standard.array(forKey: "SavedSubStringArray")) != nil){
               arrayOfDict = defaults.object(forKey: "SavedSubStringArray") as! [[Int]]
            }
        if((UserDefaults.standard.array(forKey: "SubTopic")) != nil)
        {
            arrSubtopicSelectedIndex = defaults.object(forKey: "SubTopic") as! [Int]
        }

            IntSubtopicSelected = defaults.object(forKey: "SubtopicselectedIndex") as! Int
       }
        
        // Initialize google sign-in
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().clientID = clientId
        //facebook
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func scheduleNotification(at date: Date)
    {
        let calendar = Calendar(identifier: .gregorian)
        
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Tutorial Reminder"
        content.body = "Just a reminder to read your tutorial."
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = "myCategory"
        
        if let path = Bundle.main.path(forResource: "logo", ofType: "png") {
            let url = URL(fileURLWithPath: path)
            
            do {
                let attachment = try UNNotificationAttachment(identifier: "logo", url: url, options: nil)
                content.attachments = [attachment]
            } catch {
                print("The attachment was not loaded.")
            }
        }
        
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }

    func pushtoHome()
    {
        window!.endEditing(true)
        let homeVC = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: instantiateID.HomeViewController) as! HomeViewController
        let navVC: UINavigationController = UINavigationController(rootViewController: homeVC)
        navVC.navigationBar.isHidden = true
        
        UIView.transition(with: self.window!, duration: 0.1, options: .transitionCrossDissolve, animations: {() -> Void in
            
            self.window!.rootViewController = navVC
        }, completion: { _ in })
        
//        let windowq = UIApplication.shared.windows[0] as UIWindow;
//       
//        UIView.transition(
//            from: (windowq.rootViewController?.view)!,
//            to: navVC.view,
//            duration: 0.65,
//            options: .transitionCrossDissolve,
//            completion:
//            {
//                finished in windowq.rootViewController = navVC
//        })
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()

    }

    func applicationWillTerminate(_ application: UIApplication) {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    
    // MARK: - DeviceToken method -
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        print("DEVICE TOKEN METHOD CALLED")
        var token: String = ""
        for i in 0..<deviceToken.count {
            token += String(format: "%02.2hhx", deviceToken[i] as CVarArg)
        }
        self.strDeviceToken = token

        print("DEVICE TOKEN = \(strDeviceToken)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
    {
        print("Error \(error)")
        self.strDeviceToken = "1234"
        print("DEVICE TOKEN = \(strDeviceToken)")
    }
    
    func requestForDeviceToken(application: UIApplication)
    {
//        if IS_OS_8_OR_LATER
//        {
            let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        //let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)

            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
       // }
    }
    
      //# MARK: - google sign in method -
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool
    {
        let google = GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        let facebook = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return google || facebook
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!)
    {
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
    {
        if (error == nil)
        {
           
        }
        else
        {
            print("\(error.localizedDescription)")
        }
    }
      
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "remindLater" {
            let newDate = Date(timeInterval: 900, since: Date())
            scheduleNotification(at: newDate)
        }
    }
}

