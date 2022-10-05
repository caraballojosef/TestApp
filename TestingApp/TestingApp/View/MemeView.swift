//
//  MemeView.swift
//  TestingApp
//
//  Created by Jose Caraballo on 3/10/22.
//

import SwiftUI

struct MemeView: View {
    
    let meme: Meme
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text("Meme: \(meme.value)")
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.vertical, 10)
            Divider()
            AsyncImage(url: URL(string: meme.iconURL)) { image in
                image.resizable()
            } placeholder: {
                Text("Image")
            }
            .padding(.bottom, 15)
        }
        .background(Color.cyan.opacity(0.3))
        .cornerRadius(10)
        .padding()
        
    }
}

struct MemeView_Previews: PreviewProvider {
    static var previews: some View {
        MemeView(meme: .init(categories: [""], createdAt: "", iconURL: "https://assets.chucknorris.host/img/avatar/chuck-norris.png", id: "", updatedAt: "", url: "", value: ""))
    }
}
