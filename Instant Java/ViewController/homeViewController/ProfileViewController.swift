//
//  ProfileViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 24/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import SDWebImage
class ProfileViewController: UIViewController {

    @IBOutlet var txtContent: UILabel!
    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var imgProfilePic: UIImageView!
    
    @IBOutlet var lblStar: UILabel!
    
    @IBOutlet var lblpage: UILabel!
    @IBOutlet var lblPercentage: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate
        lblpage.text = String(appDelegate.intRent) + "/" + "29"
        lblStar.text = String(appDelegate.intTotalStar) + " " + "stars"
        let actualprogress : Float = 100.0 / 29.0
        let progress : Float = 100.0/Float(appDelegate.intRent)
        let progressValue = actualprogress / progress
        
        progressView.setProgress(progressValue, animated: true)
        var progressPercentage = Int(progressValue * 100) as Int
        
        lblPercentage.text = String(progressPercentage) + "%"
      
        if lblPercentage.text == "100%"
        {
            txtContent.text = "Congratulations! You have completed Java course. Stay tuned for updates."
        }
        else
        {
         txtContent.text = "You are doing Great! You have already completed" + " " + (lblPercentage.text)! + " of the Java course"
        }
        
        defaults.set(appDelegate.intRent, forKey: "rent")
        
        imgProfilePic.layer.cornerRadius = imgProfilePic.frame.width/2
        imgProfilePic.layer.masksToBounds = true
        lblUsername.text = appDelegate.strUsername
        print(appDelegate.profilePicUrl)
        
        imgProfilePic.sd_setImage(with: URL(string: appDelegate.profilePicUrl), placeholderImage: UIImage(named: "profile"))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BackAction(_ sender: Any)
    {
         navigationController?.popViewController(animated: true)
        // self.dismiss(animated: true) { }
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
