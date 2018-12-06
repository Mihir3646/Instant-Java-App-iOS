//
//  SettingViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 11/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import MessageUI
import Toaster
class SettingViewController: UIViewController , MFMailComposeViewControllerDelegate{

    // MARK: - view life cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
         let mailComposerVC = MFMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
       
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["hello@programminghub.io"])
        mailComposerVC.setSubject("Feedback for Instant Java iOS app")
        mailComposerVC.setMessageBody("", isHTML: false)
        self.present(mailComposerVC, animated: true, completion: nil)
        
        }
        else
        {
            
        }
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send Email.  Please check Email configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller:MFMailComposeViewController, didFinishWith result:MFMailComposeResult, error:Error?) {
        
        if ConnectionCheck.isConnectedToNetwork()
        {
        switch result {
        case .cancelled:
          
            print("Mail cancelled")
        case .saved:
            
         
            print("Mail saved")
        case .sent:
            let sendMailErrorAlert = UIAlertView(title: "", message: "Mail sent", delegate: self, cancelButtonTitle: "OK")
            sendMailErrorAlert.show()
            print("Mail sent")
        case .failed:
          
            print("Mail sent failure: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
        }
        else
        {
            let toast = Toast(text: "No internet connection")
            toast.show()
            self.dismiss(animated: true, completion: nil)


        }
    }
//    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
//        controller.dismiss(animated: true, completion: nil)
//    }
    // MARK: - button Action
    
    @IBAction func feedbackAction(_ sender: Any)
    {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    @IBAction func termsAndConditionAction(_ sender: Any)
    {
        let nextViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: instantiateID.TermsAndConditionViewController) as! TermsAndConditionViewController
        self.present(nextViewController, animated:false, completion:nil)
    }
    @IBAction func GoalAction(_ sender: Any)
    {
        let nextViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: instantiateID.GoalsViewController) as! GoalsViewController
        self.present(nextViewController, animated:false, completion:nil)
    }
    @IBAction func ProfileAction(_ sender: Any)
    {
        let nextViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: instantiateID.ProfileViewController) as! ProfileViewController
        self.present(nextViewController, animated:false, completion:nil)
    }
    @IBAction func AboutAction(_ sender: Any)
    {
        let nextViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: instantiateID.AboutUsViewController) as! AboutUsViewController
        self.present(nextViewController, animated:false, completion:nil)

    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
        
       // self.dismiss(animated: false) { }
    }
    
    // MARK: - Memory management
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    


}
