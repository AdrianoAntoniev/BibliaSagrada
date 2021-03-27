//
//  ContentView.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 26/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {                        
        TabView {                        
            ForEach(APP_INFO.CHOICES) { choice in
                RouterView(choice: choice)
                    .tabItem {
                        Label(choice.title, systemImage: choice.imageName)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

