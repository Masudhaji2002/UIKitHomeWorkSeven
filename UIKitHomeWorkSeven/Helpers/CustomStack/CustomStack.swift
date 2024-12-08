//
//  CustomStack.swift
//  UIKitHomeWorkSeven
//
//  Created by Масуд Гаджиев on 08.12.2024.
//

import UIKit

class CustomStack: UIStackView {
    init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution){
        super.init(frame: .zero)
        self.axis = axis
        self.alignment = .center
        self.distribution = .fillEqually
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
