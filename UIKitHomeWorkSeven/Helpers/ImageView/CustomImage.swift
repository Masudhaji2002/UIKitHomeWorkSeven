//
//  CustomImage.swift
//  UIKitHomeWorkSeven
//
//  Created by Масуд Гаджиев on 07.12.2024.
//

import UIKit

class CustomImage: UIImageView {
    init(cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.image = nil
         self.layer.cornerRadius = cornerRadius
         self.clipsToBounds = true
         self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
