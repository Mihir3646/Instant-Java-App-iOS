//
//  CorrectViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 17/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit


class CorrectViewController: UIViewController
{
    var img = UIImage()
    var viewTransparent : UIView!

    @IBOutlet var imgBackground: UIImageView!
    
    @IBOutlet weak var viewCorrect: UIView!
    @IBOutlet var btnContinue: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       // let jjj : UIImage = img
        
        self.view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        let borderAlpha : CGFloat = 1.0 
        btnContinue.layer.borderWidth = 3.0
        btnContinue.layer.cornerRadius = 5.0
        btnContinue.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
      
        imgBackground.image = img.alpha(0.3)
        
        
//        viewTransparent = UIView()
//        viewTransparent.frame = self.view.frame
//        viewTransparent.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
//
//        self.view.addSubview(viewTransparent)
        
        viewCorrect.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueAction(_ sender: Any)
    {
        //aaliya 9 - true
        
        let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate
        
        let QUIZ_MCQ_VCObj = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: "Subtopic_DetailViewController") as! Subtopic_DetailViewController
        
        let final = appDelegate.arrallDetailAppdelegate.count
       
        if  (final == appDelegate.intPagenumberSubTopic) //if  (IntCount == appDelegate.intIndex1 )
        {
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
                    
                    print(appDelegate.arrSubtopicSelectedIndex.count)
                   // appDelegate.IntSubtopicSelected = defaults.object(forKey: "SubtopicselectedIndex") as! Int
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
           
         appDelegate.strMcqAppdelegate = ""
        appDelegate.intPagenumberSubTopic = 1 //aarti
            
            
            if let viewControllers: [UIViewController] = self.navigationController?.viewControllers
            {
                for aViewController in viewControllers {
                    if aViewController is SubTopicViewController {
                        self.navigationController!.popToViewController(aViewController, animated: true)
                        
                       
                    }
                }
            }
            else
            {
                print("")
            }
        }
        else
        {
            appDelegate.strMcqAppdelegate = "mcq"
            appDelegate.intPagenumberSubTopic = appDelegate.intPagenumberSubTopic + 1

            appDelegate.intIndex1 = appDelegate.intIndex1 + 1
//            intIndexValue = intIndexValue + 1
            self.navigationController?.popViewController(animated: false)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
