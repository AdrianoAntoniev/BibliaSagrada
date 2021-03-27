//
//  SettingsView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 28/02/21.
//

import SwiftUI

struct SavedVersesView: View {
    @ObservedObject var storage = Storage.instance
    @State private var showAlert = false
        
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {                    
                    ForEach(storage.verses, id: \.self) { verse in
                        SavedVerseCellView(verse: verse)
                    }
                    .padding(10)
                }
                .navigationBarTitle(APP_INFO.WORDS_SAVED_TITLE)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedVersesView()
    }
}
