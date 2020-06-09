//
//  UIColor+Extension.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

extension UIColor: Compatible {}

extension Extension where Base == UIColor {
    
    static func fromHexString(hex: String) -> UIColor {
        
        let str = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        guard str.count >= 6 else { return .clear }
        
        var rgb: Int = 0
        if str.count >= 6 {
            rgb = Int(String(str.prefix(6)), radix: 16) ?? 0
        }
        let r: CGFloat = CGFloat(rgb >> 16)
        let g: CGFloat = CGFloat((rgb >> 8) & 0xff)
        let b: CGFloat = CGFloat(rgb & 0xff)
        
        var a: CGFloat = 255.0
        if hex.count >= 8 {
            a = CGFloat(Int(String(str.suffix(2)), radix: 16) ?? 0)
        }
        
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/255.0)
    }
}
