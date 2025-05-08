//
//  BumbleCloneUIApp.swift
//  BumbleCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI
import SwiftfulRouting

@main
struct BumbleCloneUIApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView {_ in 
                ContentView()
            }
        }
    }
}
