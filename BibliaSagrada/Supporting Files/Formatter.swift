//
//  Formatter.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 25/03/21.
//

import Foundation

struct Formatter {
    private init() {}
    
    static func createVersesKey(withBookAbbr bookAbbr: String, andChapter chapter: Int) -> String {
        return "\(bookAbbr) \(chapter)"
    }
    
    static func formatDate(_ aDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d/MMM/y, HH:mm"
        formatter.locale = Locale(identifier: "pt_BR")
        
        return formatter.string(from: aDate)
    }
    
    static func makeIdForSaving(bookName: String, chapter: String, chapterVerse: String) -> String {
        return "\(bookName.uppercased())\(chapter)\(chapterVerse)"
    }
}
