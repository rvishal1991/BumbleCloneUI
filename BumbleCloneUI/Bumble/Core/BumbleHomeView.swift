//
//  BumbleHomeView.swift
//  BumbleCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct BumbleHomeView: View {
    
    @Environment(\.router) var router

    
    var filters:[String] = ["Everyone","Trending"]
    @AppStorage("bumble_home_filter") private var selectedFilter:String = "Everyone"
    @State private var allUsers:[User] = []
    @State private var selectedIndex:Int = 0
    @State private var cardOffset:[Int:Bool] = [:] // [UserId] : (Direction is Right == TRUE)
    @State private var currentSwipeOffset:CGFloat = 0

    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 16){
                header
                
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
                                
                ZStack{
                    if !allUsers.isEmpty {
                        ForEach((Array(allUsers.enumerated())), id: \.offset){ (index, user) in
                            
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1) == index

                            if isPrevious || isCurrent  || isNext {
                                let offsetValue = cardOffset [user.id ?? 0]
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : (offsetValue == true ? 900 : -900))
                            }
                        }
                    }else{
                        ProgressView()
                    }
                    
                    overlaySwipingIndicators
                    .zIndex(9999999)
                }
                .frame(maxHeight: .infinity)
                .padding(4)
                .animation(.smooth, value: cardOffset)
                
            }
            .padding(8)
            
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
    
    private func userDidSelect(index:Int, isLike:Bool){
        
        let user = allUsers[index]
        cardOffset[user.id ?? 0] = isLike
        selectedIndex += 1
        
    }
    
    private var header: some View {
        HStack (spacing: 0){
            HStack (spacing: 0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()

                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    router.showScreen(.push) { _ in
                        BumbleChatsView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
    
    private func userProfileCell(user:User, index:Int) -> some View {
        BumbleCardView(
            user: user,
            onSuperLikePressed: nil,
            onXMarkPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onCheckMarkPressed: {
                userDidSelect(index: index, isLike: true)
            },
            onSendComplimentPressed: nil,
            onHideandReportPressed: nil
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 10,
            resets: true,
            rotationMultiplier: 1.05,
            //              scaleMultiplier: 0.8,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
            },
            onEnded: { dragOffset in
                if dragOffset.width < -50 {
                    userDidSelect(index: index, isLike: false)
                } else if dragOffset.width > 50 {
                    userDidSelect(index: index, isLike: true)
                }
            }
        )
    }
    
    
    private var overlaySwipingIndicators: some View {
        ZStack {
            Circle()
                .fill(.bumbleGrey.opacity(0.4))
                .overlay(
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: min(-currentSwipeOffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .fill(.bumbleGrey.opacity(0.4))
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: max(-currentSwipeOffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .animation(.smooth, value: currentSwipeOffset)
    }
}

#Preview {
    
    RouterView{ _ in
        BumbleHomeView()
    }
    
}
