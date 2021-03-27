//
//  BookModel.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 26/02/21.
//

import Foundation


// MARK: - BookData: Used to fetch data from JSON
struct BookData: Codable {
    let abbrev: Abbrev
    let chapters: Int
    let name: String
    let testament: String
    
    struct Abbrev: Codable {
        let pt: String
        let en: String
        
        enum CodingKeys: String, CodingKey {
            case pt
            case en
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case abbrev
        case chapters
        case name
        case testament
    }
}

struct Book: Identifiable {
    var id = UUID()
    let abbreviationPT: String
    let abbreviationEN: String
    let numberOfChapters: Int
    let name: String
    let testament: String    
    
    init(from data: BookData) {
        self.abbreviationPT = data.abbrev.pt
        self.abbreviationEN = data.abbrev.en
        self.numberOfChapters = data.chapters
        self.name = data.name
        self.testament = data.testament        
    }
}

