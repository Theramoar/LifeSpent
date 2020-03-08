//
//  UserExpense.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import CoreData
import UIKit

class UserExpense: NSManagedObject, Identifiable {
    @NSManaged var id: UUID?
    @NSManaged var name: String?
    @NSManaged var priceInCents: NSNumber?
    @NSManaged var currency: String?
    @NSManaged var minutesSpent: NSNumber?
}

extension UserExpense {
    static func getAllExpensesFetchRequest() -> NSFetchRequest<UserExpense> {
        let request: NSFetchRequest<UserExpense> = UserExpense.fetchRequest() as! NSFetchRequest<UserExpense>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
 
