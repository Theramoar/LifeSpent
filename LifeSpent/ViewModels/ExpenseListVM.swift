//
//  ExpenseListVM.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 06/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI
import CoreData


class ExpenseListViewModel: ObservableObject {
    
    var expenses: FetchedResults<UserExpense>
    
    init(expenses: FetchedResults<UserExpense>) {
        self.expenses = expenses
    }

    
    func deleteExpense(at index: Int) {
        let deleteExpense = expenses[index]
        CoreDataManager.deleteExpense(deleteExpense)
    }
}
