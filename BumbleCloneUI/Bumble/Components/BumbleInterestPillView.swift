//
//  BumbleInterestPillView.swift
//  BumbleCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI

struct BumbleInterestPillView: View {
    
    var iconName:String? = "heart.fill"
    var emoji:String? = "😀"
    var text:String = "Graduated from LJIET"
    
    var body: some View {
        
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            }else if let emoji {
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .cornerRadius(32)
    }
}

#Preview {
    VStack{
        BumbleInterestPillView(iconName: nil)
        BumbleInterestPillView()
    }
}
