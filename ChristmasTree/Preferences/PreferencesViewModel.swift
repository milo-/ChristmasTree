//
//  PreferencesViewModel.swift
//  ChristmasTree
//
//  Created by Milo Hill on 08/01/2020.
//  Copyright © 2020 Milo Hill. All rights reserved.
//

import Foundation

class PreferencesViewModel: ObservableObject {
    @Published var lightState: LightState = .on
    @Published var starState: StarState = .on
}

enum LightState {
    case off
    case on
    case animated

    var title: String {
        switch self {
            case .off:
                return "Off"
            case .on:
                return "On"
            case .animated:
                return "Animated"
        }
    }
}

enum StarState {
    case off
    case on
    case animated
    case disabled

    var title: String {
        switch self {
            case .off:
                return "Off"
            case .on:
                return "On"
            case .animated:
                return "Blink"
            case .disabled:
                return "Disabled"
        }
    }
}
