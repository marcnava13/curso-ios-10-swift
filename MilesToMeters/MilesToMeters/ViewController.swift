//
//  ViewController.swift
//  MilesToMeters
//
//  Created by Marcos Navarro Pérez on 24/09/2017.
//  Copyright © 2017 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let UNIT_MILE : Double = 1.609344
    
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var optionsChooseSegment: UISegmentedControl!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.text = "You must enter the distance"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        
        let selectedIndex = optionsChooseSegment.selectedSegmentIndex
        if let stringInserted = distanceTextField.text, let selectedDistance = Double(stringInserted) {
            var result : Double = 0.0
                
            if selectedIndex == 0 {
                result = selectedDistance / UNIT_MILE
            } else if selectedIndex == 1 {
                result = selectedDistance * UNIT_MILE
            }
                
            reloadView(initValue: selectedDistance, endValue: result)
        } else {
            resultLabel.text = "You must write something"
        }
    
    }
    
    func reloadView(initValue : Double, endValue : Double) {
        let initText = String(format: "%.2f", initValue)
        let endText = String(format: "%.2f", endValue)
        let selectedIndex = optionsChooseSegment.selectedSegmentIndex
        if selectedIndex == 0 {
            resultLabel.text = "\(initText) km = \(endText) milles"
        } else if selectedIndex == 1 {
            resultLabel.text = "\(initText) miles = \(endText) km"
        }
    }
    
}

