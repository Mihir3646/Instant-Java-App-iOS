//
//  Quiz_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 14/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class Quiz_VC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arroption = NSArray()
    
    @IBOutlet weak var tblQuiz: UITableView!
    var Strlbl = String()

    var StrCorrectAnswer = String()

    var arrQuiz = NSArray()
    var arrQuiz_Question =  NSArray()
    var arrQuiz_Option =  NSArray()
    var arrQuiz_Wronganswer =  NSArray()
    var arrQuiz_CorrectOption =  NSArray()
    var StrQuestion = String()
    var StrCorrectOption = String()
    var StrWrongReason = String()
    var isTouch = Bool()
    
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var tblView: UITableView!
    @IBOutlet var lblQuestion: UILabel!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        isTouch = false
        
        tblQuiz.isUserInteractionEnabled = true
        
        self.arrQuiz = appDelegate.arrQuizAppdelegate
        print(self.arrQuiz)
        tblView.delegate = self
        tblView.dataSource = self
        tblView.estimatedRowHeight = 44.0
        tblView.rowHeight = UITableViewAutomaticDimension
        
        self.arrQuiz_Question = self.arrQuiz.value(forKey: "quizquestion") as! NSArray
        
        self.arrQuiz_CorrectOption = self.arrQuiz.value(forKey: "correctoption") as! NSArray
        self.arrQuiz_Option = self.arrQuiz.value(forKey: "quizoptions") as! NSArray
        print(self.arrQuiz_Option)
        
        lblQuestion.text = self.arrQuiz_Question[appDelegate.intIndexQuiz] as? String
        self.StrCorrectOption = self.arrQuiz_CorrectOption[appDelegate.intIndexQuiz] as! String
        self.arroption = self.self.arrQuiz_Option[appDelegate.intIndexQuiz] as! NSArray
        tblView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableview datasource  -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arroption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:QuizTableViewCell = self.tblView.dequeueReusableCell(withIdentifier: "cell") as! QuizTableViewCell!
      
        cell.lblOption.text = " " + " " + (self.arroption[indexPath.row] as! String)
         self.StrCorrectAnswer = self.arrQuiz_CorrectOption[indexPath.row] as! String
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    
    // MARK: - Tableview datasource -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let indexPath = tblView.indexPathForSelectedRow
        let cell : QuizTableViewCell! = tblView.cellForRow(at: indexPath! ) as! QuizTableViewCell
        self.Strlbl = self.arroption[indexPath!.row] as! String
        print(self.Strlbl)
        self.StrCorrectAnswer = self.arrQuiz_CorrectOption[appDelegate.intIndexQuiz] as! String
        cell.viewBg.isUserInteractionEnabled = true
        print(self.StrCorrectAnswer)
       
        let passViewControllerObj = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:"passViewController") as! passViewController
        let failQuizViewControllerObj = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:"failQuizViewController") as! failQuizViewController
        let Quiz_VC = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: "Subtopic_DetailViewController") as! Subtopic_DetailViewController
        let IntCount = (appDelegate.arrQuizAppdelegate.count)-1 as Int
        var intIndexValue = appDelegate.intIndexQuiz as Int
      
        if  (IntCount == appDelegate.intIndexQuiz)
        {
            if !isTouch
            {
                isTouch = true
                
                if self.Strlbl.lowercased() ==  self.StrCorrectAnswer.lowercased()
                {
                    appDelegate.intCorrect = appDelegate.intCorrect + 1
                    cell.viewBg.backgroundColor = colour.selectedGreen
                }
                else
                {
                    cell.viewBg.backgroundColor = colour.failedPopup
                    
                }
                print(appDelegate.intCorrect)
              
                let when = DispatchTime.now() + 2 // change 2 to desired number of seconds

                if appDelegate.intCorrect >= 3
                {
                    passViewControllerObj.strScore = String(appDelegate.intCorrect) + "/" + String(self.arrQuiz_CorrectOption.count) + "Marks"
                    let window: UIWindow! = UIApplication.shared.keyWindow
                    
                    let windowImage = window.capture()
                    
                    passViewControllerObj.img = windowImage
                   // self.present(passViewControllerObj, animated:false, completion:nil)
                    DispatchQueue.main.asyncAfter(deadline: when)
                    {
                        self.performSegue(withIdentifier: "QuizToPass", sender: windowImage)
                    }
                }
                else
                {
                    failQuizViewControllerObj.strScore = String(appDelegate.intCorrect) + "/" + String(self.arrQuiz_CorrectOption.count) + "Marks"
                    let window: UIWindow! = UIApplication.shared.keyWindow
                    
                    let windowImage = window.capture()
                    
                    failQuizViewControllerObj.img = windowImage
                    
                    DispatchQueue.main.asyncAfter(deadline: when)
                    {
                        self.performSegue(withIdentifier: "QuizToFail", sender: windowImage)

                        //self.present(failQuizViewControllerObj, animated:false, completion:nil)
                    }
                    
                }
            }
        }
        else
        {
            if !isTouch
            {
                isTouch = true

                if   self.Strlbl.lowercased() == self.StrCorrectAnswer.lowercased()
                {
                    appDelegate.intCorrect = appDelegate.intCorrect + 1
                    cell.viewBg.backgroundColor = colour.selectedGreen
                }
                else
                {
                    cell.viewBg.backgroundColor = colour.failedPopup

                }

                print(appDelegate.intCorrect)

                appDelegate.intIndexQuiz = appDelegate.intIndexQuiz + 1
                
                let when = DispatchTime.now() + 2 // change 2 to desired number of seconds

                DispatchQueue.main.asyncAfter(deadline: when)
                                {
                let objHome = self.parent as! Subtopic_DetailViewController
                objHome.display()
                                    
                }
                
                //            QUIZ_MCQ_VCObj.intIndex = QUIZ_MCQ_VCObj.intIndex + 1
                //            intIndexValue = intIndexValue + 1
                
                
//                let vc = navigationController?.topViewController
//                 self.navigationController?.popToViewController(vc!, animated: true)
                
              //  self.navigationController?.popViewController(animated: true)
                
//                let viewControllers: [UIViewController] = self.navigationController!.viewControllers
//                for aViewController in viewControllers
//                {
//                    if aViewController is Subtopic_DetailViewController
//                    {
//                        self.navigationController?.popToViewController(aViewController, animated: true)
//                    }
//                }
                
                
                //self.navigationController?.popViewController(animated: true)
//                DispatchQueue.main.asyncAfter(deadline: when)
//                {
//                    let viewControllers: [UIViewController] = self.navigationController!.viewControllers
//                    for aViewController in viewControllers {
//                        if aViewController is Subtopic_DetailViewController {
//                            self.navigationController!.popToViewController(aViewController, animated: true)
//                        }
//                    }
//
//
////                    let vc = self.navigationController?.topViewController as! Quiz_VC
////                    self.navigationController?.popToViewController(vc, animated: false)
//
                 //   self.present(Quiz_VC, animated:false, completion:nil)
                
//                self.dismiss(animated: false, completion: nil)
                
//                }
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier ==  "QuizToPass"
        {
            let vc = segue.destination as! passViewController
            vc.img = (sender as? UIImage)!
            vc.strScore = String(appDelegate.intCorrect)
        }
        else if segue.identifier ==  "QuizToFail"
        {
            let vc = segue.destination as! failQuizViewController
            vc.img = (sender as? UIImage)!
            vc.strScore = String(appDelegate.intCorrect)
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
