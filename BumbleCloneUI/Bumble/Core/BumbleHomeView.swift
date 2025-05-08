//
//  BumbleHomeView.swift
//  BumbleCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI

struct BumbleHomeView: View {
    
    var filters:[String] = ["Everyone","Trending"]
    @AppStorage("bumble_home_filter") private var selectedFilter:String = "Everyone"
    
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 16){
                header
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
                
                BumbleCardView()
                Spacer()
            }
            .padding(8)
            
        }
        
    }
    
    private var header: some View {
        HStack (spacing: 0){
            HStack (spacing: 0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
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
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
}

#Preview {
    BumbleHomeView()
}
