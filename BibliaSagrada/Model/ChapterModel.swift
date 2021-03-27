//
//  ChapterModel.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 08/03/21.
//

import Foundation

struct ChapterData: Decodable {
    let verses: [Verses]
    
    struct Verses: Decodable {
        let number: Int
        let text: String
        
        enum CodingKeys: String, CodingKey {
            case number
            case text
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case verses
    }
}


