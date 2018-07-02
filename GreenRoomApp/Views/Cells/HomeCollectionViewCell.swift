//
//  HomeCollectionViewCell.swift
//  GrApp
//
//  Created by Saša Brezovac on 19/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var pickArtistImageView: UIImageView!
    
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pickArtistImageView.layer.borderColor = UIColor.white.cgColor
        pickArtistImageView.layer.borderWidth = 1.5
        
        UIView.animate(withDuration: 2, animations: {
            self.pickArtistImageView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.pickArtistImageView.bounds.size.width, height: self.pickArtistImageView.bounds.size.height)
            self.pickArtistImageView.alpha = 0.7
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.pickArtistImageView.alpha = 0.8
            }) { (finished) in
                self.pickArtistImageView.alpha = 1.0
            }
        }
    }
    
    
}
