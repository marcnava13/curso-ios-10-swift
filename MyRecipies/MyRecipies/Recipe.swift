//
//  Recipe.swift
//  MyRecipies
//
//  Created by Marcos Navarro Pérez on 24/01/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    
    var name : String!
    var image: UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    //var isFavourite = false
    
    var rating : String = "rating"
    
    init(name : String, image : UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
    /*func setFavourite () -> Recipe {
        self.isFavourite = !self.isFavourite
        return self
    }*/
    
}
