//
//  UserExpense.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import Foundation



class UserExpenses: ObservableObject {
    static var shared = UserExpenses()
    @Published var expensesList = [UserExpense]()
}

struct UserExpense: Identifiable {
    var id = UUID()
    var name: String
    var priceInCents: Int
    var currency: String
    var minutesSpent: Int
}
