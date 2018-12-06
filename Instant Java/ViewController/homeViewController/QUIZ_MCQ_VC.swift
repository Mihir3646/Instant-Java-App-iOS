//
//  QUIZ_MCQ_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 14/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit


class QUIZ_MCQ_VC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var arrQuiz_Mcq_Question =  NSArray()
    var arrQuiz_Mcq_Option =  NSArray()
    var arrQuiz_Mcq_Wronganswer =  NSArray()
    var arrQuiz_Mcq_CorrectOption =  NSArray()
    var StrQuestion = String()
    var StrCorrectOption = String()
    var StrWrongReason = String()
    var arrAllMsq = NSArray()
    var intIndex = Int()
    var strCount = Int()
    var arroption = NSArray()
    var strmatch = String()
    
    @IBOutlet var failedView: UIView!
    @IBOutlet var correctView: UIView!
    @IBOutlet var tblview: UITableView!
    @IBOutlet var lblQuestion: UILabel!
    
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tblview.estimatedRowHeight = 44.0
        tblview.rowHeight = UITableViewAutomaticDimension
        
        self.arrAllMsq = appDelegate.arrMCQAppdelegate
        print(self.arrAllMsq)
        tblview.delegate = self
        tblview.dataSource = self
        
        lblQuestion.text = StrQuestion as String
        print(self.arrAllMsq)
        self.arrQuiz_Mcq_Question = self.arrAllMsq.value(forKey: "quizquestion") as! NSArray
        self.arrQuiz_Mcq_Wronganswer = self.arrAllMsq.value(forKey: "wronganswerpopupvalue") as! NSArray
        self.arrQuiz_Mcq_CorrectOption = self.arrAllMsq.value(forKey: "quizcorrectoption") as! NSArray
        self.arrQuiz_Mcq_Option = self.arrAllMsq.value(forKey: "quizoptions") as! NSArray
        print(self.arrQuiz_Mcq_Option)
        self.strCount = self.arrQuiz_Mcq_Option.count - 1
        
        print(appDelegate.intIndex1)
        
        lblQuestion.text = self.arrQuiz_Mcq_Question[appDelegate.intIndex1] as? String
        self.StrCorrectOption = self.arrQuiz_Mcq_CorrectOption[appDelegate.intIndex1] as! String
        self.StrWrongReason = self.arrQuiz_Mcq_Wronganswer[appDelegate.intIndex1] as! String
        self.arroption = self.self.arrQuiz_Mcq_Option[appDelegate.intIndex1] as! NSArray
        tblview.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.layoutSubviews()
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
        
        let cell:QUIZ_MCQ_TableViewCell = self.tblview.dequeueReusableCell(withIdentifier: "cell") as! QUIZ_MCQ_TableViewCell!
        cell.lblOPtion.text = self.arroption[indexPath.row] as? String
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }

    // MARK: - Tableview datasource -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        strmatch = "right"
        let strOption = self.arroption[indexPath.row] as? String
        
        if StrCorrectOption.lowercased() as String == strOption?.lowercased()
        {
            let window: UIWindow! = UIApplication.shared.keyWindow
            let windowImage = window.capture()
            self.performSegue(withIdentifier: "QuizToCorrect", sender: windowImage)
        }
        else
        {
            let window: UIWindow! = UIApplication.shared.keyWindow
            let windowImage = window.capture()
            self.performSegue(withIdentifier: "QuizToWrong", sender: windowImage)
        }
    }
    
    @IBAction func tryagainAction(_ sender: Any)
    {
        if strmatch == "wrong"
        {
            //failedView.isHidden = true
        }
        else
        {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier ==  "QuizToCorrect"
        {
            let vc = segue.destination as! CorrectViewController
            
            let img : UIImage = (sender as? UIImage)!
            
            vc.img = (sender as? UIImage)!
        }
        else if segue.identifier ==  "QuizToWrong"
        {
            let vc = segue.destination as! failedViewController
            vc.img = (sender as? UIImage)!
            vc.strFailed = self.StrWrongReason as String
        }
    }

}
