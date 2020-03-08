//
//  ExpenseView.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 07/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

struct ExpenseView: View {
    let viewModel: ExpenseViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.timeString)
                .bold()
                .lineLimit(nil)
                .font(.system(size: 20))
            Text("\(viewModel.currency) \(viewModel.priceString)")
            Text("Why did I buy this item:")
                .font(.headline)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .lineLimit(nil)
            Spacer()
        }
        .padding()
            
        .navigationBarTitle(viewModel.name)
    }
}



struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(viewModel: ExpenseViewModel(expense: testExpense))
    }
}
