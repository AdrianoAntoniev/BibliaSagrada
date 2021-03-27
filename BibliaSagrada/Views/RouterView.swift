//
//  RouterView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 28/02/21.
//

import SwiftUI

struct RouterView: View {
    let choice: APP_INFO.Choice
    
    var body: some View { 
        if choice.choiceAbbr == BIBLE_INFO.NEW_TESTAMENT_ABBR ||
            choice.choiceAbbr == BIBLE_INFO.OLD_TESTAMENT_ABBR {
            BooksView(testament: choice)
        } else if choice.choiceAbbr == APP_INFO.WORD_OF_THE_DAY_ABBR {
            VerseOfTheDayView()
        } else {
            SavedVersesView()
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView(choice: APP_INFO.CHOICES[0])
    }
}
