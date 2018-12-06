//
//  TermsAndConditionViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 24/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class TermsAndConditionViewController: UIViewController {

    @IBOutlet var Webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string: "http://programminghub.io/legal")
        let requestObj = NSURLRequest(url: url as! URL);
        Webview.loadRequest(requestObj as URLRequest)
    }

    @IBAction func BACKACTION(_ sender: Any)
    {
         navigationController?.popViewController(animated: true)
      //  self.dismiss(animated: true) { }
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
