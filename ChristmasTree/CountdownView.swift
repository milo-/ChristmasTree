//
//  CountdownView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct CountdownView: View {
    @ObservedObject var countdownModel = ChristmasCountdownViewModel()

    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            Text(countdownModel.daysToChristmas)
                .bold()
                .foregroundColor(.white)
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)

        }
            .fixedSize()
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 2, y: 2  )
            .offset(x: 0, y: -5)
    }
}


struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
