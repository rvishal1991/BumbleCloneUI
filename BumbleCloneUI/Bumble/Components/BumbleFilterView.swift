//
//  BumbleFilterView.swift
//  BumbleCloneUI
//
//  Created by apple on 08/05/25.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options:[String] = ["Everyone","Tredning"]
    @Binding var selection:String
    @Namespace private var namespace
    

    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self){ option in
                VStack{
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                  
                }
                .padding(.top, 8)
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGrey)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreview:View {
    
    var options:[String] = ["Everyone","Tredning"]
    @State private var selection:String = "Everyone"
    
    var body: some View {
        BumbleFilterView(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding()
}
