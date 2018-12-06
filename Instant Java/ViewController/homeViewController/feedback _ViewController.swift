//
//  feedback _ViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 29/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import Toaster

class feedback__ViewController: UIViewController
{
    @IBOutlet weak var txtFeedback: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var imgBackground: UIImageView!
    
    var hud: MBProgressHUD?

    var strUserid = String()
    var starCount = Int()
    var img = UIImage()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgBackground.isUserInteractionEnabled = true
        imgBackground.addGestureRecognizer(tapGestureRecognizer)
        
        self.view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        starCount = 0
        imgBackground.image = img.alpha(0.3)
        
        if((defaults.object(forKey: "userid")) != nil)
        {
            self.strUserid = defaults.string(forKey:"userid")!
        }
        else
        {
            let toast = Toast(text: "Something went wrong")
            toast.show()
//            self.strUserid = " "
        }
        
        setupSubmitButtonUI()
    }

    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionSubmit(_ sender: Any)
    {
        callApi()
    }
    
    @IBAction func actionStar(_ sender: UIButton)
    {
        self.view.endEditing(true)
        let tag = sender.tag
        
        let imgNonsel = UIImage(named: "stargreyFeedback")
        let imgSel = UIImage(named: "stargreenFeedback")
        
        if btn1.tag == tag
        {
            if starCount == 1
            {
                btn1.setImage(imgNonsel, for: .normal)
                btn2.setImage(imgNonsel, for: .normal)
                btn3.setImage(imgNonsel, for: .normal)
                btn4.setImage(imgNonsel, for: .normal)
                btn5.setImage(imgNonsel, for: .normal)
                starCount = 0
            }
            else
            {
                btn1.setImage(imgSel, for: .normal)
                btn2.setImage(imgNonsel, for: .normal)
                btn3.setImage(imgNonsel, for: .normal)
                btn4.setImage(imgNonsel, for: .normal)
                btn5.setImage(imgNonsel, for: .normal)
                starCount = sender.tag
            }
        }
        else if btn2.tag == tag
        {
            btn1.setImage(imgSel, for: .normal)
            btn2.setImage(imgSel, for: .normal)
            btn3.setImage(imgNonsel, for: .normal)
            btn4.setImage(imgNonsel, for: .normal)
            btn5.setImage(imgNonsel, for: .normal)

            starCount = sender.tag
        }
        else if btn3.tag == tag
        {
            btn1.setImage(imgSel, for: .normal)
            btn2.setImage(imgSel, for: .normal)
            btn3.setImage(imgSel, for: .normal)
            btn4.setImage(imgNonsel, for: .normal)
            btn5.setImage(imgNonsel, for: .normal)

            starCount = sender.tag
        }
        else if btn4.tag == tag
        {
            btn1.setImage(imgSel, for: .normal)
            btn2.setImage(imgSel, for: .normal)
            btn3.setImage(imgSel, for: .normal)
            btn4.setImage(imgSel, for: .normal)
            btn5.setImage(imgNonsel, for: .normal)

            starCount = sender.tag
        }
        else if btn5.tag == tag
        {
            starCount = sender.tag
            btn1.setImage(imgSel, for: .normal)
            btn2.setImage(imgSel, for: .normal)
            btn3.setImage(imgSel, for: .normal)
            btn4.setImage(imgSel, for: .normal)
            btn5.setImage(imgSel, for: .normal)
        }
        setupSubmitButtonUI()
    }
    
    func setupSubmitButtonUI()
    {
        if starCount >= 1
        {
            btnSubmit.backgroundColor = colour.SelectedBlue
            btnSubmit.isEnabled = true
        }
        else
        {
            btnSubmit.backgroundColor = colour.UnelectedGray
            btnSubmit.isEnabled = false
        }
    }
    
    func callApi()
    {
        if ConnectionCheck.isConnectedToNetwork()
        {
            let strCount : String = "\(starCount)"
            let  Dicparams =
                [
                "star": strCount,
                "feedback": txtFeedback.text!,
                "userid": self.strUserid,
                ]
            
            print("Parameters = \(Dicparams)")
            
            let jsonData = try! JSONSerialization.data(withJSONObject: Dicparams, options: JSONSerialization.WritingOptions.prettyPrinted)
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
            let postString = "data=\(jsonString)"
            let paramData = postString.data(using: .utf8)
            
            ApiCall.sharedInstance.requestPostMethod(apiUrl: BaseUrl + WSList.feedback
                , params: paramData!)
            {(success, responseData) in
                
               // print(responseData)
                let arrData = responseData
                print("Response = \(arrData)")
                let strMessage = arrData?.value(forKey: "Message") as! String
                
                if strMessage == "SUCCESS"
                {
                    self.dismiss(animated: true, completion: nil)
                    DispatchQueue.main.async
                    {
                        let toast = Toast(text: "Thank you for your feedback.")
                        toast.show()
                    }
                }
                else
                {
                    let toast = Toast(text: "Somethng went wrong.")
                    toast.show()
                }
            }
        }
        else
        {
            DispatchQueue.main.async
                {
                    let toast = Toast(text: "No internet connection")
                    toast.show()
            }
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField.isFirstResponder
        {
            if range.location == 0 && (string == " ")
            {
                return false
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning()
    {
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
