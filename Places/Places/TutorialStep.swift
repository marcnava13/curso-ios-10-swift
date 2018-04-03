//
//  TutorialStep.swift
//  Places
//
//  Created by Marcos Navarro Pérez on 03/04/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import Foundation
import UIKit

class TutorialStep: NSObject {
    
    var index : Int = 0
    var heading: String
    var content: String
    var image: UIImage
    
    init(index: Int, heading: String, content: String, image: UIImage) {
        self.index = index
        self.heading = heading
        self.content = content
        self.image = image
    }
    
}
