//
//  AddTransactionVM.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 05/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

class AddExpenseViewModel: ObservableObject {
    private var userData = UserData.shared
    @Published var priceText: String = ""
    @Published var nameText: String = ""
    @Published var reasonText: String = ""
    var currency: String { return userData.userCurrency }
    
    var resultString: String {
        if priceText.isEmpty {
            return ""
        }
        else {
            return "You spent \(priceInTimeString) of your life to buy this item"
        }
    }
    var minutesSpent: Int {
        let userAmountPerMinute = userData.userAmountInCents / userData.userFrequencyInMinutes
        return priceInCents / userAmountPerMinute
    }
    var priceInCents: Int {
        let textValue = priceText.replacingOccurrences(of: ",", with: ".")
        let doubleValue = Double(textValue) ?? 0
        let centValue = doubleValue * 100
        return Int(centValue)
    }
    var priceInTimeString: String {
        return DataCalculator.createTimeString(minutesSpent)
    }
    
    func addExpense() {
        CoreDataManager.saveExpense(name: nameText,
                                    priceInCents: priceInCents,
                                    currency: userData.userCurrency,
                                    minutesSpent: minutesSpent)
    }
}
