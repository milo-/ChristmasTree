//
//  ChristmasCountdownViewModel.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import Foundation
import AppKit

class ChristmasCountdownViewModel: ObservableObject {
    @Published var daysToChristmas: String = "0"

    init() {
        updateCount()
        let _ = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateCount),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func updateCount() {
        daysToChristmas = daysToString(days: getDaysToChristmas())
        NSApplication.shared.dockTile.badgeLabel = daysToChristmas
    }

    private func daysToString(days: Int) -> String {
        if days == 0 {
            return "Xmas!"
        }

        return String(describing: days)
    }

    private func getDaysToChristmas() -> Int {
        let xmasComponents = DateComponents(month: 12, day: 26)

        let nextXmas = Calendar.current.nextDate(
            after: Date(),
            matching: xmasComponents,
            matchingPolicy: .nextTimePreservingSmallerComponents
        )!

        return Calendar
            .current
            .dateComponents([.day], from: Date() , to: nextXmas)
            .day!
    }
}
