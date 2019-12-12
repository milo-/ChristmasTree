//
//  ContentView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import SwiftUI

struct BaubleView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("BaublesGreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct LightsView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("LightsA")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Image("LightsB")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            ZStack(alignment: .center) {
                Image("Tree")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                LightsView()

                BaubleView()
            }
            CountdownView().offset(x: -10, y: 0)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
