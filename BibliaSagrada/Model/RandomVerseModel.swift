//
//  RandomVerseModel.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 09/03/21.
//

import Foundation

struct RandomVerseData: Decodable {
    let verses: [VerseData]
        
    enum CodingKeys: String, CodingKey {
        case verses
    }
    
    struct VerseData: Decodable {
        let book: Book
        let chapter: Int
        let verse: Int
        let text: String
        
        struct Book: Decodable {
            let name: String
            
            enum CodingKeys: String, CodingKey {
                case name
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case book
            case chapter
            case verse = "number"
            case text
        }
    }
}


struct RandomVersePostParameters: Encodable {
    let version: String
    let search: String
}

struct VerseOfTheDay: Identifiable {
    let id: String
    let verse: String    
    let footer: String
}
