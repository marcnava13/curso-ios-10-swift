//
//  SingleViewController.swift
//  MyRecipies
//
//  Created by Marcos Navarro Pérez on 24/01/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // self.tableView.dataSource = self
        // self.tableView.delegate = self
        
        loadModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadModel () {
        recipes.append(Recipe(name: "Omelette",
                              image: #imageLiteral(resourceName: "omelette"),
                              time: 20,
                              ingredients: ["Potatoes",
                                            "Eggs",
                                            "Onions"],
                              steps: ["Step 1",
                                      "Step 2"]))
        recipes.append(Recipe(name: "Pizza",
                              image: #imageLiteral(resourceName: "pizza"),
                              time: 60,
                              ingredients: ["Tomatoes",
                                            "Oil",
                                            "Cheese"],
                              steps: ["Step 1",
                                      "Step 2",
                                      "Step 3"]))
        recipes.append(Recipe(name: "Burger",
                              image: #imageLiteral(resourceName: "burger"),
                              time: 10,
                              ingredients: ["Lettuce",
                                            "Eggs",
                                            "Onions"],
                              steps: ["Step 1",
                                      "Step 2",
                                      "Step 3",
                                      "Step 4"]))
        recipes.append(Recipe(name: "Salad",
                              image: #imageLiteral(resourceName: "salad"),
                              time: 5,
                              ingredients: ["Lettuce",
                                            "Tomatoes",
                                            "Onions"],
                              steps: ["Step 1",
                                      "Step 2"]))
    }

}

extension SingleViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return  cell
    }
}
