//
//  AppDelegate.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import Cocoa
import SwiftUI

class MyWindow: NSWindow {
    // Fix resize cursor not being visible
    override var canBecomeKey: Bool {
        return true
    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var preferences: PreferencesViewModel = PreferencesViewModel()
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        createPreferences(preferences: preferences)
        // Create the window and set the content view.
        window = MyWindow(
            contentRect: NSRect(x: 0, y: 0, width: 100, height: 100),
            styleMask: [.resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        window.preservesContentDuringLiveResize = true
        window.showsResizeIndicator = true
        window.isMovableByWindowBackground = true
        window.setFrameAutosaveName("Main Window aa ")
        window.title = "Christmas Tree"
        window.contentView = NSHostingView(rootView: ContentView().environmentObject(preferences))
        window.makeKeyAndOrderFront(nil)
        window.setFrameAutosaveName("main")
        window.isOpaque = true
        window.backgroundColor = .clear
//        openPreferences(preferences: preferences)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func openPreferences(_ sender: Any) {
        createPreferences(preferences: preferences)
    }
}

func createPreferences(preferences: PreferencesViewModel) {
    // Create the SwiftUI view that provides the window contents.
    let contentView = PreferencesView().environmentObject(preferences)

    // Create the window and set the content view.
    let window = MyWindow(
        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        backing: .buffered, defer: false)
    window.center()
    window.setFrameAutosaveName("Preferences Window")
    window.contentView = NSHostingView(rootView: contentView)
    window.isMovableByWindowBackground = true
    window.makeKeyAndOrderFront(nil)
    window.title = "Preferences"
    window.titleVisibility = .visible
}
