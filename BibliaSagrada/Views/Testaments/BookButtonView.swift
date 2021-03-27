//
//  ButtonView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 27/02/21.
//

import SwiftUI

struct BookButtonView: View {
    @State private var showSheet = false
    @State private var foregroundColor = Color.gray
    let book: Book
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(COLORS.BUTTON_BACKGROUND)
                .shadow(radius: 5)
            
            Text(book.abbreviationPT.uppercased())
                .font(.custom("Times New Roman", size: 20))
                .foregroundColor(foregroundColor)
        }.frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
         .onTapGesture {
            self.foregroundColor = COLORS.BUTTON_CLICKED_TEXT
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                self.foregroundColor = .gray
                self.showSheet = true
            }
         }
        .sheet(isPresented: $showSheet) {
            ChaptersView(totalChapters: book.numberOfChapters, name: book.name, abbr: (en: book.abbreviationEN, pt: book.abbreviationPT))
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BookButtonView(book: Book(from: BookData(abbrev: BookData.Abbrev(pt: "ts", en: "ts"), chapters: 10, name: "Test", testament: "VT")))
    }
}
