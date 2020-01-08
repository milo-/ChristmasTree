//
//  ContentView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var preferences: PreferencesViewModel

    var size = NSImage(named: "Tree")!.size
    var body: some View {
        HStack(alignment: .bottom) {
            ZStack(alignment: .center) {
                Image("Tree")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .minimumScaleFactor(1)

                LightsView().aspectRatio(size, contentMode: .fit)
                BaubleView().aspectRatio(size, contentMode: .fit)
                StarView(viewModel: StarViewModel(state: preferences.starState))
            }
            CountdownView().offset(x: -10, y: 0)
            Spacer()
                .frame(width: 10, height: 10, alignment: .bottom)
                .background(Color(.red))
        }
        .frame(minWidth: 200, minHeight: 200, alignment: .bottom)
        .padding(.top, 10)
        .background(Color(.clear))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PreferencesViewModel())
    }
}
