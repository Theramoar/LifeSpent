//
//  TransactionListView.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

struct ExpensesListView: View {
    
    // @FetchRequest can be used only in View. View reacts only on changes in @FetchRequest. -> Can't find a way to initialize @FetchRequest in viewModel
    @FetchRequest(entity: UserExpense.entity(), sortDescriptors: []) var expenses: FetchedResults<UserExpense>
    var viewModel: ExpenseListViewModel {
        return ExpenseListViewModel(expenses: expenses)
    }
    @State private var showingSheet = false
    @State private var showExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.expenses) { expense in
                    //ZStack is used to hide navigation arrow
                    ZStack {
                        ExpenseCellView(expense: expense)
                        NavigationLink(destination: ExpenseView(viewModel: ExpenseViewModel(expense: expense))) {
                            EmptyView()
                        }
                    }
                }.onDelete { indexSet in
                    guard let index = indexSet.first else { return }
                    self.viewModel.deleteExpense(at: index)
                }
            }
                
            .navigationBarTitle(Text("Transactions"))
            .navigationBarItems(trailing: Button("Add Expense") {
                self.showingSheet.toggle()
            })
                .sheet(isPresented: $showingSheet) {
                    AddExpenseView()
            }
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesListView()
    }
}
