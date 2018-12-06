//
//  SubTopicViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 13/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import Amplitude_iOS

class SubTopicViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // MARK: - variable and outlet
    var contain = Bool()
    var arrPage = NSArray()
    var arrSubtopicQuestion =  NSArray()
    var arrDuration =  NSArray()
    var arrStar =  NSArray()
   
    var isStar = Bool()
    var arrAllSubTopic =  NSArray()
    var dicDetailSubTopic = NSDictionary()
    var arrDetailSubTopicData =  NSArray()
    var strTitle =  String()
    var intSelectedIndex = 0
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var tblView: UITableView!
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

    // MARK: - view life cycle
    
    override func viewDidLoad()
    {
       
        super.viewDidLoad()
        
       
                // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.strTitle = appDelegate.strTitleAppdelegate
        self.arrSubtopicQuestion = appDelegate.arrSubtopicQuestionAppdelegate
        self.arrDuration = appDelegate.arrDurationAppdelegate
        self.arrAllSubTopic = appDelegate.arrAllSubTopicAppdelegate
        
        print(arrAllSubTopic.count)
        self.arrStar = self.arrAllSubTopic.value(forKey: "isstar") as! NSArray
        print(self.arrStar)
        self.arrPage = appDelegate.arrPage
        tblView.delegate = self
        tblView.dataSource = self
        lblTitle.text = strTitle.uppercased()
        tblView.reloadData()        
        
    }
    
    // MARK: - tableview datasource  -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrSubtopicQuestion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:SubTopicTableViewCell = self.tblView.dequeueReusableCell(withIdentifier: "cell") as! SubTopicTableViewCell!
        isStar = self.arrStar[indexPath.row] as! Bool
        
        if indexPath.row == defaults.object(forKey: "SubtopicselectedIndex") as! Int
        {
            cell.seperatorUP.isHidden = false
            cell.lblQuestion.textColor = UIColor.white
            cell.lblpage.textColor = UIColor.white
            cell.lblTime.textColor = UIColor.white
            cell.seperatorView.backgroundColor = colour.selectedGreen
            cell.lblQuestion.textColor = UIColor.white
            if isStar {
                cell.imgLock.frame =   CGRect(x: cell.imgLock.frame.origin.x, y:cell.imgLock.frame.origin.y, width: 15, height:15)
                cell.imgLock.image =  UIImage(named:"unfill_star")
                }
            else
            {
                  cell.imgLock.image = nil
            }
        }
        else
        {
            cell.lblQuestion.textColor = UIColor.lightGray
            cell.lblpage.textColor = UIColor.lightGray
            cell.lblTime.textColor = UIColor.lightGray
            cell.seperatorView.backgroundColor = colour.unselectedsItem
            cell.imgLock.image = UIImage(named:"lock")
            cell.seperatorUP.isHidden = true
            cell.seperatorDown.isHidden = true
        }
        print(appDelegate.arrayOfDict)
        
        if appDelegate.arrayOfDict.count == 0
        {
            var array = appDelegate.arrSubtopicSelectedIndex
            if array.count != 0 {
                var contain = array.contains(indexPath.row)
                if contain {
                    cell.imgRight.isHidden = false
                    
//                    let a = lblTitle.text!
//                    let b = cell.lblQuestion.text!
//                    let c = a+b

                    //let ampKey = HelperClass.removeSpecialChars(str: c)
                    
                    //amplitude
//                    if(HelperClass.getValSharedPrefObj(key: ampKey) == "true"){
//                   
//                        print(".........value  set alreay")
//                    }else{
//                        
                       // print("...........set val ------->\(lblTitle.text!+"-"+cell.lblQuestion.text!))")
                        //amplitude
                    
                        //HelperClass.setValSharedPerf(key: ampKey, value: "true")
                    //}
                    
                    Amplitude.instance().logEvent("topic_completed", withEventProperties: ["subTopicName":(lblTitle.text!+"-"+cell.lblQuestion.text!)])

                    cell.seperatorView.layer.frame = CGRect(x: cell.frame.origin.x, y:cell.contentView.frame.height-10, width: tblView.frame.width, height: cell.frame.size.height)
                    cell.seperatorView.layer.borderWidth = 1.0
                    cell.seperatorView.layer.borderColor = colour.selectedGreen.cgColor
                    cell.seperatorUP.isHidden = false
                    cell.seperatorDown.isHidden = false
                    cell.lblQuestion.textColor = colour.selectedGreen
                    cell.lblpage.textColor = colour.selectedGreen
                    cell.lblTime.textColor = colour.selectedGreen
                    cell.seperatorView.backgroundColor = colour.SelectedLightGreen
                   
                    if isStar {
                        cell.imgLock.frame =   CGRect(x: cell.imgLock.frame.origin.x, y:cell.imgLock.frame.origin.y, width: 15, height: 15)
                        cell.imgLock.image =  UIImage(named:"fill_star")
                        
                    }
                    else
                    {
                        cell.imgLock.image = nil
                        
                    }
                    
                }
            //}
        }

        }
        else
        {
            if((UserDefaults.standard.array(forKey: "SavedSubStringArray")) != nil)
            {
//                if let arrFinal = defaults.object(forKey: "SavedSubStringArray") as? NSArray
//                {
//                    if arrFinal.count > appDelegate.intHome
//                    {
//                        if let arr2 = arrFinal[appDelegate.intHome] as? NSArray
//                        {
//                            if arr2.count >= arrSubtopicQuestion.count
//                            {
//                                defaults.set(appDelegate.arrHomeSelectedIndex, forKey: "SavedStringArray")
//                            }
//                        }
//                    }
//                }
                
                    if appDelegate.ishome == true
                    {
                    var arraySub = appDelegate.arrSubtopicSelectedIndex
                    if arraySub.count != 0 {
                        var contain = arraySub.contains(indexPath.row)
                        if contain {
                            cell.imgRight.isHidden = false
                            //amplitude
                           // Amplitude.instance().logEvent("topic_completed2", withEventProperties: ["subTopicName": cell.lblQuestion.text!])
                            

                            cell.seperatorView.layer.frame = CGRect(x: cell.frame.origin.x, y:cell.contentView.frame.height-10, width: tblView.frame.width, height: cell.frame.size.height)
                            cell.seperatorView.layer.borderWidth = 1.0
                            cell.seperatorView.layer.borderColor = colour.selectedGreen.cgColor
                            
                            cell.lblQuestion.textColor = colour.selectedGreen
                            cell.lblpage.textColor = colour.selectedGreen
                            cell.lblTime.textColor = colour.selectedGreen
                            cell.seperatorView.backgroundColor = colour.SelectedLightGreen
                            cell.seperatorUP.isHidden = false
                            cell.seperatorDown.isHidden = false
                            
                            if isStar {
                                cell.imgLock.frame =   CGRect(x: cell.imgLock.frame.origin.x, y:cell.imgLock.frame.origin.y, width: 15, height: 15)
                                cell.imgLock.image =  UIImage(named:"fill_star")
                                                                   }
                            else
                            {
                                cell.imgLock.image = nil
                            }
                      
                        }
                        }
                }
                else
                {
                var arrayData = defaults.object(forKey: "SavedSubStringArray") as! NSArray
               
                    if arrayData.count > appDelegate.intHome
                    {
                        var arrayDataHome = arrayData[appDelegate.intHome] as! NSArray
                        
                        var contain = arrayDataHome.contains(indexPath.row)
                        if contain {
                            cell.imgRight.isHidden = false
                            //amplitude
                           // Amplitude.instance().logEvent("topic_completed3", withEventProperties: ["subTopicName": cell.lblQuestion.text!])
                            
                            cell.seperatorView.layer.frame = CGRect(x: cell.frame.origin.x, y:cell.contentView.frame.height-10, width: tblView.frame.width, height: cell.frame.size.height)
                            cell.seperatorView.layer.borderWidth = 1.0
                            cell.seperatorView.layer.borderColor = colour.selectedGreen.cgColor
                            
                            cell.lblQuestion.textColor = colour.selectedGreen
                            cell.lblpage.textColor = colour.selectedGreen
                            cell.lblTime.textColor = colour.selectedGreen
                            cell.seperatorView.backgroundColor = colour.SelectedLightGreen
                            cell.seperatorUP.isHidden = false
                            cell.seperatorDown.isHidden = false
                            
                            if isStar {
                                cell.imgLock.frame =   CGRect(x: cell.imgLock.frame.origin.x, y:cell.imgLock.frame.origin.y, width: 15, height: 15)
                                cell.imgLock.image =  UIImage(named:"fill_star")
                            }
                            else
                            {
                                cell.imgLock.image = nil
                            }
                        }

                    }
                    
                    }
                }
            }
            if indexPath.row == self.arrSubtopicQuestion.count-1 {
            cell.seperatorDown.isHidden = true
        }
        if indexPath.row == 0  {
            cell.seperatorUP.isHidden = true
            
        }
        cell.lblpage.text = self.arrPage[indexPath.row] as! String + " " + "pages"
        cell.lblTime.text = self.arrDuration[indexPath.row] as? String
        cell.lblQuestion.text = self.arrSubtopicQuestion[indexPath.row] as? String
        
        
                
       // cell.seperatorView.frame = CGRect(x: cell.frame.origin.x, y:cell.contentView.frame.height-9, width: tblView.frame.width, height: 9)
         cell.imgLock.isHidden  = true
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - Tableview datasource -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(appDelegate.arrHomeSelectedIndex)
        
        //When user goes to 1st subtopic of 3rd topic
        if appDelegate.isThirdTopic
        {
            let strPurchase =  HelperClass.getValSharedPrefObj(key: "isPurchase")
            if strPurchase == "" || strPurchase == "false"
            {
                let alertController = UIAlertController(title: "Instant Java", message: "Please buy to proceed.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "Buy", style: .default, handler: { (UIAlertAction) in
                    self.performSegue(withIdentifier: "ToBuy", sender: nil)
                })
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
                return
            }
        }
        
        // aaliya 7 - false
        let isFirstIndex : String = HelperClass.getValSharedPrefObj(key: "isFirstIndex") as! String
        if(isFirstIndex == "true" && indexPath.row == 0){
            
            //amplitude
            Amplitude.instance().logEvent("course_completed", withEventProperties: ["is_complete": "false"])
            HelperClass.setValSharedPerf(key: "isFirstIndex", value: "false")
            print("-------aaliya --- is_complete = false")
        }

        
        //aaliya 7 - true
        let isLastIndex : String = HelperClass.getValSharedPrefObj(key: "isLastIndex") as! String
        if(isLastIndex == "true" && indexPath.row == arrSubtopicQuestion.count - 2){
            
            //amplitude
            Amplitude.instance().logEvent("course_completed", withEventProperties: ["is_complete": "true"])
            HelperClass.setValSharedPerf(key: "isLastIndex", value: "false")
            print("-------aaliya --- is_complete = true")
        }

        
    
        appDelegate.isLastIndex = false

        let indexPath = tblView.indexPathForSelectedRow
         appDelegate.isStarAvailable = self.arrStar[indexPath!.row] as! Bool
        let cell : SubTopicTableViewCell! = tblView.cellForRow(at: indexPath! ) as! SubTopicTableViewCell
      
        if appDelegate.arrayOfDict.count == 0{
        
            let array = appDelegate.arrSubtopicSelectedIndex
            if array.count != 0 {
                contain = array.contains(indexPath!.row)
            }
        }
        else
        {
            if((UserDefaults.standard.array(forKey: "SavedSubStringArray")) != nil){
                
                
                if appDelegate.ishome == true{
                    
                    
                    let arraySub = appDelegate.arrSubtopicSelectedIndex
                    if arraySub.count != 0 {
                         contain = arraySub.contains(indexPath!.row)
                        
                    }
                }
            
            else
            {
                var arrayData = defaults.object(forKey: "SavedSubStringArray") as! NSArray
                
//                if arrayData.count > appDelegate.intHome
//                {
                    var arrayDataHome = arrayData[appDelegate.intHome] as! NSArray
                    
                    contain = arrayDataHome.contains(indexPath!.row)
               //  }
                }
            }
        }
        
        print(defaults.object(forKey: "SubtopicselectedIndex"))
        
        if  indexPath!.row == defaults.object(forKey: "SubtopicselectedIndex") as! Int  || contain
        {
            appDelegate.IntSubtopicSelected = defaults.object(forKey: "SubtopicselectedIndex") as! Int
            self.dicDetailSubTopic = self.arrAllSubTopic[(indexPath?.row)!] as! NSDictionary
        self.arrDetailSubTopicData = self.dicDetailSubTopic.value(forKey: "data") as! NSArray
            
        //let Subtopic_DetailViewControllerobj = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: "Subtopic_DetailViewController") as! Subtopic_DetailViewController
        
        appDelegate.arrallDetailAppdelegate = self.arrDetailSubTopicData
       
        //Subtopic_DetailViewControllerobj.strTitle = cell.lblQuestion.text!.uppercased()
     
       appDelegate.strsubtopicAppdelegate  = self.dicDetailSubTopic.value(forKey: "subtopic_name") as! String
        appDelegate.intIndex1 = 0
        appDelegate.intIndexQuiz = 0
            
        appDelegate.strMcqAppdelegate = ""
            //appDelegate.intPagenumberSubTopic = 0

        if indexPath!.row == self.arrAllSubTopic.count-1
        {
            if appDelegate.ishome == true
            {
                appDelegate.arrHomeSelectedIndex.append(appDelegate.IntHomeSelected)
                let defaults = UserDefaults.standard
                defaults.set(appDelegate.arrHomeSelectedIndex, forKey: "SavedStringArray")
                print(appDelegate.arrHomeSelectedIndex.count)
                appDelegate.IntHomeSelected = appDelegate.IntHomeSelected + 1
                defaults.set(appDelegate.IntHomeSelected, forKey: "homeselectedIndex")
                appDelegate.isLastIndex = true
            }
            
            }
          
            appDelegate.intsub = indexPath!.row
            if appDelegate.IntSubtopicSelected == appDelegate.intsub
            {
                appDelegate.isSub = true
            }
            else
            {
                appDelegate.isSub = false
            }
            
            let senderString = cell.lblQuestion.text!.uppercased()
            self.performSegue(withIdentifier: "SubHomeToSubDetail", sender: senderString)
            
        //self.present(Subtopic_DetailViewControllerobj, animated:true, completion:nil)
        }
    }
    
    // MARK: - Button action  -
    @IBAction func backAction(_ sender: Any)
    {
        let defaults = UserDefaults.standard
        if appDelegate.isstar == true {
              

        }
        
        self.navigationController?.popViewController(animated: true)
        
//        let HomeViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        self.present(HomeViewController, animated:false, completion:nil)
    }

    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        if segue.identifier ==  "SubHomeToSubDetail" {
            
            let vc = segue.destination as! Subtopic_DetailViewController
            
            vc.strTitle = (sender as? String)!
            
            //Subtopic_DetailViewControllerobj.strTitle = cell.lblQuestion.text!.uppercased()

        }
        
        
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }

    
    // MARK: - memory management
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
