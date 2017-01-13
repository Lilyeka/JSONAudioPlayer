//
//  Product.swift
//  GoodAsPhone
//
//  Created by Dmitry Torshin on 01.12.16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import Foundation

class Product {
    var Name: String?
    var productImage: String?
    var cellImage: String?
    var sound: PlayMusic?
    
    required init(Name: String, productImage: String, cellImage: String, sound: PlayMusic){
        self.Name = Name
        self.productImage = productImage
        self.cellImage = cellImage
        self.sound = sound
    }
}
