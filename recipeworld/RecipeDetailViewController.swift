//
//  RecipeDetailTableViewController.swift
//  recipeworld
//
//  Created by eric.tiedeken@b507.us on 4/25/17.
//  Copyright © 2017 it565purple. All rights reserved.
//

import UIKit
import CoreData

class RecipeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var youTube: UIWebView!
    
    var regional: String = ""
    var dish: String = ""
    
    var recipe:RecipeMO!
    
    
    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: videoID)
            else { return }
        youTube.loadRequest( URLRequest(url: youtubeURL) )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 0.52, green: 0.73, blue: 0.73, alpha: 0.3)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        recipeImageView.image = UIImage(data: (recipe?.recipe_image)! as Data)
        
        self.title = recipe.recipe_name
        
        loadYoutube(videoID: recipe.recipe_video!)
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecipeDetailCell

        // Configure the cell...
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Ingredients List"
            cell.valueLabel.text = recipe?.recipe_ingredients
        case 1:
            cell.fieldLabel.text = "Directions List"
            cell.valueLabel.text = recipe?.recipe_directions
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell
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
        
        if segue.identifier == "EditRecipeSegue" {
            let navController = segue.destination as! UINavigationController
            let destinationController = navController.viewControllers.first as! EditRecipeTableViewController
            destinationController.regional = regional
            destinationController.dish = dish
            destinationController.recipename = recipe.recipe_name!
            destinationController.recipevideo = recipe.recipe_video!
            destinationController.recipedirections = recipe.recipe_directions!
            destinationController.recipeingredients = recipe.recipe_ingredients!
            destinationController.recipe = self.recipe
        }
    }
 

}
