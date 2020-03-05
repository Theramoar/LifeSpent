//
//  MainTabViewController.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    var userData = UserData.shared
    
    override func viewDidLoad() {
        let expense = UserExpense(name: "Playstaion", priceInCents: 40000, currency: "EUR", minutesSpent: 80000)
        UserExpenses.shared.expensesList.append(expense)
        let transactionHostVC = UIHostingController(rootView: TransactionListView())
        transactionHostVC.tabBarItem.title = "Expenses"
        transactionHostVC.tabBarItem.image = UIImage(systemName: "dollarsign.circle")
        let liveCounterHostVC = UIHostingController(rootView: LiveCounterView(userData: userData))
        liveCounterHostVC.tabBarItem.title = "Live Counter"
        liveCounterHostVC.tabBarItem.image = UIImage(systemName: "timer")
        viewControllers = [transactionHostVC, liveCounterHostVC]
    }
}
