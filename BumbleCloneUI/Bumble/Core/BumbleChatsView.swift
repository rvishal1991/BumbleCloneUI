//
//  BumbleChatsView.swift
//  BumbleCloneUI
//
//  Created by apple on 09/05/25.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatsView: View {
    
    
    @Environment(\.router) var router

    @State private var allUsers:[User] = []

    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding(16)
                
                matchQueueSection
                recentChetsSection
            }
            
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    func getData() async  {
        guard allUsers.isEmpty else { return  }
        do{
            allUsers = try await DatabaseHelper().getUsers()
        }catch{
        }
    }
    
    private var header: some View {
        HStack(spacing:0){
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Group {
                Text("Match Queue")
                +
                Text(" (\(allUsers.count))")
                    .foregroundStyle(.bumbleGrey)
            }
            .padding(.horizontal, 16)

            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers){ user in
                        BumbleProfileImageCell(
                            imageName: user.images.randomElement() ?? "",
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            .frame(height: 100)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recentChetsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(spacing: 0){
                Group {
                    Text("Chats")
                    +
                    Text(" (Recent)")
                        .foregroundStyle(.bumbleGrey)
                }
                Spacer(minLength: 0)
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            }
            .padding(16)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers){ user in
                        BumbleChatPreviewCell(
                            imageName: user.images.randomElement() ?? "",
                            percentageRemaining: Double.random(in: 0...1) ,
                            hasNewMessage: Bool.random(),
                            userName: user.firstName ?? "",
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                        )
                    }
                }            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BumbleChatsView()
}
