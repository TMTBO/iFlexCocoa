//
//  String+Extension.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

extension String: Compatible {}

extension StringProtocol {
    
    subscript(bounds: CountableClosedRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
    
    subscript(bounds: CountableRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
}

extension Extension where Base == String {
    
    func colorString() -> String? {
        
        let format = ColorFormat.allCases.first { base.hasPrefix($0.rawValue) }
        guard let prefix = format?.rawValue else { return nil }
        return String(base.dropFirst(prefix.count))
    }
}
