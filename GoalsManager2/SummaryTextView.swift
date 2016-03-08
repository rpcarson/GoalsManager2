//
//  SummaryTextView.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/7/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class SummaryTextView: UITextView, UITextViewDelegate {
    
    let placeholderText: String = "add a description and details for your goal here"
    var hasPlaceholder: Bool = true
    
    // clears field on beginning to type
    func textViewDidChange(textView: UITextView) {
        
        print("editing textview")
        
        if hasPlaceholder == true {
            
            print("textview placeholder")
            
            let characterArray = textView.text.characters.map{String($0)}
            if let lastCharacter = characterArray.last {
                
                textView.text = lastCharacter
                
            }
            
            
        }
        
        hasPlaceholder = false
        
    }
    
    
}



