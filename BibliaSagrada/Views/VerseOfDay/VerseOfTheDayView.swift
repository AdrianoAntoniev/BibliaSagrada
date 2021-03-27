//
//  WordOfDayView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 28/02/21.
//

import SwiftUI

struct VerseOfTheDayView: View {    
    @ObservedObject var bibleRepo = BibleRepo.instance
    @State private var showAlert = false    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text(bibleRepo.verseOfTheDay?.verse ?? "Aguarde ...")
                    .font(.custom("Times New Roman", size: 35))
                    .foregroundColor(.gray)
                Text(bibleRepo.verseOfTheDay?.footer ?? " ")
                    .font(.custom("Times New Roman", size: 15))
                    .foregroundColor(.gray)
            }
            .padding()
            .onTapGesture {
                if let _ = bibleRepo.verseOfTheDay {
                    self.showAlert = true
                }
            }
            .navigationBarTitle(APP_INFO.WORD_OF_DAY_TITLE)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Salvar versículo"),
                  message: Text("Deseja salvar este versículo?"),
                  primaryButton: .default(Text("Quero salvar!"),
                                          action: {
                                            self.save()
                                          }
                  ),
                  secondaryButton: .cancel(Text("Talvez depois")))
        }
    }
    
    private func save() {
        if let verse = bibleRepo.verseOfTheDay {
            let storage = Storage.instance
            let footer = "\n\(verse.footer) \nSalvo em \(Formatter.formatDate(Date()))"
            
            let verseToSave = Verse(verse: verse.verse, footer: footer, id: verse.id)
            
            _ = storage.persist(verse: verseToSave)
        }
    }
}

struct WordOfDayView_Previews: PreviewProvider {
    static var previews: some View {
        VerseOfTheDayView()
    }
}
