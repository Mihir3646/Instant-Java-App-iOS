//
//  CODE_TXT_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 18/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class CODE_TXT_VC: UIViewController {

    var strContent = String()
    var strCode = NSString()
    
    
    @IBOutlet var lblcontent: UILabel!
   
    @IBOutlet var txtContent: UITextView!
//    @IBOutlet var lblCode: UILabel!
    @IBOutlet var txtCode: UITextView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    lblcontent.text = strContent

        
//        txtContent.text = self.strContent
        txtCode.text = self.strCode as String
        print(self.strCode as String)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtCode.isScrollEnabled = false
//        txtContent.isScrollEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtCode.isScrollEnabled = true
//        txtContent.isScrollEnabled = true
        
    }
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        self.view.layoutSubviews()
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //  txtCode.setContentOffset(0.0, animated: false)
        self.view.layoutSubviews()
    }

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       
////        var emojiData: Data? = strCode.data(using: String.Encoding.utf8.rawValue)
////        var emojiString = String(data: emojiData!, encoding: String.Encoding.symbol)
////        print("emojiString: \(emojiString)")
//  
//        lblcontent.text = strContent
//  //  txtContent.text = self.strContent
//        
//        print(strCode)
//        txtCode.text = strCode as String!
//        txtCode.setContentOffset(CGPoint.zero, animated: false)
////        txtCode.backgroundColor = UIColor.red
//        print(self.strCode as String)
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
  
//    override func viewWillAppear(_ animated: Bool)
//    {
//        txtCode.isScrollEnabled = false
//        txtContent.isScrollEnabled = false
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        txtCode.isScrollEnabled = true
//        txtContent.isScrollEnabled = true
//
//    }
    
//    override func viewWillLayoutSubviews()
//    {
//        super.viewWillLayoutSubviews()
//    
//       //  txtCode.setContentOffset(0.0, animated: false)
//        self.view.layoutSubviews()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
