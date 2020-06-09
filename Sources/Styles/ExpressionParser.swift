//
//  ExpressionParser.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

enum ColorFormat: String, CaseIterable {
    
    case color = "color:"
    case sharp = "#"
}

struct ExpressionParser {
    
    enum ParserError: Error {
        case undefinedValueType(value: Any)
        case undefinedStringAction(value: String)
    }
}

extension ExpressionParser {
    
    static func parse(value: Any) throws -> StyleAction {
        
        let action: StyleAction
        
        if let str = value as? String {
            action = try _string(value: str)
        } else if let int = value as? Int {
            action = _int(value: int)
        } else if let double = value as? Double {
            action = _double(value: double)
        } else if let bool = value as? Bool {
            action = _bool(value: bool)
        } else {
            throw ParserError.undefinedValueType(value: value)
        }
        
        return action
    }
}

extension ExpressionParser {
    
    static func _string(value: String) throws -> StyleAction {
        
        let action: StyleAction
        
        if let color = value.ifc.colorString() {
            action = AssignAction(value: UIColor.ifc.fromHexString(hex: color))
        } else {
            throw ParserError.undefinedStringAction(value: value)
        }
        
        return action
    }
}

extension ExpressionParser {
    
    static func _int(value: Int) -> StyleAction { AssignAction(value: value) }
}

extension ExpressionParser {
    
    static func _double(value: Double) -> StyleAction { AssignAction(value: value) }
}

extension ExpressionParser {
    
    static func _bool(value: Bool) -> StyleAction { AssignAction(value: value) }
}
