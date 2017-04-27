//
//  MyAccountViewController.swift
//  recipeworld
//
//  Created by Ravali Reddy Akkati on 4/20/17.
//  Copyright © 2017 it565purple. All rights reserved.
//

import UIKit
import CoreData

class MyAccountViewController: UIViewController, NSFetchedResultsControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var fetchResultController: NSFetchedResultsController<MyAccountMO>!
    
    var acountInfo:[MyAccountMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let fetchRequest:NSFetchRequest<MyAccountMO> = MyAccountMO.fetchRequest()
        // Specify the sort order
        let sortDescriptor = NSSortDescriptor(key: "account_name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
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
                    acountInfo = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
