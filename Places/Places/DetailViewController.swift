//
//  DetailViewController.swift
//  MyRecipies
//
//  Created by Marcos Navarro Pérez on 17/03/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    var place : Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = place.name
        
        self.placeImageView.image = UIImage(data: self.place.image! as Data)
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        print(self.place.rating!)
        
        self.ratingButton.setImage(UIImage(named: self.place.rating!), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        if let reviewVC = segue.source as? ReviewViewController {
            if reviewVC.ratingSelected != nil {
                self.place.rating = reviewVC.ratingSelected!
                self.ratingButton.setImage(UIImage(named: self.place.rating!), for: .normal)
                
                if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
                    let context = container.viewContext
                    do {
                        try context.save()
                    } catch {
                        print("[ERROR]: \(error)")
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationViewController = segue.destination as! MapViewController
            destinationViewController.place = self.place
        }
    }

}

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceDetailViewCell", for: indexPath) as! PlaceDetailViewCell
        
        cell.backgroundColor = UIColor.clear

        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Name: "
            cell.keyValue.text = self.place.name
        case 1:
            cell.keyLabel.text = "Type: "
            cell.keyValue.text = self.place.type
        case 2:
            cell.keyLabel.text = "Location: "
            cell.keyValue.text = self.place.location
        case 3:
            cell.keyLabel.text = "Telephone: "
            cell.keyValue.text = self.place.telephone
        case 4:
            cell.keyLabel.text = "Website: "
            cell.keyValue.text = self.place.website
        default:
            break;
        }
        
        return cell
    }
    
}

extension DetailViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2:
            self.performSegue(withIdentifier: "showMap", sender: nil)
            break;
        default:
            break;
        }
    }
    
}
