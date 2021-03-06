//
//  LongTermGoalsTableViewController.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class LongTermTableViewController: UITableViewController {
    
    
    func configureView() {
        
        parentViewController?.navigationItem.title = "Longterm Goals"
        parentViewController?.navigationItem.setRightBarButtonItem(UIBarButtonItem(title: "Add/Edit", style: .Plain, target: self, action: "addEditButton"), animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        configureView()
        tableView.reloadData()
        parentViewController?.navigationItem.title = "Longterm Goals"
        
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
        return GoalsData.longtermGoalsName.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("longtermCell", forIndexPath: indexPath) as! DailyCell
        
        cell.titleLabel.text = GoalsData.longtermGoalsName[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        Status.isDaily = false
        Status.isNew = false
        GoalsData.selectedCell = GoalsData.longtermGoalsName[indexPath.row]
        GoalsData.selectedCellIndex = indexPath.row
        
        print("did select longterm goal / selected cell: \(GoalsData.selectedCell)")
        
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            let cell = GoalsData.longtermGoalsName[indexPath.row]
            GoalsData.longtermGoalsDetails.removeValueForKey(cell)
            GoalsData.longtermGoalsName.removeAtIndex(indexPath.row)
            tableView.reloadData()
            
        }
        
    }
    
    // MARK: - Navigation
    
    func addEditButton() {
        
        Status.isNew = true
        Status.isDaily = false
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editVC: EditViewController = storyboard.instantiateViewControllerWithIdentifier("editVC") as! EditViewController
        
        navigationController?.pushViewController(editVC, animated: true)
        print("add button pressed by longterm")
        
    }
    
}
