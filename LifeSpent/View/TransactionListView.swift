//
//  TransactionListView.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

struct TransactionListView: View {
    
    @ObservedObject var userExpenses = UserExpenses()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List(UserExpenses.shared.expensesList) { expense in
                ExpenseCellView(expense: expense)
            }
            .navigationBarTitle(Text("Transactions"))
            .navigationBarItems(trailing: Button("Add Expense") {
                self.showingSheet.toggle()
            })
            .sheet(isPresented: $showingSheet) {
                AddTransactionView()
            }
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
