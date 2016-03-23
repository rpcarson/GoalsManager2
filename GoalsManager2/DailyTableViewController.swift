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
        
        let backButton = UIBarButtonItem()
        backButton.title = "Cancel"
        parentViewController?.navigationItem.backBarButtonItem = backButton
        
        navigationController?.navigationBar.translucent = false


        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        configureView()
        tableView.reloadData()
        parentViewController?.navigationItem.title = "Goals for the Day"

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

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        Status.isDaily = true
        Status.isNew = false
        GoalsData.selectedCell = GoalsData.dailyGoalsName[indexPath.row]
        GoalsData.selectedCellIndex = indexPath.row
        
        print("did select daily goal / selected cell: \(GoalsData.selectedCell)")
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            let cell = GoalsData.dailyGoalsName[indexPath.row]
            GoalsData.dailyGoalsDetails.removeValueForKey(cell)
            GoalsData.dailyGoalsName.removeAtIndex(indexPath.row)
            tableView.reloadData()
            
        }
        
    }

    
    // MARK: - Navigation
    
    
    func addEditButton() {
        
        Status.isNew = true
        Status.isDaily = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editVC: EditViewController = storyboard.instantiateViewControllerWithIdentifier("editVC") as! EditViewController
        
        navigationController?.pushViewController(editVC, animated: true)
        print("add button pressed by daily")
        
    }
    

}
