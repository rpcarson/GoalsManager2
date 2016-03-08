//
//  TitleTextField.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class TitleTextField: UITextField, UITextFieldDelegate {
    
    var placeholderText = "tap to name your goal"
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        font = UIFont(name: "Helvetica-Neue", size: 25)
        
    }

    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField.text == placeholderText {
            textField.text = ""
        }
        
        
    }
    
    // guarantees text in field
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let validText = NSCharacterSet.alphanumericCharacterSet()
        let emojis = NSCharacterSet.symbolCharacterSet()
        
        if (textField.text?.rangeOfCharacterFromSet(validText) == nil) && (textField.text?.rangeOfCharacterFromSet(emojis) == nil) {
            
            textField.text = placeholderText
            
        }
        
        textField.resignFirstResponder()
        return true
    }
    

}