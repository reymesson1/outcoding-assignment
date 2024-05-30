//
//  ImageModel.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import Foundation

struct CatImage: Identifiable, Decodable {
    let id: String
    let tags: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case tags
    }
    
    var imageUrl: URL {
        URL(string: "https://cataas.com/cat/\(id)")!
    }
}
