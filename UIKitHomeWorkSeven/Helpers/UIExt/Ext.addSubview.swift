//
//  Ext.addSubview.swift
//  UIKitHomeWorkSeven
//
//  Created by Масуд Гаджиев on 07.12.2024.
//

import UIKit

extension UIView {
    func addSubviews(views: UIView...) {
        views.forEach {
            self.addSubview($0)
            
        }
    }
    
}
