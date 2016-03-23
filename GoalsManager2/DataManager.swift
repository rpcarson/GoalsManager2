//
//  DataManager.swift
//  GoalsManager2
//
//  Created by Reed Carson on 3/1/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation


class Status {
    
    static var isDaily: Bool = true
    static var isNew: Bool = true
}


class GoalsData {
    
    static var dailyGoalsName: [String] = []
    static var dailyGoalsDetails: [String:AnyObject] = [:]
    
    static var longtermGoalsName: [String] = []
    static var longtermGoalsDetails: [String:AnyObject] = [:]
    
    static var completedGoalsName: [String] = []
    static var completedGoalsDetails: [String:AnyObject] = [:]
    
    static var selectedCell: String?
    static var selectedCellIndex: Int?
    
    
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
        
        print("key: \(key)")
        print(GoalsData.dailyGoalsDetails[key])
        print("details array: \(GoalsData.dailyGoalsDetails)")

        switch goalType {
        case .Daily: data = GoalsData.dailyGoalsDetails[key]
        case .Longterm: data = GoalsData.longtermGoalsDetails[key]
        case .Completed: data = GoalsData.completedGoalsDetails[key]
            
        }
        
        print("getfromdict data: \(data)")
        
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
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func saveDetails(goalType: GoalType) {
        
        
        switch goalType {
        case .Daily: defaults.setObject(GoalsData.dailyGoalsDetails, forKey: "dailyDetails")
        case .Longterm: defaults.setObject(GoalsData.longtermGoalsDetails, forKey: "longtermDetails")
        case .Completed: defaults.setObject(GoalsData.completedGoalsDetails, forKey: "completedDetails")
            

        }
        
    }
    
    func saveDetailsDictionary() {
        
        defaults.setObject(GoalsData.dailyGoalsDetails, forKey: "dailyDetails")
        defaults.setObject(GoalsData.longtermGoalsDetails, forKey: "longtermDetails")
        defaults.setObject(GoalsData.completedGoalsDetails, forKey: "completedDetails")
        
        
    }
    
     func saveArray(goalType: GoalType) {
        
        switch goalType {
        case .Daily: defaults.setObject(GoalsData.dailyGoalsName, forKey: "dailyArray")
        case .Longterm: defaults.setObject(GoalsData.longtermGoalsName, forKey: "longtermArray")
        case .Completed: defaults.setObject(GoalsData.completedGoalsName, forKey: "completedArray")
            
            
        }
        
    }
    
    func checkAndSaveArrays() {
        if !GoalsData.dailyGoalsName.isEmpty {
            saveArray(.Daily)
            print("daily array saved")
        }
        
        if !GoalsData.longtermGoalsName.isEmpty {
            saveArray(.Longterm)
            print("longterm array saved")
        }
        
        if !GoalsData.completedGoalsName.isEmpty {
            saveArray(.Completed)
        }
        
    }
    
    func loadArrays() {
        
        if let daily = defaults.objectForKey("dailyArray") {
            GoalsData.dailyGoalsName = daily as! [String]
            print("daily saved loaded")
        }
        
        if let longterm = defaults.objectForKey("longtermArray") {
            GoalsData.longtermGoalsName = longterm as! [String]
            print("longterm saved loaded")
        }
        
        if let completed = defaults.objectForKey("completedArray") {
            GoalsData.completedGoalsName = completed as! [String]
            print("completed saved loaded")
        }
        
    }
    
    func loadDictionaries() {
        
        if let daily = defaults.objectForKey("dailyDetails") {
            GoalsData.dailyGoalsDetails = daily as! [String:AnyObject]
            print("daily saved loaded")
        }
        
        if let longterm = defaults.objectForKey("longtermDetails") {
            GoalsData.longtermGoalsDetails = longterm as! [String:AnyObject]
            print("longterm saved loaded")
        }
        
        if let completed = defaults.objectForKey("completedDetails") {
            GoalsData.completedGoalsDetails = completed as! [String:AnyObject]
            print("completed saved loaded")
        }
        
        
    }
    
    
}

/*
class SavableGoals: NSObject, NSCoding {
    
    var dailyGoals: [String]
    var dailyDetails: [String:AnyObject]
    var longtermGoals: [String]
    var longtermDetails: [String:AnyObject]
    var completedGoals: [String]
    var completedDetails: [String:AnyObject]
    
    
    
    required init(coder aDecoder: NSCoder) {
        
        dailyGoals = aDecoder.decodeObjectForKey("dailyGoals") as! [String]
        dailyDetails = aDecoder.decodeObjectForKey("dailyDetails") as! [String:AnyObject]
        longtermGoals = aDecoder.decodeObjectForKey("longtermGoals") as! [String]
        longtermDetails = aDecoder.decodeObjectForKey("longtermDetails") as! [String:AnyObject]
        completedGoals = aDecoder.decodeObjectForKey("completedGoals") as! [String]
        completedDetails = aDecoder.decodeObjectForKey("completedDetails") as! [String:AnyObject]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(dailyGoals, forKey: "dailyGoals")
        aCoder.encodeObject(dailyDetails, forKey: "dailyDetails")
        aCoder.encodeObject(longtermGoals, forKey: "longtermGoals")
        aCoder.encodeObject(longtermDetails, forKey: "longtermDetails")
        aCoder.encodeObject(completedGoals, forKey: "completedGoals")
        aCoder.encodeObject(completedDetails, forKey: "completedDetails")
    }
    
}



*/

class SavableGoals: NSObject, NSCoding {
    
    var dailyGoals = GoalsData.dailyGoalsName
    var dailyDetails = GoalsData.dailyGoalsDetails
    var longtermGoals = GoalsData.longtermGoalsName
    var longtermDetails = GoalsData.longtermGoalsDetails
    var completedGoals = GoalsData.completedGoalsName
    var completedDetails = GoalsData.completedGoalsDetails
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(dailyGoals, forKey: "dailyGoals")
        aCoder.encodeObject(dailyDetails, forKey: "dailyDetails")
        aCoder.encodeObject(longtermGoals, forKey: "longtermGoals")
        aCoder.encodeObject(longtermDetails, forKey: "longtermDetails")
        aCoder.encodeObject(completedGoals, forKey: "completedGoals")
        aCoder.encodeObject(completedDetails, forKey: "completedDetails")
    }
    
    required init(coder aDecoder: NSCoder) {
        
        dailyGoals = aDecoder.decodeObjectForKey("dailyGoals") as! [String]
        dailyDetails = aDecoder.decodeObjectForKey("dailyDetails") as! [String:AnyObject]
        longtermGoals = aDecoder.decodeObjectForKey("longtermGoals") as! [String]
        longtermDetails = aDecoder.decodeObjectForKey("longtermDetails") as! [String:AnyObject]
        completedGoals = aDecoder.decodeObjectForKey("completedGoals") as! [String]
        completedDetails = aDecoder.decodeObjectForKey("completedDetails") as! [String:AnyObject]
        
        super.init()
    }
    
}

class Archiver {
    
    var data = [SavableGoals]()
    
    let archiveURL: NSURL = {
        
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.URLByAppendingPathComponent("data.archive")
        
    }()
    
    func save() -> Bool {
        
        print("data saved to: \(archiveURL.path!)")
        
        return NSKeyedArchiver.archiveRootObject(data, toFile: archiveURL.path!)
        
    }
    
    func load() {
        
        if let archivedData = NSKeyedUnarchiver.unarchiveObjectWithFile(archiveURL.path!) as? [SavableGoals] {
            
            let goals = data[0]
            
            GoalsData.dailyGoalsName = goals.dailyGoals
            
        }
        
    }
    
   
    
   
    
}






