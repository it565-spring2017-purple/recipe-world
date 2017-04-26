//
//  RecipeListTableViewController.swift
//  test
//
//  Created by eric.tiedeken@b507.us on 4/24/17.
//  Copyright © 2017 eric.tiedeken@b507.us. All rights reserved.
//

import UIKit
import CoreData

class RecipeListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    @IBAction func unwindToRecipeList(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    var regional: String = ""
    var dish: String = ""
    var fetchResultController: NSFetchedResultsController<RecipeMO>!
    
    var recipes:[RecipeMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = self.dish
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let fetchRequest:NSFetchRequest<RecipeMO> = RecipeMO.fetchRequest()
        // Specify the sort order
        let sortDescriptor = NSSortDescriptor(key: "recipe_name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate1 = NSPredicate(format: "recipe_cuisine == %@", regional)
        //fetchRequest.predicate = predicate1
        
        let predicate2 = NSPredicate(format: "recipe_type == %@", dish)
        //fetchRequest.predicate = predicate2
        
        let predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [predicate1, predicate2])
        fetchRequest.predicate = predicate
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            // Initilize the fetchResultController and specify its delegate
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                // Execute fetch request
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    // Get RestaurantMO objects by accessing the fetchedObjects property
                    recipes = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
        
        
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
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecipeListCell

        // Configure the cell...
        cell.nameLabel.text = recipes[indexPath.row].recipe_name
        cell.thumbnailImageView.image = UIImage(data: recipes[indexPath.row].recipe_image! as Data)
        
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

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
        
        if segue.identifier == "AddRecipeSegue" {
            let navController = segue.destination as! UINavigationController
            let destinationController = navController.viewControllers.first as! AddRecipeTableViewController
            destinationController.regional = regional
            destinationController.dish = dish
        }
        else if segue.identifier == "RecipeDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RecipeDetailViewController
                destinationController.recipe = self.recipes[indexPath.row]
                destinationController.regional = regional
                destinationController.dish = dish
            }
        }
    }
    

}
