//
//  passViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 17/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class passViewController: UIViewController
{
    var strScore = String()
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var btnContinue: UIButton!
    var img = UIImage()
    
    @IBOutlet weak var viewPassed: UIView!
    @IBOutlet var imgBackground: UIImageView!
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        lblScore.text =  "\(strScore)/5"

        let borderAlpha : CGFloat = 1.0
        btnContinue.layer.borderWidth = 3.0
        btnContinue.layer.cornerRadius = 5.0
        btnContinue.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        self.view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        imgBackground.image = img.alpha(0.3)
        viewPassed.layer.cornerRadius = 5.0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ContinueAction(_ sender: Any)
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
                
                 //aaliya 10 -> true passed the quiz
            }
        }
    }

}
