//
//  AppDelegate.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let dataSaver = DataSaver()
    
    let localNotification = LocalNotification()
    
    
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        dataSaver.loadArrays()
        dataSaver.loadDictionaries()
        UIApplication.sharedApplication().registerUserNotificationSettings(localNotification.settings)
        
        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        if let notificationID = notification.userInfo {
            if let id = notificationID["id"] {
                if id as! Int == 1 {
                    
                    localNotification.actionForNameTakenNotification(window: window!, notification: notification)

                }
                
                if id as! Int == 2 {
                    
                    localNotification.noNameAlert(window: window!, notification: notification)
                    
                }
                
                
            }
            
            
        }
        
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
        dataSaver.checkAndSaveArrays()
        dataSaver.saveDetailsDictionary()
        
        
        func applicationWillEnterForeground(application: UIApplication) {
            // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        }
        
        func applicationDidBecomeActive(application: UIApplication) {
            // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        }
        
        func applicationWillTerminate(application: UIApplication) {
            
            dataSaver.checkAndSaveArrays()

            
        }
        
        
}

}
