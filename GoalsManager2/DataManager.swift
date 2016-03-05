//
//  DataManager.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation


class GoalsData {
    
    static var dailyGoalsName: [String] = []
    static var dailyGoalsDetails: [String:AnyObject] = [:]
    
    static var longtermGoalsName: [String] = []
    static var longtermGoalsDetails: [String:AnyObject] = [:]
    
    static var completedGoalsName: [String] = []
    static var completedGoalsDetails: [String:AnyObject] = [:]
    
}

enum DetailsType: String {
    case Date = "date"
    case Deadline = "deadline"
    case Summary = "summary"
    case Priority = "priority"
    case Name = "name"
}

enum GoalType {
    case Daily
    case Longterm
    case Completed
}


class DictionaryManager {
    
    static func addToDictionary(detailsType: DetailsType, goalType: GoalType,data: AnyObject, goalName: String) {
        
        let key: String = "\(goalName):\(detailsType.rawValue)"
        
        switch goalType {
        case .Daily: GoalsData.dailyGoalsDetails.updateValue(data, forKey: key)
        case .Longterm: GoalsData.longtermGoalsDetails.updateValue(data, forKey: key)
        case .Completed: GoalsData.completedGoalsDetails.updateValue(data, forKey: key)
            
        }
        
    }
    
    static func getFromDictionary(desiredData: DetailsType, goalType: GoalType, goalName: String) -> AnyObject {
        
        let key: String = "\(goalName):\(desiredData.rawValue)"
        
        let data: AnyObject?

        switch goalType {
        case .Daily: data = GoalsData.dailyGoalsDetails[key]
        case .Longterm: data = GoalsData.longtermGoalsDetails[key]
        case .Completed: data = GoalsData.completedGoalsDetails[key]
            
        }
        
        guard let unwrappedData = data else { print("getFromDictionary failed") ; return "" }
            
        return unwrappedData
        
    }
    
}

class DateFormatter {
    
    static func getDaysAndHoursString(date: NSDate) -> String {
        
        let formatter = NSDateFormatter()
        
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let dateString = formatter.stringFromDate(date)
        
        return dateString

    }
}

class DataSaver {
    
    static func saveDetails(goalType: GoalType) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        switch goalType {
        case .Daily: defaults.setObject(GoalsData.dailyGoalsDetails, forKey: "dailyDetails")
        case .Longterm: defaults.setObject(GoalsData.longtermGoalsDetails, forKey: "longtermDetails")
        case .Completed: defaults.setObject(GoalsData.completedGoalsDetails, forKey: "completedDetails")
            

        }
        
    }
    
    static func saveArray(goalType: GoalType) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        switch goalType {
        case .Daily: defaults.setObject(GoalsData.dailyGoalsName, forKey: "dailyArray")
        case .Longterm: defaults.setObject(GoalsData.longtermGoalsName, forKey: "longtermArray")
        case .Completed: defaults.setObject(GoalsData.completedGoalsName, forKey: "completedArray")
            
            
        }
        
    }
}


