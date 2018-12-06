//
//  GameViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 11/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: -Variable and Outlet -

    @IBOutlet var lblGames: UILabel!
    @IBOutlet var imgCourse: UIImageView!
    @IBOutlet var lblCourse: UILabel!
    @IBOutlet var imgGames: UIImageView!
    
    // MARK: - View lifecycle -
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imgCourse.image = UIImage(named:"course_black")
        imgGames.image = UIImage(named:"game_blue")
        lblCourse.textColor = UIColor.black
        lblGames.textColor = colour.homeTabBar
    }

    // MARK: - Button Action -
    
    @IBAction func playAction(_ sender: Any)
    {
//        let nextViewController = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: instantiateID.PlayGameViewController) as! PlayGameViewController
//        self.present(nextViewController, animated:false, completion:nil)

    }

    @IBAction func CourseAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: false)
//        self.dismiss(animated: false) { }
    }
    
    // MARK: - Memory management -
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
