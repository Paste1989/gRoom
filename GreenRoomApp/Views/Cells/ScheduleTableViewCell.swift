//
//  ScheduleTableViewCell.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    //MARK: - Outlets
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    
    @IBOutlet weak var timeLabelLeadingConstraint: NSLayoutConstraint!
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        artistImageView.layer.cornerRadius = artistImageView.frame.height / 2
        
        artistImageView.layer.borderColor = myGreenColor.cgColor
        artistImageView.layer.borderWidth = 2

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
