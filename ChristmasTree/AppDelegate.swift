//
//  AppDelegate.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.resizable],
            backing: .buffered, defer: false)
        window.minSize = CGSize(width: 480, height: 300)
        window.contentMinSize = CGSize(width: 480, height: 300)
        window.maxSize = CGSize(width: 480, height: 300)
        window.showsResizeIndicator = true
        window.isMovableByWindowBackground = true
        window.preservesContentDuringLiveResize = true
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.title = "Christmas Tree"
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.backgroundColor = .clear
        window.isOpaque = false
        window.isMovableByWindowBackground = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

func openPreferences() {
    // Create the SwiftUI view that provides the window contents.
    let contentView = PreferencesView()

    // Create the window and set the content view.
    let window = NSWindow(
        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        styleMask: [.resizable, .fullSizeContentView, .closable, .miniaturizable, .unifiedTitleAndToolbar],
        backing: .buffered, defer: false)
    window.center()
    window.setFrameAutosaveName("Preferences Window")
    window.contentView = NSHostingView(rootView: contentView)
    window.isMovableByWindowBackground = true
    window.makeKeyAndOrderFront(nil)
}
