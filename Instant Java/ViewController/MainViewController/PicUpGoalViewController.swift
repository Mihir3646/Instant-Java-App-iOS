//
//  PicUpGoalViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 04/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import Toaster
import Amplitude_iOS

class PicUpGoalViewController: UIViewController {
    
    //# MARK: - variable and  outlet
    let defaults = UserDefaults.standard

    var strPickupGoal = String()
    
    @IBOutlet var pickupLabel: UILabel!
    @IBOutlet var topLineView: UIView!
    @IBOutlet var btnCasual_Out: UIButton!
    @IBOutlet var lblTimeScholar: UILabel!
    @IBOutlet var lblTimePro: UILabel!
    @IBOutlet var lblTimeRegular: UILabel!
    @IBOutlet var lblTimeCasual: UILabel!
    @IBOutlet var lblPro: UILabel!
    @IBOutlet var lblScholar: UILabel!
    @IBOutlet var lblCasual: UILabel!
    @IBOutlet var lblRegular: UILabel!
    @IBOutlet var btnScholar_Out: UIButton!
    @IBOutlet var btnPro_Out: UIButton!
    @IBOutlet var btnRegular_Out: UIButton!
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate

    
      //# MARK: - View life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pickupLabel.text = "You can always change this\n goal later"
        self.strPickupGoal = lblTimeRegular.text!
        topLineView.layer.cornerRadius = topLineView.frame.height/2
        topLineView.clipsToBounds = true
        btnCasual_Out.layer.cornerRadius = 8
        btnCasual_Out.clipsToBounds = true
        btnRegular_Out.layer.cornerRadius = 8
        btnRegular_Out.clipsToBounds = true
        btnPro_Out.layer.cornerRadius = 8
        btnPro_Out.clipsToBounds = true
        btnScholar_Out.layer.cornerRadius = 8
        btnScholar_Out.clipsToBounds = true
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
    
     //# MARK: - button action
    
    @IBAction func Scholar_Action(_ sender: Any)
    {
        appDelegate.strGoalSelected = "4"
        greenColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar_Out)
       greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual_Out)
        greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular_Out)
        greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro_Out)
        self.strPickupGoal = lblTimeScholar.text!
    }
    @IBAction func Pro_Action(_ sender: Any)
    {
        appDelegate.strGoalSelected =  "3"
        greenColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro_Out)
        greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual_Out)
        greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular_Out)
        greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar_Out)
        self.strPickupGoal = lblTimePro.text!
    }
    @IBAction func Regular_Action(_ sender: Any)
    {
        appDelegate.strGoalSelected =  "2"
        greenColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular_Out)
        greyColor(labelname: lblCasual, labeltime:lblTimeCasual, button: btnCasual_Out)
        greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro_Out)
        greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar_Out)
        self.strPickupGoal = lblTimeRegular.text!
    }
    @IBAction func Casual_Action(_ sender: Any)
    {
        appDelegate.strGoalSelected =  "1"
        greenColor(labelname: lblCasual, labeltime: lblTimeCasual, button: btnCasual_Out)
        greyColor(labelname: lblRegular, labeltime: lblTimeRegular, button: btnRegular_Out)
        greyColor(labelname: lblPro, labeltime: lblTimePro, button: btnPro_Out)
        greyColor(labelname: lblScholar, labeltime: lblTimeScholar, button: btnScholar_Out)
        self.strPickupGoal = lblTimeCasual.text!
    }
    
    
    @IBAction func Next_Action(_ sender: Any)
    {
        if appDelegate.isThirdTopic
        {
            dismiss(animated: true, completion: nil)
        }
        else
        {
            settttNext()
            //amplitude
            Amplitude.instance().logEvent("onboarding_goal_setting_completed")
        }
    }
    
    func settttNext()
    {
        let LoginViewController = StorybordId.MainstoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        LoginViewController.strGoal = self.strPickupGoal
        
        appDelegate.strOnbonding = 4
        defaults.set(appDelegate.strOnbonding, forKey: "onbonding")
        self.present(LoginViewController, animated:true, completion:nil)    
    }
    
    //# MARK: - memory menagement -
    override func didReceiveMemoryWarning()
       {
             super.didReceiveMemoryWarning()
       }
    
}
