//
//  Car.swift
//  My garage
//
//  Created by Marcos Navarro Pérez on 23/01/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import Foundation
import UIKit

class Car: NSObject {
    
    var cv : Int!
    var mark : String!
    var model : String!
    var color : UIColor!
    var kms : Double!
    var image: UIImage?
    
    override var description: String {
        return "Text from override var description: String of the class Car"
    }
    
    // Constructor
    override init() {
        cv = 0;
        mark = "Unknown"
        model = "Unknown"
        color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        kms = 0.0
    }
    
    init(cv: Int, mark: String, model: String, color: UIColor, kms: Double, image : UIImage?) {
        self.cv = cv
        self.mark = mark
        self.model = model
        self.color = color
        self.kms = kms
        if let image = image {
            self.image = image
        }
    }
    
    func addKM(kmsToAdd: Double!) {
        self.kms = self.kms + kmsToAdd
    }
    
    func accelerate() {
        print ("Brrrrrrrr!!!!")
    }
    
    class func maxSpeed() -> Int {
        return 120
    }
    
    func powerToWatts() -> Int {
        return 735 * self.cv
    }
    
}
