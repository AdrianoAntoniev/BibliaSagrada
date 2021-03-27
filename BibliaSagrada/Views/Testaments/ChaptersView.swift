//
//  ChaptersView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 28/02/21.
//

import SwiftUI

typealias Abbreviations = (en: String, pt: String)
struct ChaptersView: View {
    let totalChapters: Int
    let name: String
    let abbr: Abbreviations
    
    private let gridLayout = [GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach(0..<totalChapters) { chapter in
                        ChapterButtonView(chapter: chapter + 1, abbr: abbr, name: name)
                    }
                }.padding(20)
            }
            
            .navigationBarTitle(name.capitalized)
        }
    }
}

struct ChaptersView_Previews: PreviewProvider {
    static var previews: some View {
        ChaptersView(totalChapters: 4, name: "jonas", abbr: (en: "jn", pt: "jn"))
    }
}
