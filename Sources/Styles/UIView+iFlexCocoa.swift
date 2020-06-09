//
//  UIView+iFlexCocoa.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import UIKit

extension UIView: Compatible {}

extension Extension where Base == UIView {
    
    var type: TempleteType { .base }
    
    func style(_ flex: [String: Any]) -> Base {
        
        return base
    }
    
    func map(style: [String: Any]) -> [String: Any] {
        
        let labelsMap = ResourceLoader.shared.flexboxLabels(for: type)
        var newStyle: [String: Any] = [:]
        style.forEach {
            if let newKey = labelsMap[$0.0] {
                newStyle[newKey] = $0.1
            }
        }
        return newStyle
    }
    
}
 
