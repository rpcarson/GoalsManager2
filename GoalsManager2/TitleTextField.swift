//
//  TitleTextField.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit


protocol DoneButtonDelegate {
    
    func showHideButton()
    
}


class TitleTextField: UITextField, UITextFieldDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        font = UIFont(name: "Helvetica-Neue", size: 25)
        
    }
    
    var placeholderText = "tap to name your goal"
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField.text == placeholderText {
            textField.text = ""
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let validText = NSCharacterSet.alphanumericCharacterSet()
        let emojis = NSCharacterSet.symbolCharacterSet()
        
        // guarantees text in field

        if (textField.text?.rangeOfCharacterFromSet(validText) == nil) && (textField.text?.rangeOfCharacterFromSet(emojis) == nil) {
            
            textField.text = placeholderText
            
        }
        
        if let text = textField.text {
            if GoalsData.dailyGoalsName.contains(text) {
                
                let notification = LocalNotification()
                notification.generateTakenNameNotification()
                textField.text = ""
                
            }
            
        }
        
        if textField.text != "" {
            
            textField.resignFirstResponder()
            
        }
        
        return true
    }
    

    
}