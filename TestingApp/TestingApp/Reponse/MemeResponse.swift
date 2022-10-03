//
//  MemeResponse.swift
//  TestingApp
//
//  Created by Jose Caraballo on 3/10/22.
//

import Foundation

    //MARK: - Meme model

struct Meme: Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id, updatedAt: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}
