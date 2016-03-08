//
//  DeadlineCircleView.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/5/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

@IBDesignable class DeadlineCircleButton: UIButton {
 
    override func drawRect(rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()
        
        UIColor.greenColor().set()
        
        let insetRect = CGRectInset(rect, 1, 1)
        
        CGContextFillEllipseInRect(context, insetRect)
    
    
    }
    
}
