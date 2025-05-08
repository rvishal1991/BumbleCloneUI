//
//  BumbleInterestPillGridView.swift
//  BumbleCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI
import SwiftfulUI

struct UserInterst{
    let id = UUID().uuidString
    var iconName:String? = nil
    var emoji:String? = nil
    var text:String
}

struct BumbleInterestPillGridView: View {
    
    var interests: [UserInterst] = User.mock.interests
    
    var body: some View {
        
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest{
                    BumbleInterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                }else{
                    EmptyView()
                }
            }
            
            
        }
    }
}

#Preview {
    VStack(spacing:32) {
        BumbleInterestPillGridView(interests: User.mock.interests)
        BumbleInterestPillGridView(interests: User.mock.basics)

    }
}
