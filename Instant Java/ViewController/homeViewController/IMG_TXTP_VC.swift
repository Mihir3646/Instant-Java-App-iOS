//
//  IMG_TXTP_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 14/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class IMG_TXTP_VC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var strImg = String()
    var arrcontent = NSArray()

    
    @IBOutlet var tblView: UITableView!
    @IBOutlet var img: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.estimatedRowHeight = 44.0
        tblView.rowHeight = UITableViewAutomaticDimension
        
        tblView.reloadData()
        
        loadGifinImage(strimg: strImg, imgview: img)

//        img.image = UIImage(named:strImg)
    }
   
    // MARK: - tableview datasource  -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrcontent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:IMG_TXTP_TableViewCell = self.tblView.dequeueReusableCell(withIdentifier: "cell") as! IMG_TXTP_TableViewCell!
        cell.lblContent.text = self.arrcontent[indexPath.row] as? String
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionFullImage(_ sender: Any)
    {
        viewFullImageWithImage(imgFull: strImg, VC: self)
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
