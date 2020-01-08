//
//  StarControlView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 08/01/2020.
//  Copyright © 2020 Milo Hill. All rights reserved.
//

import Foundation
import SwiftUI

struct StarControlView: View {
    @Binding var starState: StarState
    var body: some View {
        Section {
            Picker(selection: $starState, label: Text("Star")) {
                Text(StarState.on.title).tag(StarState.on)
                Text(StarState.off.title).tag(StarState.off)
                Text(StarState.animated.title).tag(StarState.animated)
                Text(StarState.disabled.title).tag(StarState.disabled)
            }.pickerStyle(PopUpButtonPickerStyle())
        }
    }
}
