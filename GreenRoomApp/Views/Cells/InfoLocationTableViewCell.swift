//
//  InfoLocationTableViewCell.swift
//  GrApp
//
//  Created by Saša Brezovac on 25/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class InfoLocationTableViewCell: UITableViewCell {

    //MARK. - Outlets
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationText: UITextView!
    

    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
