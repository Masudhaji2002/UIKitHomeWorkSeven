//
//  CustomLabel.swift
//  UIKitHomeWorkSeven
//
//  Created by Масуд Гаджиев on 07.12.2024.
//

import UIKit

class CustomLabel: UILabel {
    
    init(font: UIFont = .boldSystemFont(ofSize: 20), textColor: UIColor = .white, alignment: NSTextAlignment = .left) {
         super.init(frame: .zero)
         self.translatesAutoresizingMaskIntoConstraints = false
         self.textAlignment = alignment
         self.font = font
         self.textColor = textColor
         self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
