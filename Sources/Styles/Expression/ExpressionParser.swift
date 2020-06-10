//
//  ExpressionParser.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

struct ExpressionParser {
    
    enum ParserError: Error {
        case undefinedValueType(value: Any)
        case undefinedStringAction(value: String)
    }
}

extension ExpressionParser {
    
    static func parse(value: Any) throws -> Expression {
        
        let e: Expression
        
        if let str = value as? String {
            e = Expression(raw: str)
        } else if let int = value as? Int {
            e = Expression(raw: int)
        } else if let double = value as? Double {
            e = Expression(raw: double)
        } else if let bool = value as? Bool {
            e = Expression(raw: bool)
        } else {
            throw ParserError.undefinedValueType(value: value)
        }
        
        return e
    }
}
