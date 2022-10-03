//
//  ViewModel.swift
//  TestingApp
//
//  Created by Jose Caraballo on 3/10/22.
//

import Foundation
import SwiftUI
import Combine


class ViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var memes = [Meme]()
    @Published var isLoading: Bool = false
    
    private let service: Service
    private var cancellables = Set<AnyCancellable>()
    
    init(service: Service) {
        self.service = service
    }

    //MARK: - Functions

    func getMeme() {
        // isRefreshing = true
        //self.state = .loading
        isLoading = true
     
        let cancellable = service
            .requestNew(from: .getMemes, type: Meme.self)
            .sink { res in
                switch res {

                case .finished:
                    //self.state = .success(content: self.users)
                    self.isLoading = false
                case .failure(let error):
                    //self.state = .failed(error: error)
                    print(error)
                }
            } receiveValue: { response in
                //self.checkMeme(meme: response)
               
                if self.memes.count < 15 {
                    self.memes.append(response)
//                    ForEach(memes, id: \.self) { m in
//
//                    }
//                    for item in self.memes {
//                        if item.id != response.id {
//                            
//                        }
//                    }
                }
                print(response)
                //self.users = response
                //print(response)
            }
        self.cancellables.insert(cancellable)
       // isRefreshing = false

    }
    
    func checkMeme(meme: Meme) {
        
       
        
    }
    
}
