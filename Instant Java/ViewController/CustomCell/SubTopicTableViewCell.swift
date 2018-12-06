//
//  SubTopicTableViewCell.swift
//  Instant Java
//
//  Created by abhishekbihani on 13/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class SubTopicTableViewCell: UITableViewCell {

    @IBOutlet var seperatorView: UIView!
    @IBOutlet var seperatorDown: UIView!
    @IBOutlet var seperatorUP: UIView!
    @IBOutlet var imgRight: UIImageView!
    @IBOutlet var lblQuestion: UILabel!
    @IBOutlet var lblpage: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var imgLock: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
