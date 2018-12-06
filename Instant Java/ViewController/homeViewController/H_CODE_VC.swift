//
//  H_CODE_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 18/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class H_CODE_VC: UIViewController {

    var strHeader = String()
     var strCode = String()

    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var txtviewCode: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        txtviewCode.text = self.strCode
        lblHeader.text = self.strHeader.uppercased()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
