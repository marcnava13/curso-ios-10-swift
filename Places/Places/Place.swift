//
//  Places.swift
//  Places
//
//  Created by Marcos Navarro Pérez on 17/03/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import Foundation
import UIKit

class Place {
    var name = ""
    var type = ""
    var location = ""
    var image : UIImage!
    var rating = "rating"
    var telephone = ""
    var website = ""
    
    init (name: String, type: String, location: String, image: UIImage, telephone: String, website: String) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.telephone = telephone
        self.website = website
    }
}