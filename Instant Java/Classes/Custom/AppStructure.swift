//
//  AppStructure.swift
//  UnityWellnessWarrior
//
//  Created by Trident Technolabs on 26/06/17.
//  Copyright © 2017 Trident Technolabs. All rights reserved.
//

import UIKit
import Foundation
let MAINSCREEN = UIScreen.main.bounds

struct ScreenSize
{
    static let Width         = MAINSCREEN.size.width
    static let Height        = MAINSCREEN.size.height
    static let MaxLength    = max(ScreenSize.Width, ScreenSize.Height)
    static let MinLength    = min(ScreenSize.Width, ScreenSize.Height)
}

struct DeviceType
{
    static let IPHONE4  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MaxLength < 568.0
    static let IPHONE5_SE = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MaxLength == 568.0
    static let IPHONE6_7 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MaxLength == 667.0
    static let IPHONE6P_7P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.MaxLength == 736.0
    static let IPAD = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.MaxLength == 1024.0
    static let IPADPRO = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.MaxLength == 1366.0
}

struct WSList
{
    static let welcome = "getonboardingdata"
    static let login = "savesignindata"
    static let home = "getcoursecontent"
   static let feedback = "saveuserfeedback"
}

struct colour {
    static let welcome = UIColor(hexString: "#43B4ED")
    static let homeTabBar = UIColor(hexString: "#43B4ED")
    static let selectedGreen = UIColor(hexString: "#6AE7B9")
    static let unselectedsItem = UIColor(hexString: "#EFEFF4")
    static let failedPopup = UIColor(hexString: "#EF7577")
    static let SelectedLightGreen = UIColor(hexString: "#E0FBF4")
    
    static let SelectedBlue = UIColor(hexString: "#24bdfa")
    static let UnelectedGray = UIColor(hexString: "#b9c2c4")
}

struct StorybordId {
    static let  MainstoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    static let  HomestoryBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
}

struct instantiateID {
    static let IMG_TXTP_VC =  "IMG_TXTP_VC"
    static let H_IMG_TXT_VC =  "H_IMG_TXT_VC"
    static let Quiz_VC =  "Quiz_VC"
    static let QUIZ_MCQ_VC =  "QUIZ_MCQ_VC"
    static let IMG_TXT_VC =  "IMG_TXT_VC"
    static let H_TXTP_VC =  "H_TXTP_VC"
    static let TXT_VC =  "TXT_VC"
    static let H_CODE_TXTP_VC =  "H_CODE_TXTP_VC"
     static let CODE_TXT_VC =  "CODE_TXT_VC"
    static let H_CODE_TXT_VC =  "H_CODE_TXT_VC"
    static let H_CODE_VC =  "H_CODE_VC"
    static let TXTP_VC =  "TXTP_VC"
   static let H_IMG_VC =  "H_IMG_VC"
    static let failedViewController =  "failedViewController"
     static let CorrectViewController =  "CorrectViewController"
    static let SubTopicViewController =  "SubTopicViewController"
    static let ProfileViewController =  "ProfileViewController"
    static let GoalsViewController =  "GoalsViewController"
    static let AboutUsViewController =  "AboutUsViewController"
    static let TermsAndConditionViewController =  "TermsAndConditionViewController"
    static let PlayGameViewController =  "PlayGameViewController"
     static let IntroViewController =  "IntroViewController"
    static let LoginViewController =  "LoginViewController"
    static let PicUpGoalViewController =  "PicUpGoalViewController"
    static let WelcomeViewController =  "WelcomeViewController"
    static let HomeViewController =  "HomeViewController"
    static let H_IMG_TXTP_ViewController =  "H_IMG_TXTP_ViewController"
    static let feedback__ViewController =  "feedback__ViewController"
    static let fullImageViewController =  "FullImageViewController"

    
}
struct viewControllerType {
    static let IMG_TXTP =  "IMG_TXTP"
    static let H_IMG_TXT =  "H_IMG_TXT"
    static let Quiz =  "Quiz"
    static let QUIZ_TF =  "QUIZ_TF"
    static let QUIZ_MCQ =  "QUIZ_MCQ"
    static let H_CODE_TXTP =  "H_CODE_TXTP"
    static let IMG_TXT =  "IMG_TXT"
    static let H_TXTP =  "H_TXTP"
    static let TXT =  "TXT"
    static let CODE_TXT =  "CODE_TXT"
    static let H_CODE =  "H_CODE"
    static let TXTP =  "TXTP"
    static let H_IMG =  "H_IMG"
    static let H_CODE_TXT =  "H_CODE_TXT"
    static let H_IMG_TXTP =  "H_IMG_TXTP"
}
