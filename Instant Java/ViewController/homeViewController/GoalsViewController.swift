//
//  GoalsViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 24/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController {
    @IBOutlet var btnRegular: UIButton!

    @IBOutlet var lblTimeScholar: UILabel!
    @IBOutlet var lblScholar: UILabel!
    @IBOutlet var btnScholar: UIButton!
    @IBOutlet var btnPro: UIButton!
    @IBOutlet var lblTimePro: UILabel!
    @IBOutlet var lblRegular: UILabel!
    @IBOutlet var lblTimeRegular: UILabel!
    @IBOutlet var lblPro: UILabel!
    @IBOutlet var lblCasual: UILabel!
    @IBOutlet var lblTimeCasual: UILabel!
    @IBOutlet var btnCasual: UIButton!
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        if appDelegate.strGoalSelected == "1" {
            greenColor(labelname: lblCasual, labeltime: lblTimeCasual, button: btnCasual)
            greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
            greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
            greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)
        }
        else if appDelegate.strGoalSelected == "2" {
            greenColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
            greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual)
            greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
            greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)
        }
        else if appDelegate.strGoalSelected == "3" {
            greenColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
            greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual)
            greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
            greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)
        }
        else
        {
            greenColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)
            greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual)
            greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
            greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
        }
        btnCasual.layer.cornerRadius = 8
        btnCasual.clipsToBounds = true
        btnRegular.layer.cornerRadius = 8
        btnRegular.clipsToBounds = true
        btnPro.layer.cornerRadius = 8
        btnPro.clipsToBounds = true
        btnScholar.layer.cornerRadius = 8
        btnScholar.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    //# MARK: - set color method
    
    func greyColor(labelname : UILabel , labeltime : UILabel , button : UIButton)
    {
        labelname.textColor = UIColor(hexString: "#6F7179")
        labeltime.textColor = UIColor(hexString: "#5C5E66")
        button.backgroundColor = UIColor(hexString: "#F5F9FA")
    }
    
    func greenColor(labelname : UILabel , labeltime : UILabel , button : UIButton)
    {
        labelname.textColor = UIColor.white
        labeltime.textColor = UIColor.white
        button.backgroundColor = colour.selectedGreen
    }
    
    
    @IBAction func CasualActon(_ sender: Any)
    {
        appDelegate.strGoalSelected = "1"
        greenColor(labelname: lblCasual, labeltime: lblTimeCasual, button: btnCasual)
        greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
        greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
        greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)
        

    }

    @IBAction func regularAction(_ sender: Any)
    {
        appDelegate.strGoalSelected = "2"
        greenColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
         greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual)
        greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
        greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)



    }
    @IBAction func ScholarAction(_ sender: Any)
    {
        appDelegate.strGoalSelected = "4"
        greenColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)
        greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual)
        greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
        greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
    }
   
    @IBAction func proAction(_ sender: Any)
    {
        appDelegate.strGoalSelected = "3"
         greenColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro)
         greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual)
         greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular)
        greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar)


    }
    @IBAction func DoneAction(_ sender: Any)
    {
         self.dismiss(animated: true) { }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
