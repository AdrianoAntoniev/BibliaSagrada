//
//  SwiftUIView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 28/02/21.
//

import SwiftUI

struct BooksView: View {
    @StateObject var bibleRepo = BibleRepo.instance
    let testament: APP_INFO.Choice
    
    private let gridLayout = [GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible())]
    
    var body: some View {
        let books = bibleRepo.books[testament.choiceAbbr] ?? []

        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach(books) { book in
                        BookButtonView(book: book)
                            .padding()
                    }
                }
                .padding(20)
            }            
            .navigationBarTitle(testament.title)
            //.font(.custom("Times New Roman", size: 40))
        }        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView(testament: APP_INFO.CHOICES[0])
    }
}
