//
//  ViewController.swift
//  HelloWorld
//
//  Created by Marcos Navarro Pérez on 22/09/2017.
//  Copyright © 2017 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // Change text content UILabel from programming
        helloLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let name = nameTextField.text!
        helloLabel.text = "Hello \(name), how are you?"
        
    }
    
    @IBAction func buttonShowAlertAction(_ sender: UIButton) {
        
        let alertCtrl: UIAlertController = UIAlertController(title: "Help", message: "You must enter your name and push the button", preferredStyle: .alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertCtrl.addAction(okAction)
        present(alertCtrl, animated: true, completion: nil)
        
    }
    
}

