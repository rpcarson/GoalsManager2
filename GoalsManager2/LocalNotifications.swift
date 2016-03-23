//
//  LocalNotifications.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/18/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit


class LocalNotification {
    
    let settings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        
    func generateTakenNameNotification() {
        
        let notification = UILocalNotification()
        notification.userInfo = ["id":1]
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        
    }
    
    func generateNoNameNotification() {
        let notification = UILocalNotification()
        notification.userInfo = ["id":2]
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        
    }
    
    func noNameAlert(window window: UIWindow, notification: UILocalNotification) {
        let alertController = UIAlertController(title: "Wait!", message: "Please name your goal", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
        
        alertController.addAction(action)
        
        window.rootViewController?.presentViewController(alertController, animated: true, completion: { () -> Void in
        })
        
    }
    
    func actionForNameTakenNotification(window window: UIWindow, notification: UILocalNotification) {
        
        let alertController = UIAlertController(title: "Goal Already Exists", message: "There is currently a goal with that name. Please choose a different name.", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            
        }
        
        alertController.addAction(action)
        
        window.rootViewController?.presentViewController(alertController, animated: true, completion: { () -> Void in
            
        })
        
        
        
    }
    
    
}