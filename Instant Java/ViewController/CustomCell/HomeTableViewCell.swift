//
//  HomeTableViewCell.swift
//  Instant Java
//
//  Created by abhishekbihani on 13/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var seperatorUp: UIView!
    @IBOutlet var seperatorLine: UIView!
    @IBOutlet var lblNo: UILabel!
    @IBOutlet var imgThreestar: UIImageView!
    @IBOutlet var imgTwoStarimg: UIImageView!
    @IBOutlet var imgOneStar: UIImageView!
    @IBOutlet var seperatorView: UIView!
    @IBOutlet var lblQuestion: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        lblNo.layer.cornerRadius = lblNo.frame.width/2
        lblNo.layer.masksToBounds = true
        
        imgThreestar.isHidden = true
        imgTwoStarimg.isHidden = true
        imgOneStar.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
