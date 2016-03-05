//
//  TitleTextField.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class TitleTextField: UITextField, UITextFieldDelegate {

    
    var randomElement: Bool = true
 
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        print("text field return pressed")
        
        return true
    }

}
