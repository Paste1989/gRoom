//
//  ArtistModel.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import Foundation
import UIKit


class Artist: NSObject{
    var name: String!
    var place: String!
    var stage: String!
    var image: String!
    var time: String!
    var text: String!
    var dayOne: Bool!
    var fb: String!
    var insta: String!
    var internetPage: String!
    
    init(name: String, place: String, stage: String, image: String, time: String, text: String, dayOne: Bool, fb: String, insta: String, internetPage: String) {
        self.name = name
        self.place = place
        self.stage = stage
        self.image = image
        self.time = time
        self.text = text
        self.dayOne = dayOne
        self.fb = fb
        self.insta = insta
        self.internetPage = internetPage
    }
}

