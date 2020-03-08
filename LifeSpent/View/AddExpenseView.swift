//
//  ContentView.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 21/10/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI



struct AddExpenseView: View {
    @ObservedObject var viewModel = AddExpenseViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 10) {
                Form {
                    TextField("Enter item's name", text: $viewModel.nameText)
                    HStack {
                        TextField("Enter item's price", text: $viewModel.priceText)
                            .keyboardType(.decimalPad)
                        Text(viewModel.currency)
                    }
                    TextField("Why should I buy this item?", text: $viewModel.reasonText)
                    
                    if viewModel.resultString != "" {
                        Button(action: {
                            self.viewModel.addExpense()
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack (alignment: .center) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text(viewModel.resultString)
                                    .bold()
                                    .lineLimit(nil)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Add Expense")
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
