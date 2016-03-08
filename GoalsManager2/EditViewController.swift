//
//  EditViewController.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var dateAddedLabel: UILabel!
    @IBOutlet weak var textField: TitleTextField!
    @IBOutlet weak var summaryLabel: UILabel!
    
    let summaryTextView = SummaryTextView()
    
    
    //    MARK: - Configure UI
    
    func configureView() {
        
        navigationItem.title = "Edit Goal"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done")
        navigationItem.setRightBarButtonItem(doneButton, animated: true)
    }
    
    
    func configureLabels() {
        
        if let name = textField?.text {
            
            let summary = DictionaryManager.getFromDictionary(.Summary, goalType: .Daily, goalName: name) as! String
            
            let storedDate = DictionaryManager.getFromDictionary(.Date, goalType: .Daily, goalName: name) as! String
            
            if GoalsData.isNew {
                let date = NSDate()
                dateAddedLabel.text = "Created: \(DateFormatter.getDaysAndHoursString(date))"
                textField?.text = textField?.placeholderText
                summaryLabel.text = summaryTextView.placeholderText
                print("isNew labels used")
            } else {
                textField?.text = GoalsData.selectedCell
                dateAddedLabel.text = storedDate
                summaryLabel.text = summary
                print("isNotNew labels used")
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureLabels()
        
        textField.delegate = textField
        
        print("editor loaded: isNew \(GoalsData.isNew)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! SummaryEditViewController
        if segue.identifier == "summarySegue" {
            
            destinationVC.goalName = textField.text
            destinationVC.previousVC = self
            
        }
    
    }
    
    
    func done() {
        

        if GoalsData.isNew {
            
            // save values to dictionary

            if let name = textField?.text {
                
                // add title to dictionary and goals array
                GoalsData.dailyGoalsName.append(name)
                DictionaryManager.addToDictionary(.Name, goalType: .Daily, data: name, goalName: name)
                
                // add date to dictionary
                if let date = dateAddedLabel.text {
                    DictionaryManager.addToDictionary(.Date, goalType: .Daily, data: date, goalName: name)
                }
                
                // add summary to dictionary
                if let summary = summaryLabel.text {
                    DictionaryManager.addToDictionary(.Summary, goalType: .Daily, data: summary, goalName: name)
                }
                
                print("\"\(name)\" appended to daily goals array")
                print("\(GoalsData.dailyGoalsDetails)")

            }
            
           
        } else {
            
            // check if values match values in dictionary, if not, update
            
            if let title = textField.text {
                
                let name = DictionaryManager.getFromDictionary(.Name, goalType: .Daily, goalName: title) as! String
                let summary = DictionaryManager.getFromDictionary(.Summary, goalType: .Daily, goalName: title) as! String
                
                // update name for dictionary and array
                if title != name {
                    DictionaryManager.addToDictionary(.Name, goalType: .Daily, data: title, goalName: title)
                    
                    if let index = GoalsData.selectedCellIndex {
                        GoalsData.dailyGoalsName[index] = title
                    }
                    
                }
                
                // update summary
                if summary != summaryLabel.text {
                    if let text = summaryLabel.text {
                        DictionaryManager.addToDictionary(.Summary, goalType: .Daily, data: text, goalName: title)
                    
                    }
                    
                    
                }
                
                
            }
            
        }
        
        navigationController?.popViewControllerAnimated(true)
        print("popping edit view controller")
        
    }
    
}