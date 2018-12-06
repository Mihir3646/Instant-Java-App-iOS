//
//  H_IMG_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 18/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class H_IMG_VC: UIViewController {

    var strImg = String()
    var strHeader = String()

    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadGifinImage(strimg: strImg, imgview: img)

//        img.image = UIImage(named:self.strImg)
        lblHeader.text = self.strHeader.uppercased()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
