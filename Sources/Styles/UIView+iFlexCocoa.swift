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
    
    func style(_ style: [String: Any]) -> Base {
        
        style.forEach { StyleWorker.init(key: $0.key, value: $0.value).work(on: base) }
        return base
    }
    
    func map(style: [String: Any]) -> [String: Any] {
        
        let labelsMap = ResourceLoader.shared.flexboxLabels(for: type)
        var newStyle: [String: Any] = [:]
        style.forEach {
            if let newKey = labelsMap[$0.key] {
                newStyle[newKey] = $0.value
            }
        }
        return newStyle
    }
    
}
 
