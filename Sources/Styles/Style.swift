//
//  Style.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

// MARK: Expression support value type
protocol ExpressionTypable {}
protocol RawTypable: ExpressionTypable {}
protocol ImmediateRawTypable: RawTypable {}
protocol ResultTypable: ExpressionTypable {}

extension String: RawTypable {}
extension Int: ImmediateRawTypable {}
extension Double: ImmediateRawTypable {}
extension Bool: ImmediateRawTypable {}

extension String: ResultTypable {}
extension Int: ResultTypable {}
extension Double: ResultTypable {}
extension Bool: ResultTypable {}
extension UIColor: ResultTypable {}


enum TempleteType: String {
    
    case base
}

protocol Templetable {
    
    var type: TempleteType { get }
}

extension Extension: Templetable {
    
    var type: TempleteType {
        fatalError("\(base.self) does not support Templete.")
    }
}
