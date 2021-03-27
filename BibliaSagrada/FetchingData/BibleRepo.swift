//
//  FetchData.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 26/02/21.
//

import Foundation
import Alamofire

class BibleRepo: ObservableObject {
    @Published var books: [String: [Book]] = [:]
    @Published var fetchedChapters: [String: [String]] = [:]    
    @Published var verseOfTheDay: VerseOfTheDay?        
    static let instance: BibleRepo = BibleRepo()
    
    private init() {
        self.initializeBibleRepo()
        self.fetchVerseOfTheDay() { verse in
            self.verseOfTheDay = verse
        }
        
        let request = AF.request(URLS.ALL_BOOKS,
                                 headers: PARAMETERS.HEADERS)
        
        request.responseDecodable(of: [BookData].self) { data in
            if let bibleData = data.value {                                
                DispatchQueue.main.async {
                    var oldTestament: [Book] = []
                    var newTestament: [Book] = []
                    
                    for bookData in bibleData {
                        let book = Book(from: bookData)
                                                
                        if book.testament == BIBLE_INFO.OLD_TESTAMENT_ABBR {
                            oldTestament.append(book)
                        } else {
                            newTestament.append(book)
                        }
                    }
                    
                    self.books[BIBLE_INFO.OLD_TESTAMENT_ABBR] = oldTestament
                    self.books[BIBLE_INFO.NEW_TESTAMENT_ABBR] = newTestament                    
                }
            }
        }
    }
    
    private func initializeBibleRepo() {
        books = [:]
        fetchedChapters = [:]
        books[BIBLE_INFO.OLD_TESTAMENT_ABBR] = []
        books[BIBLE_INFO.NEW_TESTAMENT_ABBR] = []
    }
    
    func fetchVerses(of bookAbbr: String, chapter: Int) {
        let bookAbbrAndChapter = Formatter.createVersesKey(withBookAbbr: bookAbbr, andChapter: chapter)
        
        if fetchedChapters[bookAbbrAndChapter] == nil {
            let urlWithParams = "\(URLS.VERSES)\(bookAbbr)/\(chapter)"
            let request = AF.request(urlWithParams,
                                     headers: PARAMETERS.HEADERS)
            
            request.responseDecodable(of: ChapterData.self) { response in
                if let data = response.value {
                    DispatchQueue.main.async {
                        var verses: [String] = []
                        
                        for verse in data.verses {
                            verses.append("\(verse.number) - \(verse.text)")
                        }
                        
                        self.fetchedChapters[bookAbbrAndChapter] = verses
                    }
                }
            }
            
        }
    }
    private func fetchVerseOfTheDay(completion: @escaping (VerseOfTheDay) -> ()) {
        let request = AF.request(URLS.SEARCH,
                                 method: .post,
                                 parameters: PARAMETERS.RANDOM_VERSE,
                                 encoder: JSONParameterEncoder.default,
                                 headers: PARAMETERS.HEADERS)
        
        request.responseDecodable(of: RandomVerseData.self) { response in
            if let data = response.value {
                var tempVerses: [VerseOfTheDay] = []
                DispatchQueue.main.async {
                    for verse in data.verses {
                        let verse = VerseOfTheDay(id: Formatter.makeIdForSaving(bookName: verse.book.name,
                                                                                chapter:  "\(verse.chapter)",
                                                                                chapterVerse: "\(verse.verse)"),
                                                  verse: verse.text,
                                                  footer: "\(verse.book.name) \(verse.chapter):\(verse.verse)")
                                                                                                             
                        tempVerses.append(verse)
                    }
                    completion(tempVerses.randomElement()!)
                }
            }
        }
    }    
}
