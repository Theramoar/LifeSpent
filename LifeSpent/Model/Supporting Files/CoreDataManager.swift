//
//  CoreDataManager.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 06/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager {
        
    static func saveExpense(name: String, priceInCents: Int, currency: String, minutesSpent: Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let expense = UserExpense(context: context)
        expense.name = name
        expense.priceInCents = NSNumber(value: priceInCents)
        expense.minutesSpent = NSNumber(value: minutesSpent)
        expense.currency = currency
        expense.id = UUID()
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    static func deleteExpense(_ expense: UserExpense) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(expense)
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    static func fetchExpenses() -> [UserExpense] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = UserExpense.getAllExpensesFetchRequest()
        let expensesArray = try? context.fetch(request)
        return expensesArray ?? []
    }
}


//For testing
let testExpense = CoreDataManager.fetchExpenses()[0]
