//
//  BibliaSagradaTests.swift
//  BibliaSagradaTests
//
//  Created by Adriano Rodrigues Vieira on 26/02/21.
//

import XCTest
@testable import BibliaSagrada

class BibliaSagradaTests: XCTestCase {
    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }

    func testAllBooksFetch() throws {
        if let bibleRepo = BibleRepo.instance {
            if let oldTestament = bibleRepo.books[BIBLE_INFO.NEW_TESTAMENT_ABBR],
               let newTestament = bibleRepo.books[BIBLE_INFO.OLD_TESTAMENT_ABBR] {
                                
                XCTAssertTrue(newTestament.count == BIBLE_INFO.NEW_TESTAMENT_CHAPTERS_NUMBER)
                XCTAssertTrue(oldTestament.count == BIBLE_INFO.OLD_TESTAMENT_CHAPTERS_NUMBER)
            }
            
        }
    }
    
    func testBookFetchByNameAndChapter() {
        if let bibleRepo = BibleRepo.instance {
            let jamesBookVerses = bibleRepo.getVerses(of: "jn", chapter: 2)
            XCTAssertTrue(jamesBookVerses[0] == "E orou Jonas ao SENHOR, seu Deus, das entranhas do peixe.")
        }
    }

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }
}
