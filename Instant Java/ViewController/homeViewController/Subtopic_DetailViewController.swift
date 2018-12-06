//
//  Subtopic_DetailViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 14/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class Subtopic_DetailViewController: UIViewController
{
    // MARK: - Outlet and variable -
    
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate
    
    var intPageNumber = 1
    var intIndex = 0
    var strTitle =  String()
    var strQuiz_Mcq_Question =  NSArray()
    var arrDetail =  NSArray()
    var arrDetailType =  NSArray()
    var arrDetailContent =  NSArray()
    var arrQuiz_Mcq_Wronganswer =  NSArray()
    var arrQuiz_Mcq_CorrectOption =  NSArray()
    var arrHeader =  NSArray()
    var arrCode =  NSArray()

    var arrMCQ =  NSArray()
    var strTypeMatch = String()
    var arrQuiz_Mcq_Option =  NSArray()
    var arrDetailimg =  NSArray()
    var DicDetailtopic =  NSDictionary()
    
    @IBOutlet var bottomview: UIView!
    @IBOutlet var popupview: UIView!

    @IBOutlet var lblPageNumber: UILabel!
    @IBOutlet var bottomLineView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnNext: UIButton!
    @IBOutlet var btnPrevious: UIButton!
    @IBOutlet var childView: UIView!
    
    @IBOutlet weak var viewSuper: UIView!
    
    @IBOutlet weak var layoutHeight: NSLayoutConstraint!
    
     // MARK: - view life cycle -
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
       // intIndex = appDelegate.intPagenumberSubTopic
        
        strTitle = appDelegate.strsubtopicAppdelegate
        self.arrDetail = appDelegate.arrallDetailAppdelegate
        lblPageNumber.text = String(appDelegate.intPagenumberSubTopic) + "/" + String(self.arrDetail.count)

        print(appDelegate.arrallDetailAppdelegate)
        
        print(self.arrDetail)
       
        self.arrDetailType = self.arrDetail.value(forKey: "type") as! NSArray
        self.arrDetailimg = self.arrDetail.value(forKey: "mediaurl") as! NSArray
        self.arrHeader = self.arrDetail.value(forKey: "headervalue") as! NSArray
        self.arrCode = self.arrDetail.value(forKey: "code") as! NSArray

        var str11 = String()
        
        if appDelegate.strsubtopicAppdelegate != "Quiz"
        {
          //  appDelegate.intPagenumberSubTopic = 0
            print(appDelegate.intPagenumberSubTopic)
            print(appDelegate.intPagenumberSubTopic)
            str11 = self.arrDetailType[appDelegate.intPagenumberSubTopic - 1] as! String
            print(str11)
        }
        
        if (str11 == viewControllerType.QUIZ_MCQ || str11 == viewControllerType.QUIZ_TF)
        {
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.QUIZ_MCQ_VC) as! QUIZ_MCQ_VC
//             SubViewInstance.intIndex = appDelegate.intIndex1
//             appDelegate.arrMCQAppdelegate = self.arrMCQ
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
            // display()
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
        }
        else if appDelegate.strsubtopicAppdelegate == "Quiz" //&& str11 == viewControllerType.Quiz
        {
            
            self.strTitle = "Quiz"
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.Quiz_VC) as! Quiz_VC
           
            appDelegate.arrQuizAppdelegate = self.arrDetail
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
            // display()
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
        }
        else
        {
            for var i in 0..<self.arrDetail.count
            {
                self.strTypeMatch = self.arrDetailType[i] as! String
                
                if self.strTypeMatch == "QUIZ_TF" ||  self.strTypeMatch == "QUIZ_MCQ"
                {
                    self.arrMCQ = self.arrMCQ.adding(self.arrDetail[i]) as NSArray
                }
            }
            display()
        }
        self.lblTitle.text = strTitle.uppercased()
    }

     // MARK: - custom method -
   
    func setup()
    {
        layoutHeight.constant = 47
        bottomview.isHidden = false
        bottomLineView.isHidden = false
        
        var str = String()
        
        if strTitle != "Quiz"
        {
            intIndex = appDelegate.intPagenumberSubTopic - 1
            str = self.arrDetailType[intIndex] as! String
        }
        else
        {
            str = viewControllerType.Quiz
        }
        
        switch str
        {
        case viewControllerType.IMG_TXTP:
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.IMG_TXTP_VC) as! IMG_TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        case viewControllerType.H_IMG_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_IMG_TXT_VC) as! H_IMG_TXT_VC
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strcontent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
            
        case viewControllerType.H_IMG_TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_IMG_TXTP_ViewController) as! H_IMG_TXTP_ViewController
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
            
        case viewControllerType.H_IMG:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_IMG_VC) as! H_IMG_VC
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
            
        case viewControllerType.H_TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_TXTP_VC) as! H_TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.TXTP_VC) as! TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        case viewControllerType.IMG_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.IMG_TXT_VC) as! IMG_TXT_VC
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strcontent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.H_CODE_TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_CODE_TXTP_VC) as! H_CODE_TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            SubViewInstance.strCode = self.arrCode[intIndex] as! String
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.CODE_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.CODE_TXT_VC) as! CODE_TXT_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strContent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strCode = self.arrCode[intIndex] as! NSString
            print( SubViewInstance.strCode)
            configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
            
        case viewControllerType.H_CODE_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_CODE_TXT_VC) as! H_CODE_TXT_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strContent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strCode = self.arrCode[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        case viewControllerType.H_CODE:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_CODE_VC) as! H_CODE_VC
            
            SubViewInstance.strCode = self.arrCode[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        case viewControllerType.Quiz:
            
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.Quiz_VC)
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.QUIZ_MCQ:
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.QUIZ_MCQ_VC) as! QUIZ_MCQ_VC
            SubViewInstance.intIndex = appDelegate.intIndex1
            appDelegate.arrMCQAppdelegate = self.arrMCQ
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.QUIZ_TF:
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.QUIZ_MCQ_VC) as! QUIZ_MCQ_VC
            SubViewInstance.intIndex = appDelegate.intIndex1
            
            appDelegate.arrMCQAppdelegate = self.arrMCQ
            
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.TXT_VC) as! TXT_VC
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strContent = self.arrDetailContent[intIndex] as! String
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        default: ()
        break;
        }
    
        if appDelegate.intPagenumberSubTopic == 1 {
            btnPrevious.isEnabled = false
            btnPrevious.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        }
        else
        {
            btnPrevious.isEnabled = true
            btnPrevious.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        
        if appDelegate.intPagenumberSubTopic == arrDetailType.count
        {
            btnNext.titleLabel?.text = "Finish"
            btnNext.setTitle("Finish", for: UIControlState.normal)
        }
        
    }
    
    func display()
    {
        layoutHeight.constant = 47
        bottomview.isHidden = false
        bottomLineView.isHidden = false
        
        var str = String()
      
        if strTitle != "Quiz"
        {
            intIndex = appDelegate.intPagenumberSubTopic - 1
            str = self.arrDetailType[intIndex] as! String
        }
        else
        {
            str = viewControllerType.Quiz
        }
        
        switch str
        {
        case viewControllerType.IMG_TXTP:
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.IMG_TXTP_VC) as! IMG_TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
             SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            configureChildViewController(childController: SubViewInstance, onView: childView)

            break;
        case viewControllerType.H_IMG_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_IMG_TXT_VC) as! H_IMG_TXT_VC
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strcontent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String

             configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
            
        case viewControllerType.H_IMG_TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_IMG_TXTP_ViewController) as! H_IMG_TXTP_ViewController
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
      
        case viewControllerType.H_IMG:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_IMG_VC) as! H_IMG_VC
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
      
        case viewControllerType.H_TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_TXTP_VC) as! H_TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String

            configureChildViewController(childController: SubViewInstance, onView: childView)

            break;
            
        case viewControllerType.TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.TXTP_VC) as! TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        case viewControllerType.IMG_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.IMG_TXT_VC) as! IMG_TXT_VC
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strcontent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strImg = self.arrDetailimg[intIndex] as! String

            configureChildViewController(childController: SubViewInstance, onView: childView)

            break;
            
        case viewControllerType.H_CODE_TXTP:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_CODE_TXTP_VC) as! H_CODE_TXTP_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.arrcontent = self.arrDetailContent[intIndex] as! NSArray
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            SubViewInstance.strCode = self.arrCode[intIndex] as! String
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.CODE_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.CODE_TXT_VC) as! CODE_TXT_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strContent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strCode = self.arrCode[intIndex] as! NSString
            print( SubViewInstance.strCode)
            configureChildViewController(childController: SubViewInstance, onView: childView)
            break;
            
        case viewControllerType.H_CODE_TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_CODE_TXT_VC) as! H_CODE_TXT_VC
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strContent = self.arrDetailContent[intIndex] as! String
            SubViewInstance.strCode = self.arrCode[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String

            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        case viewControllerType.H_CODE:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.H_CODE_VC) as! H_CODE_VC
            
            SubViewInstance.strCode = self.arrCode[intIndex] as! String
            SubViewInstance.strHeader = self.arrHeader[intIndex] as! String
            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
        case viewControllerType.Quiz:
          
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.Quiz_VC) as! Quiz_VC
            configureChildViewController(childController: SubViewInstance, onView: childView)

            break;
            
        case viewControllerType.QUIZ_MCQ:
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.QUIZ_MCQ_VC) as! QUIZ_MCQ_VC
            SubViewInstance.intIndex = appDelegate.intIndex1
            appDelegate.arrMCQAppdelegate = self.arrMCQ
            configureChildViewController(childController: SubViewInstance, onView: childView)

            break;
            
        case viewControllerType.QUIZ_TF:
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0

            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.QUIZ_MCQ_VC) as! QUIZ_MCQ_VC
            SubViewInstance.intIndex = appDelegate.intIndex1

            appDelegate.arrMCQAppdelegate = self.arrMCQ

            
            configureChildViewController(childController: SubViewInstance, onView: childView)
            
            break;
            
        case viewControllerType.TXT:
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.TXT_VC) as! TXT_VC
            
            self.arrDetailContent = self.arrDetail.value(forKey: "content") as! NSArray
            SubViewInstance.strContent = self.arrDetailContent[intIndex] as! String
            configureChildViewController(childController: SubViewInstance, onView: childView)

            break;
        default: ()
        break;
        }
        
        if appDelegate.intPagenumberSubTopic == 1
        {
            btnPrevious.isEnabled = false
            btnPrevious.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        }
        else
        {
            btnPrevious.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
       
        if appDelegate.intPagenumberSubTopic == arrDetailType.count
        {
            btnNext.titleLabel?.text = "Finish"
            btnNext.setTitle("Finish", for: UIControlState.normal)
        }
        else
        {
            btnNext.titleLabel?.text = "Next"
            btnNext.setTitle("Next", for: UIControlState.normal)

        }
        
//        if btnNext.titleLabel?.text == "Finish"
//        {
//            let SubTopicViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.SubTopicViewController) as! SubTopicViewController
//            self.present(SubTopicViewController, animated:false, completion:nil)
//        }
    }
    // MARK: - button action -
    
    @IBAction func NextAction(_ sender: Any)
    {
        if btnNext.titleLabel?.text == "Finish"
        {
            appDelegate.intPagenumberSubTopic = 1
            
            let SubTopicViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.SubTopicViewController) as! SubTopicViewController
             let defaults = UserDefaults.standard
                     
            if appDelegate.ishome == true
            {
                if appDelegate.isSub == true {
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
                    
                    //appDelegate.IntSubtopicSelected = defaults.object(forKey: "SubtopicselectedIndex") as! Int

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
           self.navigationController?.popViewController(animated: true)
            
            //self.present(SubTopicViewController, animated:false, completion:nil)
        }
       else
        {
            appDelegate.intPagenumberSubTopic = appDelegate.intPagenumberSubTopic + 1 //aarti
            
            intPageNumber = intPageNumber + 1
            lblPageNumber.text = String(appDelegate.intPagenumberSubTopic) + "/" + String(self.arrDetail.count)
            btnPrevious.setTitleColor(UIColor.black, for: UIControlState.normal)
            btnPrevious.isEnabled = true
            intIndex = intIndex + 1
            display()
        }
    }
    
    @IBAction func BackAction(_ sender: Any)
    {
        appDelegate.intPagenumberSubTopic = 1
        
        let defaults = UserDefaults.standard

        let SubTopicViewControllerObj = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: "SubTopicViewController") as! SubTopicViewController
        if((UserDefaults.standard.array(forKey: "SubTopic")) != nil)
        {
            appDelegate.arrSubtopicSelectedIndex = defaults.object(forKey: "SubTopic") as! [Int]
        }
        
        self.navigationController?.popViewController(animated: true)
        //self.present(SubTopicViewControllerObj, animated:false, completion:nil)

    }
    @IBAction func PreviousAction(_ sender: Any)
    {
        appDelegate.intPagenumberSubTopic = appDelegate.intPagenumberSubTopic - 1

        
        intPageNumber = intPageNumber - 1
        lblPageNumber.text = String(appDelegate.intPagenumberSubTopic) + "/" + String(self.arrDetail.count) //aarti
        btnNext.isEnabled = true
        btnNext.setTitleColor(UIColor.black, for: UIControlState.normal)
//        intIndex = intIndex - 1
//        display()
        
        var str11 = String()

        if appDelegate.strsubtopicAppdelegate != "Quiz"
        {
            //  appDelegate.intPagenumberSubTopic = 0
            print(appDelegate.intPagenumberSubTopic)
            str11 = self.arrDetailType[appDelegate.intPagenumberSubTopic - 1] as! String
            print(str11)
        }
        
        if (str11 == viewControllerType.QUIZ_MCQ || str11 == viewControllerType.QUIZ_TF)
        {
            appDelegate.intIndex1 = appDelegate.intIndex1 - 1
            
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.QUIZ_MCQ_VC) as! QUIZ_MCQ_VC
            //             SubViewInstance.intIndex = appDelegate.intIndex1
            //             appDelegate.arrMCQAppdelegate = self.arrMCQ
            bottomview.isHidden = true
            bottomLineView.isHidden = true
            layoutHeight.constant = 0
            
             display()
            
            //configureChildViewController(childController: SubViewInstance, onView: childView)
        }
//        else if appDelegate.strsubtopicAppdelegate == "Quiz" //&& str11 == viewControllerType.Quiz
//        {
//            
//            self.strTitle = "Quiz"
//            //let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.Quiz_VC) as! Quiz_VC
//            
//            appDelegate.arrQuizAppdelegate = self.arrDetail
//            bottomview.isHidden = true
//            bottomLineView.isHidden = true
//            layoutHeight.constant = 0
//            
//            display()
//            //configureChildViewController(childController: SubViewInstance, onView: childView)
//        }
        else
        {
//            for var i in 0..<self.arrDetail.count
//            {
//                self.strTypeMatch = self.arrDetailType[i] as! String
//                
//                if self.strTypeMatch == "QUIZ_TF" ||  self.strTypeMatch == "QUIZ_MCQ"
//                {
//                    self.arrMCQ = self.arrMCQ.adding(self.arrDetail[i]) as NSArray
//                }
//            }
            display()
        }
        
    }
      // MARK: - memory management -
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

}
