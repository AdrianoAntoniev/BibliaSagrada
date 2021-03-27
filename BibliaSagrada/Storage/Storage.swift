//
//  Storage.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 23/03/21.
//

import RealmSwift
import Foundation
import SwiftUI

/// Class for persistance
class PersistedVerse: Object {
    @objc dynamic var verse: String = ""
    @objc dynamic var footer: String = ""
    @objc dynamic var id: String = ""
    
}

class Storage: ObservableObject {
    static let instance = Storage()
    @Published var verses: [Verse] = []
    
    private init() {
        self.verses = fetchSavedVerses()        
    }
    
    private let realm = { () -> Realm in
        var config = Realm.Configuration()
        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("bible.realm")
        let r = try! Realm(configuration: config)
        return r
    }()
    
    
    func delete(_ verse: Verse) {
        try! realm.write {
            realm.delete(realm.objects(PersistedVerse.self).filter("id == %@", verse.id))
            self.verses = fetchSavedVerses()
        }
    }
    
    func persist(verse: Verse) -> Bool {
        let verseToPersist = PersistedVerse()
        verseToPersist.verse = verse.verse
        verseToPersist.footer = verse.footer
        verseToPersist.id = verse.id                        
        
        let result = realm.objects(PersistedVerse.self).filter("id == %@", verseToPersist.id)                
        
        if result.count == 0 {
            try! realm.write {
                realm.add(verseToPersist)
                self.verses = fetchSavedVerses()
            }
            return true
        }        
        return false
    }
    
    private func fetchSavedVerses() -> [Verse] {
        let result = realm.objects(PersistedVerse.self)
        
        var verses: [Verse] = []
        for persistedVerse in result {            
            verses.append(Verse(verse: persistedVerse.verse,
                                footer: persistedVerse.footer,
                                id: persistedVerse.id))
        }
                
        return verses.reversed()
    }
}
