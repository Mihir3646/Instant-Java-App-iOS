//
//  constant.swift
//  Instant Java
//
//  Created by abhishekbihani on 10/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import Foundation

//# MARK: - variable
let Select = "Select"
let defaults = UserDefaults.standard
let BaseUrl = "https://api.programminghub.io/api/phcourse/" //"https://devapi.programminghub.io/api/phcourse/"
let clientId = "391612517410-nhsjq09582ssmd9t08raelhsudl4j5ub.apps.googleusercontent.com"

func viewFullImageWithImage(imgFull : String, VC : UIViewController)
{
    let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.fullImageViewController) as! FullImageViewController
    SubViewInstance.modalTransitionStyle = .crossDissolve
    SubViewInstance.img = imgFull
    VC.present(SubViewInstance, animated:true, completion:nil)
}

func loadGifinImage(strimg : String , imgview : UIImageView)
{
    let final = strimg.strstr(needle: ".")
    let final1 = strimg.strstr(needle: ".", beforeNeedle: true)
    
    if final != "gif"
    {
        imgview.image = UIImage(named: strimg)
    }
    else
    {
        imgview.loadGif(name: final1!)
    }
}

func configureChildViewController1(childController: UIViewController, onView: UIView?, paerntVC : UIViewController, parentView : UIView)
{
    var holderView = parentView
    if let onView = onView {
        holderView = onView
    }
    paerntVC.addChildViewController(childController)
    holderView.addSubview(childController.view)
    constrainViewEqual1(holderView: holderView, view: childController.view)
    childController.didMove(toParentViewController: paerntVC)
}


func constrainViewEqual1(holderView: UIView, view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    //pin 100 points from the top of the super
    let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
                                    toItem: holderView, attribute: .top, multiplier: 1.0, constant: 0)
    let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
                                       toItem: holderView, attribute: .bottom, multiplier: 1.0, constant: 0)
    let pinLeft = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal,
                                     toItem: holderView, attribute: .left, multiplier: 1.0, constant: 0)
    let pinRight = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal,
                                      toItem: holderView, attribute: .right, multiplier: 1.0, constant: 0)
    
    holderView.addConstraints([pinTop, pinBottom, pinLeft, pinRight])
}
