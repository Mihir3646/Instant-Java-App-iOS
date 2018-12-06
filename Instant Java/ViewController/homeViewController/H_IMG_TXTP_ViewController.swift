//
//  H_IMG_TXTP_ViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 29/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class H_IMG_TXTP_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var strImg = String()
    var strHeader = String()
     var arrcontent = NSArray()
    @IBOutlet var tblView: UITableView!
    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var img: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        img.image = UIImage(named:self.strImg)
        
        loadGifinImage(strimg: strImg, imgview: img)
        
        lblHeader.text = self.strHeader.uppercased()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tblView.estimatedRowHeight = 44.0
        tblView.rowHeight = UITableViewAutomaticDimension
        
               
    }

    // MARK: - tableview datasource  -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrcontent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:H_IMG_TXTP_TableViewCell = self.tblView.dequeueReusableCell(withIdentifier: "cell") as! H_IMG_TXTP_TableViewCell!
        cell.lblContent.text = self.arrcontent[indexPath.row] as? String
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func actionFullImage(_ sender: Any)
    {
        viewFullImageWithImage(imgFull: self.strImg, VC: self)
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
