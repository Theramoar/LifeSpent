//
//  ExpenseCellView.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

struct ExpenseCellView: View {
    var expense: UserExpense
    var timeString: String {
        return DataCalculator.createTimeString(expense.minutesSpent)
    }
    var priceString: String {
        let doubleValue = Double(expense.priceInCents)
        return String(format: "%.2f", doubleValue / 100)
    }
    
    var body: some View {
        HStack {
            HStack {
            VStack (alignment: .leading) {
                Text(expense.name)
                    .font(.title)
                    .bold()
                Text("\(timeString) to buy this item")
                    .font(.caption)
            }
            Spacer()
            Text("\(expense.currency) \(priceString)")
                .bold()
            }
        .padding()
        }
    }
}

struct ExpenseCellView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCellView(expense: UserExpense(name: "Playstation", priceInCents: 40000, currency: "EUR", minutesSpent: 70000))
    }
}
