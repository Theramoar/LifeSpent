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
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let expensesListView = ExpensesListView().environment(\.managedObjectContext, context)
        
        let transactionHostVC = UIHostingController(rootView: expensesListView)
        transactionHostVC.tabBarItem.title = "Expenses"
        transactionHostVC.tabBarItem.image = UIImage(systemName: "dollarsign.circle")
        
        let liveCounterHostVC = UIHostingController(rootView: LiveCounterView())
        liveCounterHostVC.tabBarItem.title = "Live Counter"
        liveCounterHostVC.tabBarItem.image = UIImage(systemName: "timer")
        
        viewControllers = [transactionHostVC, liveCounterHostVC]
    }
}
