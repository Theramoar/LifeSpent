//
//  ExpenseVM.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 08/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    private let expense: UserExpense
    var name: String { return expense.name ?? "" }
    var currency: String { return expense.currency ?? "USD" }
    var timeString: String {
        let priceInTimeString = DataCalculator.createTimeString(expense.minutesSpent as! Int)
        return "\(priceInTimeString) of my life to buy this item"
    }
    var priceString: String {
        let doubleValue = Double(truncating: expense.priceInCents ?? 0)
        return String(format: "%.2f", doubleValue / 100)
    }
    
    init(expense: UserExpense) {
        self.expense = expense
    }
}

