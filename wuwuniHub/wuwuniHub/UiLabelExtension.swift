//
//  UiLabelExtension.swift
//  wuwuniHub
//
//  Created by Tamuna Kakhidze on 15.04.24.
//

import UIKit

extension UILabel {
    func setLineHeight(_ totalLineHeight: CGFloat) {
        let lineSpacing = totalLineHeight - self.font.lineHeight
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        self.attributedText = attributedString
    }
}
