//
//  H_IMG_TXT_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 14/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

extension String {
    
    func strstr(needle: String, beforeNeedle: Bool = false) -> String? {
        guard let range = self.range(of: needle) else { return nil }
        
        if beforeNeedle {
            return self.substring(to: range.lowerBound)
        }
        
        return self.substring(from: range.upperBound)
    }
}

class H_IMG_TXT_VC: UIViewController {

    var strImg = String()
    var strcontent = String()
    var strHeader = String()

    @IBOutlet var txtContent: UILabel!
    @IBOutlet var imgDetail: UIImageView!
    @IBOutlet var lblHeader: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print(self.strImg)
        
        
        loadGifinImage(strimg: strImg, imgview: imgDetail)
        
//        imgDetail.image = UIImage(named:self.strImg)
        lblHeader.text = self.strHeader.uppercased()
        txtContent.text = self.strcontent
             
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
