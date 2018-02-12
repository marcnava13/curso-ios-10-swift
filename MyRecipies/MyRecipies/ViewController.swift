//
//  ViewController.swift
//  MyRecipies
//
//  Created by Marcos Navarro Pérez on 24/01/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    /* UIViewController, UITableViewDataSource, UITableViewDelegate */

    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
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
    
    // MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredients: \(recipe.ingredients.count)"
        
        /*if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        /*cell.thumnailImageView.layer.cornerRadius = 42
        cell.thumnailImageView.clipsToBounds = true*/
        
        return  cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            
            let shareDefaultText = "I'm reading the recipe \(self.recipes[indexPath.row].name!)"
            
            let activityCtrl = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            
            self.present(activityCtrl, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }
    
    // MARK -- UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let recipe = self.recipes[indexPath.row]
        let alertCtrl = UIAlertController(title: recipe.name, message: nil, preferredStyle: .actionSheet)
        var msg : String = "Mark as favourite"
        var colorBtnFavorite = UIAlertActionStyle.default
        if recipe.isFavourite {
            msg = "Unmark as favourite"
            colorBtnFavorite = UIAlertActionStyle.destructive
        }
        alertCtrl.addAction(UIAlertAction(title: msg, style: colorBtnFavorite) { (action) in
            recipe.setFavourite()
            self.tableView.reloadData()
        })
        alertCtrl.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertCtrl, animated: true, completion: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }

}

