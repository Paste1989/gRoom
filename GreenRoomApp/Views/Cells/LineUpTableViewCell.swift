//
//  LineUpTableViewCell.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class LineUpTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    

    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
         artistImageView.layer.cornerRadius = artistImageView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
