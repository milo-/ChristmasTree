//
//  StarViewModel.swift
//  ChristmasTree
//
//  Created by Milo Hill on 08/01/2020.
//  Copyright © 2020 Milo Hill. All rights reserved.
//

import Foundation
import SwiftUI

class StarViewModel: NSObject, ObservableObject {
    @Published var opacityLight: Double = 1
    @Published var opacityDark: Double = 1
    @Published var state: StarState

    private let animationDelay = 2.0
    private let animationDuration = 0.5

    init(state: StarState) {
        self.state = state

        super.init()
        opacityLight = getStartOpacity(for: state).light
        opacityDark = getStartOpacity(for: state).dark
        animationTimer()
    }

    func animationTimer() {
        guard state == .animated else { return }

        Timer.scheduledTimer(withTimeInterval: animationDelay, repeats: true, block: { _ in
            let light = self.opacityLight
            let dark = self.opacityDark

            withAnimation(Animation.easeInOut(duration: self.animationDuration)) {
                self.opacityDark = light
                self.opacityLight = dark
            }
        })
    }

    func getStartOpacity(for state: StarState) -> (light: Double, dark: Double) {
        if state == .on || state == .animated {
            return (light: 1, dark: 0)
        } else if state == .off {
            return (light: 0, dark: 1)
        } else {
            return (light: 0, dark: 0)
        }
    }

    func getEndOpacity(for state: StarState) -> (light: Double, dark: Double) {
        if state == .animated {
            return (light: 0, dark: 1)
        }
        return getStartOpacity(for: state)
    }

    func getAnimation(for state: StarState) -> Animation? {
        guard state == .animated else { return nil }
        return Animation.easeIn(duration: 0.5)
    }
}
