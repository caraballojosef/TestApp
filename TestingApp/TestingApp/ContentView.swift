//
//  ContentView.swift
//  TestingApp
//
//  Created by Jose Caraballo on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    
    @StateObject private var vm = ViewModel(service: ServiceImplementation())
    
    //MARK: - Body
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            List {
                ForEach(vm.memes, id: \.id) { item in
                    MemeView(meme: item)
                }.listRowSeparator(.hidden)
            }
            Button {
                vm.getMeme()
            } label: {
                Text("Reload")
            }
        }
        .padding()
        .onAppear {
            for _ in 0...15 {
                vm.getMeme()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
