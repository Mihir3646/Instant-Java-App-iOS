//
//  failedViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 17/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class failedViewController: UIViewController {

    var img = UIImage()
    
    @IBOutlet var imgBackground: UIImageView!

    var strFailed = String()
    @IBOutlet var btnTryagain: UIButton!
    @IBOutlet var lblFailedReason: UILabel!
    @IBOutlet weak var viewWrong: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.5)

        let borderAlpha : CGFloat = 1.0
        
        btnTryagain.layer.cornerRadius = 5.0
        btnTryagain.layer.borderWidth = 3.0
        btnTryagain.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        lblFailedReason.text = self.strFailed
        viewWrong.layer.cornerRadius = 5.0
        
        self.view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        imgBackground.image = img.alpha(0.3)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tryagainAction(_ sender: Any)
    {
        
        //aaliya 9 - false

        //self.view.isHidden = true
        self.navigationController?.popViewController(animated: false)
        //self.dismiss(animated: true, completion: nil)

//
    
//         self.present(SubViewInstance, animated:false, completion:nil)
       // SubViewInstance.remove
        //SubViewInstance.failedView.remo = true
//           configureChildViewController(childController: SubViewInstance, onView: failedView)
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
