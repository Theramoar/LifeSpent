//
//  LiveCounterView.swift
//  LifeSpent
//
//  Created by Mihails Kuznecovs on 04/03/2020.
//  Copyright © 2020 Mihails Kuznecovs. All rights reserved.
//

import SwiftUI

struct LiveCounterView: View {
    
    @ObservedObject var viewModel = LiveCounterViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            Text(viewModel.userInfo)
            .padding()
                .navigationBarTitle(Text("Live Counter"))
                .navigationBarItems(trailing: Button("Configure Earnings") {
                    self.showingSheet.toggle()
                })
                .sheet(isPresented: $showingSheet) {
                    EnterUserDataView()
            }
        }
    }
}

struct LiveCounterView_Previews: PreviewProvider {
    static var previews: some View {
        LiveCounterView()
    }
}
