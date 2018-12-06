//
//  PlayGameViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 24/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import Amplitude_iOS

class PlayGameViewController: UIViewController
{

    @IBOutlet var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayGameViewController.attemptRotationToDeviceOrientation()
        let url = NSURL (string: "https://api.programminghub.io/games/javaquiz/")
        let requestObj = NSURLRequest(url: url as! URL);
        webview.loadRequest(requestObj as URLRequest)
        // Do any additional setup after loading the view.
        
        //amplitude
        Amplitude.instance().logEvent("GamePlayed")
        print("GamePlayed")
        
    }
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }
    
    @IBAction func backAction(_ sender: Any)
    {
        self.dismiss(animated: false) { }

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
