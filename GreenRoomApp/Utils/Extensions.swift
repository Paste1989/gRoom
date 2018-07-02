//
//  Extensions.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import Foundation
import UIKit


// Round Button
@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet{
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}


//Button
extension UIButton {
    //Round corners
    func roundCorners() {
        layer.cornerRadius = frame.height/2
    }
    
    //ButtonShadow
    func setShadowButton(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
    }
}

//Image
extension UIImageView {
    
    func setRounded(imageView: UIImageView) {
        let radius = imageView.frame.height / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

//Color
extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}


