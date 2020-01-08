//
//  PreferencesView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import SwiftUI
import Combine

struct PreferencesView: View {
    @EnvironmentObject var preferences: PreferencesViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            LightsControlView(lightState: $preferences.lightState)
            StarControlView(starState: $preferences.starState)
            Text(preferences.lightState.title)
            Text(preferences.starState.title)
        }.padding(5)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var defaultPrefs = PreferencesViewModel()
    static var previews: some View {
        PreferencesView().environmentObject(defaultPrefs)
    }
}
