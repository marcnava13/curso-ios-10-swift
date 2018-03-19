//
//  ViewController.swift
//  MyRecipies
//
//  Created by Marcos Navarro Pérez on 17/03/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    /* UIViewController, UITableViewDataSource, UITableViewDelegate */
    
    var places : [Place] = []
    
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
        
    }
    
    // MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = places[indexPath.row]
        let cellID = "PlaceCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceCell
        
        cell.thumnailImageView.image = place.image
        cell.nameLabel.text = place.name
        cell.timeLabel.text = place.type
        cell.ingredientsLabel.text = place.location
        
        /*if place.isFavourite {
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
            self.places.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            
            let shareDefaultText = "I'm visiting the place \(self.places[indexPath.row].name)"
            
            let activityCtrl = UIActivityViewController(activityItems: [shareDefaultText, self.places[indexPath.row].image!], applicationActivities: nil)
            
            self.present(activityCtrl, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            self.places.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }
    
    // MARK -- UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let place = self.places[indexPath.row]
         let alertCtrl = UIAlertController(title: place.name, message: nil, preferredStyle: .actionSheet)
         var msg : String = "Mark as favourite"
         var colorBtnFavorite = UIAlertActionStyle.default
         if place.isFavourite {
         msg = "Unmark as favourite"
         colorBtnFavorite = UIAlertActionStyle.destructive
         }
         alertCtrl.addAction(UIAlertAction(title: msg, style: colorBtnFavorite) { (action) in
         place.setFavourite()
         self.tableView.reloadData()
         })
         alertCtrl.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         self.present(alertCtrl, animated: true, completion: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedPlace = self.places[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.place = selectedPlace
            }
        }
    }
    
}

