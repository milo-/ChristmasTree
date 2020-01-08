//
//  LightsView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 08/01/2020.
//  Copyright © 2020 Milo Hill. All rights reserved.
//

import Foundation
import SwiftUI

struct LightsView: View {
    @State var lightOpacityA: Double = 0
    @State var lightOpacityB: Double = 1

    var animation = Animation.easeIn(duration: 0.3).delay(4).repeatForever()
    var body: some View {
        ZStack(alignment: .center) {
            Image("LightsA")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(lightOpacityA)

            Image("LightsB")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(lightOpacityB)
        }
        .onAppear(perform: {
            withAnimation(self.animation) {
                self.lightOpacityA = 1
                self.lightOpacityB = 0
            }
        })
    }
}
