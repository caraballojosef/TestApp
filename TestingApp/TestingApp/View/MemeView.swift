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
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .padding(.horizontal)
            Divider()
            AsyncImage(url: URL(string: meme.iconURL)) { image in
                image.resizable()
            } placeholder: {
                Text("Image")
            }
        }
    }
}

struct MemeView_Previews: PreviewProvider {
    static var previews: some View {
        MemeView(meme: .init(categories: [""], createdAt: "", iconURL: "https://assets.chucknorris.host/img/avatar/chuck-norris.png", id: "", updatedAt: "", url: "", value: ""))
    }
}
