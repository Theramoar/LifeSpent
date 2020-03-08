//
//  LiveCounterVM.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 05/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import Foundation


class LiveCounterViewModel: ObservableObject {
    private var userData = UserData.shared
    var userInfo: String {
        return "You earn \(userData.userAmountInCents / 100) \(userData.userCurrency) \(userData.userFrequency.rawValue) working \(userData.userHoursPerDay) hours per day, \(userData.userDaysPerWeek) days per week"
    }
}
