//
//  failQuizViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 17/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class failQuizViewController: UIViewController
{

    var strScore = String()
    var img = UIImage()
    
    @IBOutlet weak var viewFail: UIView!
    @IBOutlet var imgBackground: UIImageView!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var btnTryAgain: UIButton!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblScore.text =  "\(strScore)/5"
       // let borderAlpha : CGFloat = 0.7
        
        btnTryAgain.layer.cornerRadius = 5.0
        btnTryAgain.layer.borderWidth = 3.0
        btnTryAgain.layer.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        self.view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        imgBackground.image = img.alpha(0.3)
        viewFail.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TryagainAction(_ sender: Any)
    {
        let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate
        appDelegate.intCorrect = 0
        let defaults = UserDefaults.standard
      
        if appDelegate.ishome == true
        {
            if appDelegate.isSub == true
            {
                if appDelegate.isStarAvailable{
                    appDelegate.star = appDelegate.star + 1
                    appDelegate.intTotalStar =  appDelegate.intTotalStar + 1
                    defaults.set(appDelegate.intTotalStar, forKey: "intTotalStar")
                }
                if appDelegate.isCommingsoonLastIndex == true {
                    appDelegate.isCommingSoon = true
                    defaults.set(appDelegate.isCommingSoon, forKey: "isCommingSoon")

                }
                appDelegate.arrSubtopicSelectedIndex.append(appDelegate.IntSubtopicSelected)
               // appDelegate.IntSubtopicSelected = defaults.object(forKey: "SubtopicselectedIndex") as! Int
                defaults.set(appDelegate.arrSubtopicSelectedIndex, forKey: "SubTopic")
                 appDelegate.IntSubtopicSelected = appDelegate.IntSubtopicSelected + 1
                 defaults.set(appDelegate.IntSubtopicSelected, forKey: "SubtopicselectedIndex")
                appDelegate.intRent = appDelegate.intRent + 1
                defaults.set(appDelegate.intRent, forKey: "rent")
            }
            if   appDelegate.isLastIndex == true
            {
                appDelegate.arrSubtopicSelectedIndex.append(appDelegate.IntSubtopicSelected)
                appDelegate.arrayOfDict.insert(appDelegate.arrSubtopicSelectedIndex, at: appDelegate.intHome)
                defaults.set(appDelegate.arrayOfDict, forKey: "SavedSubStringArray")
                appDelegate.arrSubtopicSelectedIndex.removeAll()
                defaults.removeObject(forKey: "SubTopic")
                 appDelegate.ishome = false
                
                appDelegate.arrStar.append(appDelegate.star)
                defaults.set(appDelegate.arrStar, forKey: "star")
            }
        }
        appDelegate.ishome = false
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for aViewController in viewControllers {
            if aViewController is SubTopicViewController {
                self.navigationController!.popToViewController(aViewController, animated: true)
            }
        }
    }
}
