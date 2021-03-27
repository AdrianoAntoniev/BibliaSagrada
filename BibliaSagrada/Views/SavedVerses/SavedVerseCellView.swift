//
//  SavedVerseCellView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 24/03/21.
//

import SwiftUI

struct SavedVerseCellView: View {
    @State private var showAlert = false
    let verse: Verse
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(COLORS.BUTTON_BACKGROUND)
                .shadow(radius: 5)
            
            CustomSavedVerseLabel(width: 400, verse: verse)
                .padding(10)
        }
        .padding(10)
        .onTapGesture {
            self.showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Atenção!!!!"),
                  message: Text("Deseja realmente apagar este versículo?"),
                  primaryButton: .default(Text("Quero apagar!"),
                                          action: {
                                            deleteVerse()
                                          }
                  ),
                  secondaryButton: .cancel(Text("Prefiro manter")))
        }        
    }
    
    func deleteVerse() {
//        let verseToDelete = self.verses[indexSet.first!]
//        self.verses.remove(atOffsets: indexSet)
//
        let storage = Storage.instance
        storage.delete(self.verse)
    }
}

struct SavedVerseCellView_Previews: PreviewProvider {
    static var previews: some View {
        SavedVerseCellView(verse: Verse(verse: "Então foram chamados os escrivães do rei, naquele mesmo tempo, no terceiro mês (que é o mês de Sivã), aos vinte e três dias; e se escreveu conforme a tudo quanto ordenou Mardoqueu aos judeus, como também aos Sátrapas, e aos governadores, e aos líderes das províncias, que se estendem da Índia até Etiópia, cento e vinte e sete províncias, a cada província segundo o seu modo de escrever, e a cada povo conforme a sua língua; como também aos judeus segundo o seu modo de escrever, e conforme a sua língua.", footer: "Ester 8:9", id: "0"))
    }
}
