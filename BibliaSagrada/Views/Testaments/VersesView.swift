//
//  VersesView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 08/03/21.
//

import SwiftUI

struct VersesView: View {
    let bookAbbr: String
    let chapter: Int
    let name: String
    let bookAndChapter: String
    
    @State private var showAlert = false
    @State private var wantsToSaveVerse = false
    @State private var currentVerse: String?
    @StateObject var bibleRepo = BibleRepo.instance
    
    init(ofBook bookAbbr: String, chapter: Int, name: String) {
        self.bookAbbr = bookAbbr
        self.chapter = chapter
        self.name = name
        self.bookAndChapter = Formatter.createVersesKey(withBookAbbr: bookAbbr, andChapter: chapter)
    }
    
        
    var body: some View {
        VStack {
            HStack {
                Text(name.capitalized)                
                Text(chapter.toString())
            }
            .padding()
            .font(.title)
            
            GeometryReader { geometry in
                ScrollView {                    
                    LazyVStack {
                        ForEach(bibleRepo.fetchedChapters[bookAndChapter] ?? BIBLE_INFO.LOADING, id: \.self) { verse in
                            CustomLabel(width: geometry.size.width - 20, text: verse, needsDropCap: bibleRepo.fetchedChapters[self.bookAndChapter]?.firstIndex(of: verse) == 0)
                                .lineLimit(nil)                                
                                .frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxHeight: .infinity, alignment: .center)                                
                                .padding()
                                .onTapGesture {
                                    showAlert = true
                                    self.currentVerse = verse
                                }
                        }
                    }
                }                
            }
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Salvar versículo"),
                  message: Text("Deseja salvar este versículo?"),
                  primaryButton: .default(Text("Quero salvar!"),
                                          action: {
                                            saveVerse()
                                          }
                                    ),
                  secondaryButton: .cancel(Text("Talvez depois")))
        }
    }
    
    private func saveVerse() {
        let chapterVerse = self.currentVerse!.prefix(2).trimmingCharacters(in: .whitespaces)
        let bookName = name.capitalized
        let chapter = "\(self.chapter)"
        let date = Formatter.formatDate(Date())
        let id = Formatter.makeIdForSaving(bookName: bookName, chapter: chapter, chapterVerse: chapterVerse)        
        
        let footer = "\n\(bookName) \(chapter):\(chapterVerse) \nSalvo em \(date)"
        
        let mainVerse = self.currentVerse!.suffix(self.currentVerse!.count - 4).trimmingCharacters(in: .whitespaces)
        let verseToSave = Verse(verse: "\(mainVerse)", footer: footer, id: id)
        let storage = Storage.instance
        
        _ = storage.persist(verse: verseToSave)        
    }
}

struct VersesView_Previews: PreviewProvider {
    static var previews: some View {
        VersesView(ofBook: "jn", chapter: 2, name: "Jonas")
    }
}
