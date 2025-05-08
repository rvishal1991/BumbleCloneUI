//
//  ImageLoaderView.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString:String = Constants.randomImage
    var reszingMode:ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: reszingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
       // .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
