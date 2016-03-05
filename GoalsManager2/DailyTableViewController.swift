//
//  DailyGoalsTableViewController.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class DailyTableViewController: UITableViewController {

    
    
   
    func configureView() {
    
        parentViewController?.navigationItem.title = "Goals for the Day"
        parentViewController?.navigationItem.setRightBarButtonItem(UIBarButtonItem(title: "Add/Edit", style: .Plain, target: self, action: "addEditButton"), animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.translucent = false

        configureView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GoalsData.dailyGoalsName.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dailyCell", forIndexPath: indexPath) as! DailyCell


        cell.titleLabel.text = GoalsData.dailyGoalsName[indexPath.row]
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    
    func addEditButton() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editVC: UIViewController = storyboard.instantiateViewControllerWithIdentifier("editVC") as! EditViewController
        presentViewController(editVC, animated: true, completion: nil)
        
        print("add button pressed")
    }

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destinationVC = segue.destinationViewController as? EditViewController {
            
            
        }
        
    }
    

}
