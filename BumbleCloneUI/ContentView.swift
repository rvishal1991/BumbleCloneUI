//
//  ContentView.swift
//  BumbleCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        List{
            Button("Open Bumble") {
                router.showScreen(.fullScreenCover) { _ in
                    BumbleHomeView()
                }
            }
        }
    }
}

#Preview {
    
    RouterView { _ in
        ContentView()
    }
}
