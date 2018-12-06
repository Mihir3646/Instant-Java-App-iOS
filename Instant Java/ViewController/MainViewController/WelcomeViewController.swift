//
//  WelcomeViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 04/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import Toaster
import Amplitude_iOS

class WelcomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    //# MARK: - outlet and variable
    let defaults = UserDefaults.standard

    var isHidden:Bool = true
    var selectedIndex = -1
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var topViewLine: UIView!
    @IBOutlet var imgmain: UIImageView!
    @IBOutlet var studentView: UIView!
    @IBOutlet var lblSelect: UILabel!
    @IBOutlet var tapView: UIView!
    @IBOutlet var lblProfession: UILabel!
    @IBOutlet var selectProfession_Out: UIButton!
    @IBOutlet var tableview_Out: UITableView!
    @IBOutlet var pursuingView: UIView!
    @IBOutlet var lblPursuingText: UILabel!
    @IBOutlet var imgProfession: UIImageView!
    @IBOutlet var lblPursuing: UILabel!
    @IBOutlet var imgPursuing: UIImageView!
    @IBOutlet var CurrentlyView: UIView!
    @IBOutlet var Next_Out: UIButton!
    @IBOutlet var lblCurrentlyText: UILabel!
    @IBOutlet var imgCurrently: UIImageView!
    @IBOutlet var lblCurrently: UILabel!

    
    //# MARK: - static Array -
    
    var tempArr:[Int] = Array()
    var Result:[String] = []
    var professionArry:[String] = []
    var StudentPursingArry:[String] = []
    var SchoolStudentArr:[String] = []
    var DiplomaStudentArr:[String] = []
    var GraduateStudentArr:[String] = []
    var EngineeringArry:[String] = []
    var MasterDegreeStudentArry:[String] = []
    var phDStudentArry:[String] = []
    var PartTimeStudentArry:[String] = []
    var TeacherArry:[String] = []
    var WorkingArr:[String] = []

    
    //# MARK: - View life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        topViewLine.layer.cornerRadius = topViewLine.frame.height/2
        topViewLine.clipsToBounds = true
        initializaArray()
        tableview_Out.delegate = self
        tableview_Out.dataSource = self
        Result = professionArry
        tableview_Out.reloadData()
    }
    
    func initializaArray()
    {
         professionArry = ["Student","Working Professional","Teacher/Professor/Mentor"]
         StudentPursingArry = ["School Student","Diploma Student","Graduation Student","Engineering Student","Master Degree Student","phD Student","Part Time Program Student"]
         SchoolStudentArr = ["1st Std","2nd Std","3rd Std","4th Std","5th Std","6th Std","7th Std","8th Std","9th Std","10th Std","11th Std","12th Std"]
         DiplomaStudentArr = [ "Com Science/IT (First Year)","Com Science/IT (Second Year)","Com Science/IT (Third Year)","Others (First Year)","Others (Second Year)","Others (Third Year)"]
         GraduateStudentArr = [ "BSc. Com Science (First Year)","BSc. Com Science (Second Year)","BSc. Com Science (Third Year)","BSc. IT (First Year)","BSc. IT (Second Year)","BSc. IT (Third Year)","BA (First Year)","BA (Second Year)","BA (Third Year)","BCom (First Year)","BCom (Second Year)","BCom (Third Year)","BSc. Others (First Year)","BSc. Others (Second Year)","BSc. Others (Third Year)"]
        EngineeringArry = ["Computer Science/IT (First Year)","Computer Science/IT (Second Year)","Computer Science/IT (Third Year)","Computer Science/IT (Fourth Year)","Others (First Year)","Others (Second Year)","Others (Third Year)","Others (Fourth Year)"]
        MasterDegreeStudentArry = [ "Computer Science/IT Category","Others"]
        phDStudentArry = [ "Computer Science/IT Category","Others"]
        PartTimeStudentArry = ["Programming Language(Java/C++)","Programming Technology(Android/Web/Back-End)","Online Certification Program","Others"]
        TeacherArry = ["School","Graduation College","Engineering College","Professional Training Institute","Other"]
         WorkingArr = ["IT Domain(Developer/Tester etc)","Other Domain"]
    }
    
    //# MARK: - tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return self.Result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
         let cell:CategoryTableViewCell = self.tableview_Out.dequeueReusableCell(withIdentifier: "cell") as! CategoryTableViewCell!
        
         cell.lblCategory_Out.text = Result[indexPath.row]
         return cell
    }
    
    func tableviewFrame(button : UIButton)
    {
        let x : CGFloat = button.frame.origin.x
        let width : CGFloat = button.frame.size.width
        let heightTable : CGFloat = tableview_Out.contentSize.height
        let y : CGFloat = button.frame.origin.y + button.frame.height + 2
        let height = (ScreenSize.Height - y) - 20
        var finalheight : CGFloat = 0.0
        if heightTable < height
        {
            finalheight = heightTable
        }
        else
        {
            finalheight = height
        }
        tableview_Out.frame = CGRect(x: x, y: y, width: width, height: finalheight)
    }
    
    //# MARK: - tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedIndex = indexPath.row
        if Result == professionArry
        {
                 if selectedIndex == 0
                 {
                         lblProfession.text = "Student"
                         tableview_Out.isHidden = true
                         isHidden=true
                         lblPursuing.text = "Pursuing as"
                         lblCurrentlyText.text = Select
                         lblPursuingText.text = Select
                         lblPursuingText.textColor = UIColor.gray
                         lblCurrentlyText.textColor = UIColor.gray
                         studentView.isHidden = true
                 }
                 else if selectedIndex == 1
                 {
                         lblProfession.text = "Working Professional"
                         tableview_Out.isHidden = true
                         isHidden=true
                         lblPursuing.text = "Currently in"
                         CurrentlyView.isHidden = true
                         CurrentlyIn_Out.isHidden = true
                         imgCurrently.isHidden = true
                         lblCurrentlyText.isHidden = true
                         lblCurrently.isHidden = true
                         lblPursuingText.text = Select
                         lblPursuingText.textColor = UIColor.gray
                }
                else if selectedIndex == 2
                {
                        lblProfession.text = "Teacher/Professor/Mentor"
                        tableview_Out.isHidden = true
                        isHidden=true
                        lblPursuing.text = "Currently in"
                        CurrentlyView.isHidden = true
                        CurrentlyIn_Out.isHidden = true
                        imgCurrently.isHidden = true
                        lblCurrentlyText.isHidden = true
                        lblCurrently.isHidden = true
                        lblPursuingText.text = Select
                        lblPursuingText.textColor = UIColor.gray
                 }
                 studentView.isHidden = true
                 lblPursuingText.text = Select
                 pursuingView.isHidden = false
                 lblProfession.textColor = colour.welcome
                 lblPursuing.isHidden = false
                 Pursuing_Out.isHidden = false
                 imgPursuing.isHidden = false
                 lblPursuingText.isHidden = false
                 Next_Out.isEnabled = false
                 Next_Out.backgroundColor = UIColor.lightGray
        }
        else if Result == StudentPursingArry
        {
            
                 lblPursuingText.text = Result[indexPath.row]
                 tableview_Out.isHidden = true
                 isHidden=true
                 lblPursuingText.textColor = colour.welcome
                 lblProfession.isHidden = false
                 selectProfession_Out.isHidden = false
                 imgProfession.isHidden = false
                 CurrentlyView.isHidden = false
                 lblCurrently.isHidden = false
                 CurrentlyIn_Out.isHidden = false
                 imgCurrently.isHidden = false
                 lblCurrentlyText.isHidden = false
                 Next_Out.isEnabled = true
                 Next_Out.backgroundColor = colour.welcome
                 pursuingView.isHidden = true
                 lblCurrentlyText.text = Select
        }
        else if Result == TeacherArry
        {
                 lblPursuingText.text = Result[indexPath.row]
                 tableview_Out.isHidden = true
                 isHidden=true
                 lblPursuingText.textColor = colour.welcome
                 lblProfession.isHidden = false
                 selectProfession_Out.isHidden = false
                 imgProfession.isHidden = false
                 Next_Out.isEnabled = true
                 Next_Out.backgroundColor = colour.welcome
                 pursuingView.isHidden = true
        }
        else if Result == WorkingArr
        {
                 lblPursuingText.text = Result[indexPath.row]
                 tableview_Out.isHidden = true
                 isHidden=true
                 lblPursuingText.textColor = colour.welcome
                 lblProfession.isHidden = false
                 selectProfession_Out.isHidden = false
                 imgProfession.isHidden = false
                 Next_Out.isEnabled = true
                 Next_Out.backgroundColor = colour.welcome
                 pursuingView.isHidden = true
        }
        else if Result == SchoolStudentArr
        {
                lblCurrentlyText.text = Result[indexPath.row]
                tableview_Out.isHidden = true
                isHidden=true
                lblCurrentlyText.textColor = colour.welcome
                CurrentlyView.isHidden = true
        }
        else if Result == DiplomaStudentArr
        {
               lblCurrentlyText.text = Result[indexPath.row]
               tableview_Out.isHidden = true
               isHidden=true
               lblCurrentlyText.textColor = colour.welcome
               CurrentlyView.isHidden = true
        }
        else if Result == GraduateStudentArr
        {
               lblCurrentlyText.text = Result[indexPath.row]
               tableview_Out.isHidden = true
               isHidden=true
               lblCurrentlyText.textColor = colour.welcome
               CurrentlyView.isHidden = true
        }
       else if Result == EngineeringArry
        {
                lblCurrentlyText.text = Result[indexPath.row]
                tableview_Out.isHidden = true
                isHidden=true
                lblCurrentlyText.textColor = colour.welcome
                CurrentlyView.isHidden = true
            
        }
       else if Result == MasterDegreeStudentArry
        {
                lblCurrentlyText.text = Result[indexPath.row]
                tableview_Out.isHidden = true
                isHidden=true
                lblCurrentlyText.textColor = colour.welcome
                CurrentlyView.isHidden = true
        }
        else if Result == phDStudentArry
        {
                lblCurrentlyText.text = Result[indexPath.row]
                tableview_Out.isHidden = true
                isHidden=true
                lblCurrentlyText.textColor = colour.welcome
                CurrentlyView.isHidden = true
        }
        else if Result == PartTimeStudentArry
        {
               lblCurrentlyText.text = Result[indexPath.row]
               tableview_Out.isHidden = true
               isHidden=true
               lblCurrentlyText.textColor = colour.welcome
               CurrentlyView.isHidden = true
        }
        tableview_Out.reloadData()
    }
    

    //# MARK: - api call class
   
    
   //# MARK: - button action
    
    @IBAction func Selectprofession_Action(_ sender: Any)
    {
           CurrentlyView.isHidden = true
           pursuingView.isHidden = true
           CurrentlyIn_Out.isHidden = true
           imgCurrently.isHidden = true
           lblCurrentlyText.isHidden = true
           lblCurrently.isHidden = true

          if isHidden
          {
                  Result = professionArry
                  tableview_Out.frame = CGRect(x: selectProfession_Out.frame.origin.x, y: studentView.frame.origin.y+2, width: selectProfession_Out.frame.width, height: 154)
                  tableview_Out.isHidden = false
                  isHidden=false
                  tableview_Out.reloadData()
          }
         else
         {
                  tableview_Out.isHidden = true
                  isHidden=true
         }
        
         if Pursuing_Out.isHidden == false
         {
                pursuingView.isHidden = false
                lblPursuingText.isHidden = false
                imgPursuing.isHidden = false
                selectProfession_Out.isHidden = false
                imgProfession.isHidden =  false
                lblProfession.isHidden = false
         }
         else if lblPursuingText.text != Select
         {
                pursuingView.isHidden = true
         }
        
          Result = professionArry
          tableview_Out.frame = CGRect(x: tableview_Out.frame.origin.x, y: tableview_Out.frame.origin.y, width: tableview_Out.frame.size.width, height: tableview_Out.contentSize.height)
          tableview_Out.reloadData()
        
    }
    
    @IBOutlet var Pursuing_Out: UIButton!
    @IBAction func Pursuing_Action(_ sender: Any)
    {
               CurrentlyView.isHidden = true
               if isHidden
               {
                      CurrentlyView.isHidden = true
                      tableview_Out.isHidden = false
                      isHidden=false
                       if lblCurrentlyText.text != Select
                       {
                               CurrentlyView.isHidden = false
                       }
                       if CurrentlyIn_Out.isHidden == true
                       {
                               CurrentlyView.isHidden = true
                       }
                }
                else
                {
                              CurrentlyView.isHidden = true
                              tableview_Out.isHidden = true
                              isHidden=true
                              lblProfession.isHidden = false
                              selectProfession_Out.isHidden = false
                              imgProfession.isHidden = false
                }
                if  lblProfession.text == "Student"
                {
           
                              lblProfession.isHidden = true
                              selectProfession_Out.isHidden = true
                              imgProfession.isHidden = true
                              Result = StudentPursingArry
                              tableview_Out.reloadData()
                }
                else if lblProfession.text == "Teacher/Professor/Mentor"
                {
                             Result = TeacherArry
                             tableview_Out.reloadData()
                }
                else if lblProfession.text == "Working Professional"
                {
                              Result = WorkingArr
                              tableview_Out.reloadData()
                }
                if lblPursuingText.text == Select
                {
                              selectProfession_Out.isHidden = false
                              lblProfession.isHidden = false
                              imgProfession.isHidden = false
                }
               if CurrentlyIn_Out.isHidden == false
               {
                              CurrentlyIn_Out.isHidden = false
                              lblCurrentlyText.isHidden = false
                              lblCurrently.isHidden = false
                              CurrentlyView.isHidden = false
               }
               if Pursuing_Out.isHidden == false
               {
                              pursuingView.isHidden = false
                              lblPursuingText.isHidden = false
                              imgPursuing.isHidden = false
                              selectProfession_Out.isHidden = false
                              imgProfession.isHidden =  false
                              lblProfession.isHidden = false
             }
            else if lblCurrentlyText.text != Select
            {
                              CurrentlyView.isHidden = true
            }
            if lblPursuingText.text != Select
            {
                             pursuingView.isHidden = true
            }
        
        tableviewFrame(button: Pursuing_Out)
        tableview_Out.reloadData()
    }
    
    @IBOutlet var CurrentlyIn_Out: UIButton!
    @IBAction func CurrentlyIn_Action(_ sender: Any)
    {
             if isHidden
             {
                     tableview_Out.isHidden = false
                     isHidden=false
            }
            else
            {
                     tableview_Out.isHidden = true
                     isHidden=true
            }
            if lblPursuingText.text == "School Student"
            {
                     Result = SchoolStudentArr
            }
            else if lblPursuingText.text == "Diploma Student"
            {
                     Result = DiplomaStudentArr
            }
            else  if lblPursuingText.text == "Graduation Student"
            {
                     Result = GraduateStudentArr
            }
            else if lblPursuingText.text == "Engineering Student"
            {
                     Result = EngineeringArry
            }
            else if lblPursuingText.text == "Master Degree Student"
            {
                     CurrentlyView.isHidden = false
                    Result = MasterDegreeStudentArry
            }
            else  if lblPursuingText.text == "phD Student"
            {
                    CurrentlyView.isHidden = false
                     Result = phDStudentArry
            }
            else if lblPursuingText.text == "Part Time Program Student"
            {
           
                     CurrentlyView.isHidden = false
                     Result = PartTimeStudentArry
            
            }
        tableviewFrame(button: CurrentlyIn_Out)
        tableview_Out.reloadData()
        }
    
       @IBAction func NextAction(_ sender: Any)
       {
        
        //amplitude
        Amplitude.instance().logEvent("onboarding_profession_details_given")
        let prof = lblProfession.text!
        let pursuing = lblPursuingText.text!
        
        var subcategory : String = ""
        var currentlyIn : String = ""
        
        if(prof == "Student"){
            subcategory = pursuing
            currentlyIn = lblCurrentlyText.text!
            
        }else{
            subcategory = prof
            currentlyIn = lblPursuingText.text!
        }
        

        let id1 = AMPIdentify().set("subcategory", value: prof as NSObject!)
        Amplitude.instance().identify(id1)
        
        let id2 = AMPIdentify().set("currentlyin", value: currentlyIn as NSObject!)
        Amplitude.instance().identify(id2)
        
        setupNExt()
        
        
        }
    
    func setupNExt()
    {
        let nextViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: "PicUpGoalViewController") as! PicUpGoalViewController
        
        defaults.set(self.lblProfession.text!, forKey: "profession")
        
        defaults.set(self.lblPursuingText.text!, forKey: "pursuing")
        
        
        
        if lblCurrentlyText.text == Select
            
        {
            
            defaults.set("", forKey: "currentlyIn")
            
        }
            
        else
            
        {
            
            defaults.set(lblCurrentlyText.text!, forKey: "currentlyIn")
            
        }
        
        
        
        appDelegate.strOnbonding = 3
        
        defaults.set(appDelegate.strOnbonding, forKey: "onbonding")
        
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    //# MARK: - Memory management
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}


