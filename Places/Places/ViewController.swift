//
//  ViewController.swift
//  MyRecipies
//
//  Created by Marcos Navarro Pérez on 17/03/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    /* UIViewController, UITableViewDataSource, UITableViewDelegate */
    
    var places : [Place] = []
    var fetchResultsController : NSFetchedResultsController<Place>!
    var searchContrtoller : UISearchController!
    var searchResults : [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.searchContrtoller = UISearchController(searchResultsController: nil)
        self.tableView.tableHeaderView = self.searchContrtoller.searchBar
        self.searchContrtoller.searchResultsUpdater = self
        self.searchContrtoller.dimsBackgroundDuringPresentation = false
        self.searchContrtoller.searchBar.placeholder = "Search your place"
        self.searchContrtoller.searchBar.tintColor = UIColor.white
        self.searchContrtoller.searchBar.barTintColor = UIColor.darkGray
        
        let fetchRequest : NSFetchRequest<Place> = NSFetchRequest(entityName: "Place")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            self.fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            self.fetchResultsController.delegate = self
            do {
                try fetchResultsController.performFetch()
                self.places = fetchResultsController.fetchedObjects!
                
                let defaults = UserDefaults.standard
                if !defaults.bool(forKey: "hasLoadedDefaultInfo") {
                    self.loadDefaultData()
                    defaults.set(true, forKey: "hasLoadedDefaultInfo")
                }
            } catch {
                print("[ERROR]: \(error)")
            }
        }
        
        //loadModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: "hasViewTutorial") {
            return
        }
        
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "walkthroughController") as? TutorialPageViewController {
            self.present(pageViewController, animated: true, completion: nil)
        }
    }
    
    func loadModel () {
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            let fetchRequest: NSFetchRequest<Place> = NSFetchRequest(entityName: "Place")
            //let request: NSFetchRequest<Place> = Place.fetchRequest()
            do {
                self.places = try context.fetch(fetchRequest)
            } catch {
                print("[ERROR]: \(error)")
            }
        }
    }
    
    func loadDefaultData() {
        let names = [ "AlexanderPlatz", "Atomium", "Big Ben", "Christ the Redeemer", "Tower Eiffel", "Great Wall of China", "Tower Pissa", "Cathedral Mallorca" ]
        let types = [ "Square", "Museum", "Clock", "Monument", "Monument", "Monument", "Monument", "Cathedral"]
        let locations = [ "Alexanderstraße 4 10178 Berlin Deutschland", "Atomium Atomiumsquare 1 1020 Brusels Belgium", "London SW1A 0AA", "Cristo Redentor João Pessoa - PB Brasil", "5 Avenue Anatole France 75007 Paris France", "Great Wall, Mitianyu Beijing China", "Leaning Tower of Pisa, 56126 Pisa, Province of Pisa Italy", "La Seu Plaza de la Seu 5 07001 Palam Baleares, España"]
        let images = [ #imageLiteral(resourceName: "alexanderplatz"), #imageLiteral(resourceName: "atomium"), #imageLiteral(resourceName: "bigben"), #imageLiteral(resourceName: "cristoredentor"), #imageLiteral(resourceName: "torreeiffel"), #imageLiteral(resourceName: "murallachina"), #imageLiteral(resourceName: "torrepisa"), #imageLiteral(resourceName: "mallorca") ]
        let telephones = [ "555321895", "555123456", "555321895", "555321895", "555321895", "555321895", "555321895", "902022445"]
        let websites = [ "https://www.disfrutaberlin.com/alexanderplatz", "https://atomium.be", "http://www.parlament.uk/binben", "https://imaginariodejaneiro.com/que-visitar-en-rio-de-janeiro/monumentos/cristo-redentor/", "https://www.toureiffel.paris/en", "http://www.nationalgeographic.com.es/historia/grandes-reportajes/la-gran-muralla-china_8272", "https://es.gizmodo.com/la-legendaria-torre-inclinada-de-pisa-en-realidad-esta-1822621265", "http://catedraldemallorca.org/"]
        
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            for i in 0..<names.count {
                let place = NSEntityDescription.insertNewObject(forEntityName: "Place", into: context) as? Place
                place?.name = names[i]
                place?.type = types[i]
                place?.location = locations[i]
                place?.telephone = telephones[i]
                place?.website = websites[i]
                place?.rating = "rating"
                place?.image = UIImagePNGRepresentation(images[i])! as NSData
                
                do {
                    try context.save()
                } catch {
                    print("[ERROR]: save data persist")
                }
            }
        }
    }
    
    // MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchContrtoller.isActive {
            return self.searchResults.count
        }
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place : Place!
        if self.searchContrtoller.isActive {
            place = self.searchResults[indexPath.row]
        } else {
            place = self.places[indexPath.row]
        }
        let cellID = "PlaceCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceCell
        
        cell.thumnailImageView.image = UIImage(data: place.image! as Data)
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
    
    /*override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.places.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }*/
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            let place : Place!
            if self.searchContrtoller.isActive {
                place = self.searchResults[indexPath.row]
            } else {
                place = self.places[indexPath.row]
            }
            
            let shareDefaultText = "I'm visiting the place \(place.name)"
            
            let activityCtrl = UIActivityViewController(activityItems: [shareDefaultText, UIImage(data: place.image! as Data)!], applicationActivities: nil)
            
            self.present(activityCtrl, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
                let context = container.viewContext
                let placeToDelete = self.fetchResultsController.object(at: indexPath)
                context.delete(placeToDelete)
                
                do {
                    try context.save()
                } catch {
                    print("[ERROR]: \(error)")
                }
            }
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
                let place : Place!
                if self.searchContrtoller.isActive {
                    place = self.searchResults[indexPath.row]
                } else {
                    place = self.places[indexPath.row]
                }
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.place = place
            }
        }
    }
    
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindToMainViewControllerWithSegue" {
            if let addplaceVC = segue.source as? AddPlaceViewController {
                if let newPlace = addplaceVC.place {
                    self.places.append(newPlace)
                }
            }
        }
    }
    
    func filterContentFor(textToSearch: String) {
        self.searchResults = self.places.filter({ (place) -> Bool in
            let nameToFind = place.name.range(of: textToSearch, options: NSString.CompareOptions.caseInsensitive)
            return nameToFind != nil
        })
    }
    
}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                self.tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        case .move:
            if let indexPath = indexPath, let newIndexPath = newIndexPath {
                self.tableView.moveRow(at: indexPath, to: newIndexPath)
            }
        }
        
        self.places = controller.fetchedObjects as! [Place]
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
    
}

extension ViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            self.filterContentFor(textToSearch: searchText)
            self.tableView.reloadData()
        }
    }
}
