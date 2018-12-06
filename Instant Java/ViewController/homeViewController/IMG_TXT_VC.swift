//
//  IMG_TXT_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 14/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class IMG_TXT_VC: UIViewController {

    var strImg = String()
    var strcontent = String()

    @IBOutlet var txtView: UITextView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblContent: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        img.image = UIImage(named:self.strImg)
        txtView.text = self.strcontent
        loadGifinImage(strimg: strImg, imgview: img)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        txtView.isScrollEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtView.isScrollEnabled = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.layoutSubviews()
    }
    
    @IBAction func actionFullImage(_ sender: Any)
    {
        viewFullImageWithImage(imgFull: self.strImg, VC: self)
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
