//
//  MainTableViewController.swift
//  test
//
//  Created by eric.tiedeken@b507.us on 4/24/17.
//  Copyright © 2017 eric.tiedeken@b507.us. All rights reserved.
//

import UIKit

class RegionalTableViewController: UITableViewController {

    var regional: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

         tableView.backgroundColor = UIColor(red: 0.52, green: 0.73, blue: 0.73, alpha: 0.3)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = self.regional
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        
        if segue.identifier == "AmericanSegue" {
            let destinationController = segue.destination as! DishTableViewController
            regional = "American"
            destinationController.regional = regional
        }
        else if segue.identifier == "IndianSegue" {
            let destinationController = segue.destination as! DishTableViewController
            regional = "Indian"
            destinationController.regional = regional
        }
        else if segue.identifier == "ChineseSegue" {
            let destinationController = segue.destination as! DishTableViewController
            regional = "Chinese"
            destinationController.regional = regional
        }
        else if segue.identifier == "ItalianSegue" {
            let destinationController = segue.destination as! DishTableViewController
            regional = "Italian"
            destinationController.regional = regional
        }
        else if segue.identifier == "MexicanSegue" {
            let destinationController = segue.destination as! DishTableViewController
            regional = "Mexican"
            destinationController.regional = regional
        }
    }
 

}
