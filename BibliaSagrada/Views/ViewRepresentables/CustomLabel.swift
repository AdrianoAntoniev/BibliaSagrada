//
//  Label.swift
//  BibliaSagrada
//
//  Created by Adriano Rodrigues Vieira on 08/03/21.
//

import Foundation
import SwiftUI

struct CustomLabel: UIViewRepresentable {
    var width: CGFloat    
    var text: String
    var needsDropCap: Bool
    
    init(width: CGFloat, text: String, needsDropCap: Bool) {
        self.width = width
        self.text = text
        self.needsDropCap = needsDropCap
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = width - 20
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Times New Roman", size: 20)
        label.textColor = .gray
                    
        if needsDropCap {
            let textWithoutIndexNumber = "\(text.suffix(text.count - 4))"
            label.attributedText = textWithoutIndexNumber.withDropCap(sized: 45)
        } else {
            label.text = text
        }
        
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) { }
}


extension String {
    func withDropCap(sized size: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self, attributes: [.font: UIFont(name: "Times New Roman", size: 20)!])
        let range = NSRange(location: 0, length: 1)
        attributedString.addAttributes([.font: UIFont(name: "Times New Roman", size: size)!], range: range)
        
        return attributedString.copy() as! NSAttributedString
    }
}

