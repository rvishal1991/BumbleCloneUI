//
//  BumbleChatPreviewCell.swift
//  BumbleCloneUI
//
//  Created by apple on 09/05/25.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var imageName:String = Constants.randomImage
    var percentageRemaining:Double =  Double.random(in: 0...1)
    var hasNewMessage:Bool = true
    var userName: String = "Vishal"
    var lastChatMessage:String? = "This is last message"
    var isYourMove:Bool = true
    
    
    var body: some View {
        
        HStack(spacing: 16){
            BumbleProfileImageCell(
                imageName: imageName,
                percentageRemaining: percentageRemaining,
                hasNewMessage: hasNewMessage
            )
            
            VStack(alignment: .leading, spacing: 2){
                HStack(spacing: 0){
                    Text(userName)
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .foregroundStyle(.bumbleBlack)
                            .background(Color.bumbleYellow)
                            .cornerRadius(32)
                        
                    }
                }
               
                if let lastChatMessage = lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGrey)
                        .padding(.trailing, 16)
                }
            }
        }
        .lineLimit(1)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

#Preview {
    VStack {
        BumbleChatPreviewCell()
        BumbleChatPreviewCell()
        BumbleChatPreviewCell()
        BumbleChatPreviewCell()

    }
}
