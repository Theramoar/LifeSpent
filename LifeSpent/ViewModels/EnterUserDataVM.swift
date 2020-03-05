//
//  EnterUserDataVM.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

class EnterUserDataViewModel: ObservableObject {
    private var userData = UserData.shared
    @Published var hoursPerDay: Int
    @Published var daysPerWeek: Int
    @Published var amountString: String = ""
    
    @Published var currencies = ["USD", "EUR", "GBP", "CHF", "RUB"]
    @Published var selectedCurrency = 0
    
    var frequency: Frequency {
        return Frequency.allCases[selectedFrequency]
    }
    @Published var selectedFrequency = 0
    
    init() {
        hoursPerDay = userData.userHoursPerDay
        daysPerWeek = userData.userDaysPerWeek
        amountString = String(userData.userAmountInCents / 100)
        selectedCurrency = currencies.firstIndex { $0 == userData.userCurrency } ?? 0
        selectedFrequency = Frequency.allCases.firstIndex { $0 == userData.userFrequency } ?? 0
    }
    
    func saveData() -> Bool {
        if saveFrequency(),
            saveAmount(),
            saveCurrency(),
            saveHoursAndDays() {
            return true
        } else {
            return false
        }
    }
    
    private func saveAmount() -> Bool {
        let amountTextValue = amountString.replacingOccurrences(of: ",", with: ".")
        guard let amountDoubleValue = Double(amountTextValue) else { return false }
        let centValue = amountDoubleValue * 100
        let finalAmount = Int(centValue)
        userData.userAmountInCents = finalAmount
        
        return true
    }
    
    private func saveCurrency() -> Bool {
        guard !currencies.isEmpty else { return false }
        userData.userCurrency = currencies[selectedCurrency]
        return true
    }
    
    private func saveHoursAndDays() -> Bool {
        userData.userHoursPerDay = hoursPerDay
        userData.userDaysPerWeek = daysPerWeek
        return true
    }
    
    //Saves actual number of minutes of frequency
    private func saveFrequency() -> Bool {
        var userFrequency = 0
        switch frequency {
        case .perHour:
            userFrequency = 60
        case .perDay:
            userFrequency = (60 * hoursPerDay)
        case .perWeek:
            userFrequency = 60 * hoursPerDay * daysPerWeek
        case .perMonth:
            userFrequency = 60 * hoursPerDay * daysPerWeek * 4
        }
        userData.userFrequencyInMinutes = userFrequency
        return true
    }
}
