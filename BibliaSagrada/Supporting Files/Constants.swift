//
//  Constants.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 26/02/21.
//

import Foundation
import SwiftUI
import Alamofire

struct URLS {
    static let ALL_BOOKS = "https://www.abibliadigital.com.br/api/books"
    static let RANDOM = "https://www.abibliadigital.com.br/api/verses/\(BIBLE_INFO.VERSION)/random"
    static let VERSES = "https://www.abibliadigital.com.br/api/verses/\(BIBLE_INFO.VERSION)/"
    static let SEARCH = "https://www.abibliadigital.com.br/api/verses/search"
        
    static let TOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IlR1ZSBNYXIgMDkgMjAyMSAxOToxNTozNiBHTVQrMDAwMC5hZHJpYW5vLmFudG9uaWV2QG91dGxvb2suY29tIiwiaWF0IjoxNjE1MzE3MzM2fQ.KC7uSFJuREPIcls0etB2IxMZW1EiXicfjotkWX7_fWY"

}

struct PARAMETERS {
    static let RANDOM_VERSE = RandomVersePostParameters(version: BIBLE_INFO.VERSION, search: "amor")
    static let HEADERS: HTTPHeaders = [.contentType("application/json"),
                                       .authorization(bearerToken: URLS.TOKEN)]
}

struct BIBLE_INFO {
    static let OLD_TESTAMENT_CHAPTERS_NUMBER = 39
    static let NEW_TESTAMENT_CHAPTERS_NUMBER = 27
    
    static let OLD_TESTAMENT_ABBR = "VT"
    static let NEW_TESTAMENT_ABBR = "NT"
    
    static let VERSION = "acf"
    
    static let VERSES_FOR_TESTING = ["E orou Jonas ao SENHOR, seu Deus, das entranhas do peixe.",
                                     "E disse: Na minha angústia clamei ao Senhor, e ele me respondeu; do ventre do inferno gritei, e tu ouviste a minha voz.",
                                     "Porque tu me lançaste no profundo, no coração dos mares, e a corrente das águas me cercou; todas as tuas ondas e as tuas vagas têm passado por cima de mim.",
                                     "E eu disse: Lançado estou de diante dos teus olhos; todavia tornarei a ver o teu santo templo."]
    static let JAMES_BOOK_NAME_FOR_TESTING = "Tiago"
    static let LOADING = ["Carregando..."]
}


struct COLORS {
    static let BUTTON_BACKGROUND = Color(red: 40, green: 188, blue: 218)
    static let BUTTON_CLICKED_TEXT = Color(red: 255.0 / 255.0, green: 255.0 / 223, blue: 255.0 / 0.0, opacity: 1)
}

struct APP_INFO {
    static let WORD_OF_THE_DAY_ABBR = "PD"
    static let SETTINGS_ABBR = "CF"
    static let OLD_TESTAMENT_TITLE = "Antigo Testamento"
    static let NEW_TESTAMENT_TITLE = "Novo Testamento"
    static let WORD_OF_DAY_TITLE = "Palavra do dia"
    static let WORDS_SAVED_TITLE = "Meus versos salvos"
    
    static let CHOICES: [Choice] = [
        Choice(title: OLD_TESTAMENT_TITLE, imageName: "book.closed", choiceAbbr: BIBLE_INFO.OLD_TESTAMENT_ABBR),
        Choice(title: NEW_TESTAMENT_TITLE, imageName: "book.closed", choiceAbbr: BIBLE_INFO.NEW_TESTAMENT_ABBR),
        Choice(title: WORD_OF_DAY_TITLE, imageName: "book", choiceAbbr: APP_INFO.WORD_OF_THE_DAY_ABBR),
        Choice(title: WORDS_SAVED_TITLE, imageName: "heart.text.square", choiceAbbr: APP_INFO.WORDS_SAVED_TITLE)
    ]
        
    struct Choice: Identifiable {
        var id = UUID()        
        let title: String
        let imageName: String
        let choiceAbbr: String
    }

}
