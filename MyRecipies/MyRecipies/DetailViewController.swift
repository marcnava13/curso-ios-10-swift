//
//  DetailViewController.swift
//  MyRecipies
//
//  Created by Marcos Navarro Pérez on 29/01/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = recipe.name
        
        self.recipeImageView.image = recipe.image
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.ratingButton.setImage(UIImage(named: self.recipe.rating), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        if let reviewVC = segue.source as? ReviewViewController {
            if reviewVC.ratingSelected != nil {
                self.recipe.rating = reviewVC.ratingSelected!
                self.ratingButton.setImage(UIImage(named: self.recipe.rating), for: .normal)
            }
        }
    }

}

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 2
            case 1:
                return self.recipe.ingredients.count
            case 2:
                return self.recipe.steps.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = "Name: "
                    cell.keyValue.text = self.recipe.name
                case 1:
                    cell.keyLabel.text = "Time: "
                    cell.keyValue.text = ("\(self.recipe.time!) min")
                /*case 2:
                    cell.keyLabel.text = "Favourite: "
                    if self.recipe.isFavourite {
                        cell.keyValue.text = "Yes"
                    } else {
                        cell.keyValue.text = "No"
                    }*/
                default:
                    break;
                }
            case 1:
                if indexPath.row == 0 {
                    cell.keyLabel.text = "Ingredients: "
                } else {
                    cell.keyLabel.text = ""
                }
                cell.keyValue.text = self.recipe.ingredients[indexPath.row]
            case 2:
                if indexPath.row == 0 {
                    cell.keyLabel.text = "Steps: "
                } else {
                    cell.keyLabel.text = ""
                }
                cell.keyValue.text = self.recipe.steps[indexPath.row]
            default:
                break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch section {
            case 1:
                title = "Ingredients"
            case 2:
                title = "Steps"
            default:
                break
        }
        return title
    }
}

extension DetailViewController : UITableViewDelegate {
    
}
