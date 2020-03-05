//
//  UserData.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 22/10/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import Foundation


enum Frequency: String, CaseIterable {
    case perHour = "per hour"
    case perDay = "per day"
    case perWeek = "per week"
    case perMonth = "per month"
}

class UserData {
    
    static let shared = UserData()
    
    private init() {}
    
    var userAmountInCents: Int = UserDefaults.standard.integer(forKey: "userAmount") {
        didSet {
            UserDefaults.standard.set(userAmountInCents, forKey: "userAmount")
        }
    }
    
    var userCurrency: String = UserDefaults.standard.string(forKey: "userCurrency") ?? "" {
        didSet {
            UserDefaults.standard.set(userCurrency, forKey: "userCurrency")
        }
    }
    
    var userHoursPerDay: Int = UserDefaults.standard.integer(forKey: "userHoursPerDay") {
        didSet {
            UserDefaults.standard.set(userHoursPerDay, forKey: "userHoursPerDay")
        }
    }
    
    var userDaysPerWeek: Int = UserDefaults.standard.integer(forKey: "userDaysPerWeek") {
         didSet {
             UserDefaults.standard.set(userDaysPerWeek, forKey: "userDaysPerWeek")
         }
     }
    
    var userFrequencyInMinutes: Int = UserDefaults.standard.integer(forKey: "userFrequency") {
        didSet {
            UserDefaults.standard.set(userFrequencyInMinutes, forKey: "userFrequency")
        }
    }
    
    var userFrequency: Frequency {
        if userFrequencyInMinutes == 60 {
            return .perHour
        }
        else if userFrequencyInMinutes == (60 * userHoursPerDay) {
            return .perDay
        }
        else if userFrequencyInMinutes == 60 * userHoursPerDay * userDaysPerWeek {
            return .perWeek
        }
        else if userFrequencyInMinutes == 60 * userHoursPerDay * userDaysPerWeek * 4 {
            return .perMonth
        }
        return .perHour
    }
}
