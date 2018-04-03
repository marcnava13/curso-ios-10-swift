//
//  AboutMeViewController.swift
//  Places
//
//  Created by Marcos Navarro Pérez on 03/04/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit
import SafariServices

class AboutMeViewController: UITableViewController {
    
    let sections = [ "Visit my website", "Follow me on Social Network" ]
    
    let sectionContent = [ [ "website" ], ["Facebook", "Twitter"] ]
    
    let sectionLinks = [ [ "http://marcosnavarro.net/" ], [ "https://facebook.com", "https://twitter.com" ] ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sectionContent[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutMeCell", for: indexPath)
        
        cell.textLabel?.text = self.sectionContent[indexPath.section][indexPath.row]
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                // UIApplication.shared
                if let linkURL = URL(string: sectionLinks[indexPath.section][indexPath.row]) {
                    let app = UIApplication.shared
                    if app.canOpenURL(linkURL) {
                        app.open(linkURL, options: [:], completionHandler: nil)
                    }
                }
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                // UIWebView
                performSegue(withIdentifier: "showWebView", sender: sectionLinks[indexPath.section][indexPath.row])
            case 1:
                // SFSafariViewController
                if let url = URL(string: sectionLinks[indexPath.section][indexPath.row]) {
                    let config = SFSafariViewController.Configuration()
                    config.entersReaderIfAvailable = true
                    let safariViewController = SFSafariViewController(url: url, configuration: config)
                    present(safariViewController, animated: true, completion: nil)
                }
            default:
                break
            }
        default:
            break
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showWebView" {
            let destinationViewController = segue.destination as! WebViewController
            destinationViewController.url = sender as! String
        }
    }
 

}
