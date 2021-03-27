//
//  ChapterButtonView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 28/02/21.
//

import SwiftUI

struct ChapterButtonView: View {
    @State private var showSheet = false
    @State private var foregroundColor = Color.gray
    let chapter: Int
    let abbr: Abbreviations
    let name: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(COLORS.BUTTON_BACKGROUND)
                .shadow(radius: 5)
            
            Text(chapter.toString())
                .foregroundColor(foregroundColor)
        }.frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .onTapGesture {
            self.foregroundColor = COLORS.BUTTON_CLICKED_TEXT
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                self.foregroundColor = .gray
                
                let bibleRepo = BibleRepo.instance
                bibleRepo.fetchVerses(of: abbr.pt, chapter: chapter)                
                showSheet = true
            }
        }.sheet(isPresented: $showSheet, content: {
            VersesView(ofBook: abbr.pt, chapter: chapter, name: name)
        })
    }
}

struct ChapterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterButtonView(chapter: 6, abbr: (en: "jn", pt: "jn"), name: "Jonas")
    }
}
