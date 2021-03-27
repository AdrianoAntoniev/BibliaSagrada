//
//  CustomWordOfTheDayLabel.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 23/03/21.
//

import Foundation
import SwiftUI

struct CustomVerseOfTheDayLabel: UIViewRepresentable {
    let width: CGFloat!
    let verseOfTheDay: VerseOfTheDay
    
    init(width: CGFloat, verseOfTheDay: VerseOfTheDay) {
        self.width = width
        self.verseOfTheDay = verseOfTheDay
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
        combination.append(verseOfTheDay.verse.withDropCap(sized: 40))
        combination.append(NSAttributedString(string: "\n\n"))
        combination.append(verseOfTheDay.footer.transformInFooter(sized: 15))
                                    
        label.attributedText = combination
                 
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) { }
}

extension String {
    func transformInFooter(sized size: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self, attributes: [.font: UIFont(name: "Times New Roman", size: 1)!])
        let range = NSRange(location: 0, length: self.count)
        attributedString.addAttributes([.font: UIFont(name: "Times New Roman", size: size)!], range: range)
        
        return attributedString.copy() as! NSAttributedString
    }
}


