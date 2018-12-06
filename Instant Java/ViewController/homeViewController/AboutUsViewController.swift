//
//  AboutUsViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 24/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet var txtview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
    override func viewWillAppear(_ animated: Bool) {
        txtview.isScrollEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtview.isScrollEnabled = true
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
