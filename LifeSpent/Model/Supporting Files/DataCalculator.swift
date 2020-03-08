//
//  DataCalculator.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 21/10/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import Foundation

struct Time {
    let minute: Int = 1
    let hour: Int
    let day: Int
    let week: Int
    
    init() {
        self.hour = minute * 60
        self.day = hour * 24
        self.week = day * 7
    }
}

class DataCalculator {
    
    static func createTimeString(_ minutes: Int) -> String {
        var timeString: String = ""
        var minutes = minutes
        let time = Time()
        
        let weeks = minutes / time.week
        minutes = minutes % time.week
        let days = minutes / time.day
        minutes = minutes % time.day
        let hours = minutes / time.hour
        minutes = minutes % time.hour
        
        timeString = createString(weeks, days, hours, minutes)
       
        return timeString
    }
    
    private static func createString(_ weeks: Int, _ days: Int, _ hours: Int, _ minutes: Int ) -> String {
        var timeString: String = ""
        
        var weekString: String = weeks == 0 ? "" : "\(weeks) weeks"
        
        var daysString: String = days == 0 ? "" : "\(days) days"
        var hoursString: String = hours == 0 ? "" : "\(hours) hours"
        var minutesString: String = minutes == 0 ? "" : "\(minutes) minutes"
        
        checkForPluralForm(weeks, &weekString)
        checkForPluralForm(days, &daysString)
        checkForPluralForm(hours, &hoursString)
        checkForPluralForm(minutes, &minutesString)
        
        timeString = createStringPart(for: timeString, weekString)
        timeString = createStringPart(for: timeString, daysString)
        timeString = createStringPart(for: timeString, hoursString)
        timeString = createStringPart(for: timeString, minutesString)
 
        return timeString
    }
    
    private static func checkForPluralForm(_ number: Int, _ string: inout String) {
        if number == 1 {
            string.removeLast()
        }
    }
    
    private static func createStringPart(for timeString: String, _ string: String) -> String {
        var timeString = timeString
        
        if timeString.isEmpty {
            timeString += string
        }
        else if !string.isEmpty {
            timeString += ", \(string)"
        }
        return timeString
    }
    
}
