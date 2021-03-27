//
//  CustomSavedVerseLabel.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 24/03/21.
//
import Foundation
import SwiftUI

struct CustomSavedVerseLabel: UIViewRepresentable {
    let width: CGFloat!
    let verse: Verse!
    
    init(width: CGFloat, verse: Verse) {
        self.width = width
        self.verse = verse
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = width - 20
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Times New Roman", size: 20)
        label.textColor = .gray
        
        let combination = NSMutableAttributedString()
        
        combination.append(verse.verse.withDropCap(sized: 30))
        combination.append(NSAttributedString(string: "\n"))
        combination.append(verse.footer.transformInFooter(sized: 15))
                                    
        label.attributedText = combination                 
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) { }
}



