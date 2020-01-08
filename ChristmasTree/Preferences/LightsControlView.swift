//
//  LightsControlView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 08/01/2020.
//  Copyright © 2020 Milo Hill. All rights reserved.
//

import Foundation
import SwiftUI

struct LightsControlView: View {
    @Binding var lightState: LightState
    var body: some View {
        Section {
            Picker(selection: $lightState, label: Text("Lights")) {
                Text(LightState.on.title).tag(LightState.on)
                Text(LightState.off.title).tag(LightState.off)
                Text(LightState.animated.title).tag(LightState.animated)
            }.pickerStyle(PopUpButtonPickerStyle())
        }
    }
}
