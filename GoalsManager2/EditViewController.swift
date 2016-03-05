//
//  EditViewController.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: TitleTextField!
  
    
    func configureView() {
        
        navigationItem.title = "Edit Goal"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("editor loaded")

        configureView()
        
        titleTextField.text = "placeholder"
        
        titleTextField.delegate = titleTextField
        titleTextField.delegate = titleTextField.self
        if let textField = titleTextField {
            
            textField.delegate = titleTextField
        }
        
        print("textfield delegate = \(titleTextField?.delegate)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
