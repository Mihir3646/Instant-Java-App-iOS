//
//  H_CODE_TXTP_VC.swift
//  Instant Java
//
//  Created by abhishekbihani on 18/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class H_CODE_TXTP_VC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var arrcontent = NSArray()
    var strHeader = String()
    var strCode = String()

    @IBOutlet var txtCode: UITextView!
    @IBOutlet var tblView: UITableView!
    @IBOutlet var lblHeader: UILabel!
    
    @IBOutlet var layoutHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.arrcontent)
        super.didReceiveMemoryWarning()
        tblView.delegate = self
        tblView.dataSource = self
        // tblView.frame = CGRect(x: tblView.frame.origin.x, y: tblView.frame.origin.y, width: tblView.frame.width, height: tblView.contentSize.height)
        
        
        tblView.reloadData()
        lblHeader.text = self.strHeader.uppercased()
        txtCode.text = self.strCode
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        txtCode.isScrollEnabled = false
        tblView.estimatedRowHeight = 44.0
        tblView.rowHeight = UITableViewAutomaticDimension
        
        print(self.tblView.contentSize)
  
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        let finaly = tblView.frame.origin.y + self.tblView.contentSize.height
        
        let finalHeight = finaly - ScreenSize.Height
        layoutHeight.constant = self.tblView.contentSize.height
        
        self.view.layoutIfNeeded()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtCode.isScrollEnabled = true
        
    }
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        self.view.layoutSubviews()
    }

    override func didReceiveMemoryWarning() {
       
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableview datasource  -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrcontent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:H_CODE_TXTP_TableViewCell = self.tblView.dequeueReusableCell(withIdentifier: "cell") as! H_CODE_TXTP_TableViewCell!
        cell.lblcontent.text = self.arrcontent[indexPath.row] as? String
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
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
