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
    private var ids: [String] = []
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
                        
                        if !self.memes.contains(where: { m in
                            m.id == response.id
                        }) {
                            self.memes.append(response)
                            self.ids.append(response.id)
                            print(self.ids)
                        }
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
