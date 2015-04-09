//
//  ViewController.swift
//  GetDate
//
//  Created by Saul on 4/9/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bttnReturn: UIButton!
    @IBOutlet var bttnTodayIs: UIButton!
    var newWeekday:Int!
    var newMonth:Int!
    var newDay:Int!
    
    var returnDay:Int!
    var returnMonth:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            getDayOfWeek(getNextWeekDate(1))
            var weekday = convertWeekdayToString(newWeekday)
            var month = convertMonthToString(newMonth)
            bttnTodayIs.setTitle("Est. Del \(weekday) \(month) \(newDay)", forState: .Normal)
            getDayOfWeek(getNextWeekDate(52 + 1))
            returnDay = newDay
            returnMonth = newMonth
            var retMonth = convertMonthToString(returnMonth)
        
            bttnReturn.setTitle("Est. Ret. \(retMonth) \(returnDay)", forState: .Normal)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func getDayOfWeek(today:String) {
        
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.dateFromString(today) {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
            let myComponents = myCalendar!.components(.CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: todayDate)
            newWeekday = myComponents.weekday
            newMonth = myComponents.month
            newDay = myComponents.day
        } else {
            println("Error")
        }
    }
    
    func getNextWeekDate(weekValue:Int)->String
    {
        var nextWeekDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.CalendarUnitWeekOfYear, value: weekValue, toDate: NSDate(), options: nil)!
        let styler = NSDateFormatter()
        styler.dateFormat = "yyyy-MM-dd"
        var nextWeekDateString = styler.stringFromDate(nextWeekDate)
        return nextWeekDateString
    }
    
    func getCurrentDate()->String
    {
        var todaysDate:NSDate = NSDate()
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var DateInFormat:String = dateFormatter.stringFromDate(todaysDate)
        return DateInFormat
    }
    
    
    
    
    func convertMonthToString(monthNumber:Int)->String
    {
        switch(monthNumber){
        case 1:
            return "Jan."
        case 2:
            return "Feb."
        case 3:
            return "Mar."
        case 4:
            return "Apr."
        case 5:
            return "May"
        case 6:
            return "Jun."
        case 7:
            return "Jul."
        case 8:
            return "Aug."
        case 9:
            return "Sep."
        case 10:
            return "Oct."
        case 11:
            return "Nov."
        case 12:
            return "Dec."
        default:
            return "None"
            
        }
    }

    
    
    func convertWeekdayToString(dayNumber:Int)->String
    {
        switch(dayNumber){
        case 1:
            return "Sun"
        case 2:
            return "Mon"
        case 3:
            return "Tues"
        case 4:
            return "Wed"
        case 5:
            return "Thur"
        case 6:
            return "Fri"
        case 7:
            return "Sat"
        default:
            return "None"

            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

