//
//  ViewController.swift
//  My garage
//
//  Created by Marcos Navarro Pérez on 23/01/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

var myGarage : [Car] = []

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myCar : Car = Car()
        print(myCar.mark)
        myGarage.append(myCar)
        
        let myCar2 : Car = Car(cv: 140, mark: "Mercedes Benz", model: "CLK", color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), kms: 90000, image: #imageLiteral(resourceName: "citroen"))
        
        print("\(myCar2)")
        print(myCar2.mark)
        myGarage.append(myCar2)
        
        for car in myGarage {
            print("Car: \(car.mark) \(car.model)")
            print("CV: \(car.cv) W: \(car.powerToWatts())")
            print("kms original: \(car.kms)")
            car.addKM(kmsToAdd: 10.0)
            print("new kms: \(car.kms)")
            print("\(car.accelerate())")
        }
        
        print("The max speed is: \(Car.maxSpeed())")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

