//
//  TXT_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 14/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class TXT_VC: UIViewController {

    var strContent = String()

    @IBOutlet var lblContent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     lblContent.text = self.strContent
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
