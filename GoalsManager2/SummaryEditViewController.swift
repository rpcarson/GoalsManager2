//
//  SummaryEditViewController.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/7/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class SummaryEditViewController: UIViewController {
    
    
    @IBOutlet weak var summaryTextView: SummaryTextView!
    
    var goalName: String?
    var previousVC: EditViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        summaryTextView.becomeFirstResponder()
        summaryTextView.delegate = summaryTextView
        summaryTextView.text = summaryTextView.placeholderText
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureNavBar() {
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "done")
        navigationItem.setRightBarButtonItem(doneButton, animated: true)
        navigationItem.title = "Edit Description"
        
    }
    
    
    func done() {
        
        if let name = goalName {
            
            DictionaryManager.addToDictionary(.Summary, goalType: .Daily, data: summaryTextView.text, goalName: name)
            
            print("dictionary updated with summary  \(GoalsData.dailyGoalsDetails)")
            
        }
        
        previousVC?.summaryLabel.text = summaryTextView.text
        
        navigationController?.popViewControllerAnimated(true)
        print("summary editor popped")
        
        
    }
    
    
    
    
}
