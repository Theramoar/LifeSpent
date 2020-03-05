//
//  EnterDataView.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 22/10/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI


struct EnterUserDataView: View {
    @ObservedObject var viewModel = EnterUserDataViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("How much do you earn?", text: $viewModel.amountString)
                    .keyboardType(.decimalPad)
                
                Picker("Currency", selection: $viewModel.selectedCurrency) {
                    ForEach(0 ..< viewModel.currencies.count) {
                        Text("\(self.viewModel.currencies[$0])")
                    }
                }
                
                Picker("Frequency", selection: $viewModel.selectedFrequency) {
                    ForEach(0 ..< Frequency.allCases.count) { position in
                        Text("\(Frequency.allCases[position].rawValue)")
                    }
                }
                Section {
                    Picker("How many hours do you work per day?", selection: $viewModel.hoursPerDay) {
                        ForEach(0 ..< 25) {
                            Text("\($0)")
                            
                        }
                    }
                    
                    Picker("How many days do you work per week?", selection: $viewModel.daysPerWeek) {
                        ForEach(0 ..< 8) {
                            Text("\($0)")
                        }
                    }
                }
                Section {
                    Button("Save") {
                        if self.viewModel.saveData() {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        else {
                            self.showAlert = true
                            return
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Something went wrong!"),
                              message: Text("Check the entered data!"),
                              dismissButton: .default(Text("OK")))
                    }
                }
            }
            .navigationBarTitle("Configure earnings")
        }
    }
}
    
    


