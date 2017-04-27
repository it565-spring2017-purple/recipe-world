//
//  DashboardController.swift
//  test
//
//  Created by Ravali Reddy Akkati on 4/25/17.
//  Copyright © 2017 eric.tiedeken@b507.us. All rights reserved.
//

import UIKit
import MessageUI

class DashboardController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //To delete the empty rows from table view
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row = \(indexPath.description)")
        
        if indexPath.row == 0 {
            
            print("Rate Our App tapped")
            
            let alertController = UIAlertController(title: "Rate Us!", message: "\nAre you enjoying our app? Please rate us in the app store!\n\n Else if you know of ways we can make our app better please send us feedback so we can improve the experience for you\n\nThanks!\nThe App Team", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Rate on iTunes", style: .default, handler: {(action:
                UIAlertAction!) in
                print("RateUs.Results_Tapped")
                print("send to iTunes")
            }))
            alertController.addAction(UIAlertAction(title: "Send us Feedback", style: .default, handler: {(action:
                UIAlertAction!) in
                print("RateUs.Feedback_Tapped")
                
                
                let mailComposeViewController = self.configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail(){
                    self.present(mailComposeViewController, animated: true, completion:nil)
                }else {
                    self.showSendMailErrorAlert()
                }
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {
                (action:UIAlertAction!) in
                print("RateUS.Cancel_Tapped")
            }))
            
        }
        
        if indexPath.row == 1 {
            
            print("Feedback row tapped")
            
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail(){
                self.present(mailComposeViewController, animated: true, completion:nil)
            }else {
                self.showSendMailErrorAlert()
            }
        }
    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["akkatir@gmail.com"])
        mailComposerVC.setSubject("App Feedback and Suggestions")
        mailComposerVC.setMessageBody("Hello App Team!\n\nI would like to share the following feedback...\n", isHTML: false)
        
        return mailComposerVC
        
    }
    
    func showSendMailErrorAlert() {
        // Use
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail. Please check email configuration and try again", preferredStyle: .alert)
        /*
         let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail. Please check email configuration and try again", delegate: self, cancelButtonTitle: "OK")
         */
        //sendMailErrorAlert.show(nil, sender: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        /*      switch result.value {
         case MFMailComposeResultCancelled.value:
         println("cancelled mail")
         case MFMailComposeResultSent.value:
         println("Mail Sent")
         default:
         break
         }*/
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func close(segue:UIStoryboardSegue){
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
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
    }
    
    
}
