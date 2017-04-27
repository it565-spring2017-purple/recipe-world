//
//  EditRecipeTableViewController.swift
//  recipeworld
//
//  Created by Tiedeken, Eric on 4/27/17.
//  Copyright © 2017 it565purple. All rights reserved.
//

import UIKit
import CoreData

class EditRecipeTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ingredientsBox: UITextView!
    @IBOutlet weak var directionsBox: UITextView!
    @IBOutlet weak var videoBox: UITextField!
    
    var regional: String = ""
    var dish: String = ""
    
    var recipe:RecipeMO!
    
    @IBAction func save(sender: UIBarButtonItem) {
        let alertMessage = UIAlertController(title: "Error Occurred", message: "Please enter a recipe name and image", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if ((nameBox.text?.isEmpty)!) {
            present(alertMessage, animated: true, completion: nil)
        } else {
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                context.delete(self.recipe)
                
                recipe = RecipeMO(context: appDelegate.persistentContainer.viewContext)
                recipe.recipe_name = nameBox.text
                recipe.recipe_ingredients = ingredientsBox.text
                recipe.recipe_directions = directionsBox.text
                recipe.recipe_video = videoBox.text
                recipe.recipe_cuisine = regional
                recipe.recipe_type = dish
                
                if let recipeImage = photoImageView.image {
                    if let imageData = UIImagePNGRepresentation(recipeImage)
                    {
                        recipe.recipe_image = NSData(data: imageData)
                        
                    }
                }
                appDelegate.saveContext()
            }
            
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 0.52, green: 0.73, blue: 0.73, alpha: 0.3)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.estimatedRowHeight = 80.0   // sets estimated row height ... currently prototype cell height
        tableView.rowHeight = UITableViewAutomaticDimension  // must be combined with number of lines = 0 in the Value label
        
        self.title = recipe.recipe_name
        
        nameBox.text = recipe.recipe_name
        photoImageView.image = UIImage(data: recipe.recipe_image! as Data)
        ingredientsBox.text = recipe.recipe_ingredients
        directionsBox.text = recipe.recipe_directions
        videoBox.text = recipe.recipe_video
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // For touch and load photo library
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // Call the UIImagePickerController
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    // To get the selected photo ... this method comes from the protocol and its called when user selects a photo from library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        // Define layout constraints programmatically
        let leadingContraint = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingContraint.isActive = true
        
        let trailingContraint = NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: photoImageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingContraint.isActive = true
        
        let topContraint = NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topContraint.isActive = true
        
        let bottomContraint = NSLayoutConstraint(item: photoImageView, attribute: .bottom, relatedBy: .equal, toItem: photoImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomContraint.isActive = true
        
        
        dismiss(animated: true, completion: nil)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
