//
//  FullImageViewController.swift
//  Instant Java
//
//  Created by Trident Technolabs on 30/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {

    var img = String()
    
    @IBOutlet weak var imgFull: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
               // Do any additional setup after loading the view.
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionClose(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
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
