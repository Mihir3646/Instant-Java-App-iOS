//
//  H_CODE_TXT_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 18/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class H_CODE_TXT_VC: UIViewController {

    var strHeader = String()
    var strContent = String()
    var strCode = String()

    @IBOutlet var txtCode: UITextView!
    @IBOutlet var lblCode: UILabel!
    @IBOutlet var lblcontent: UILabel!
    @IBOutlet var lblHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtCode.text = self.strCode
        lblcontent.text = self.strContent
        lblHeader.text = self.strHeader.uppercased()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        txtCode.isScrollEnabled = false
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtCode.isScrollEnabled = true
      
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.layoutSubviews()
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
