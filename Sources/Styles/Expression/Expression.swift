//
//  Expression.swift
//  iFlexCocoa
//
//  Created by Thriller on 6/10/20.
//

import Foundation

enum ColorScheme: String, CaseIterable {
    
    case color = "color:"
    case sharp = "#"
}

enum ScriptScheme: String, CaseIterable {
    
    case javascript = "js:"
    case native = "native:"
}

enum ExpressionVariety {
    
    case none
    case color(hex: String)
    case script(scheme: ScriptScheme, script: String)
    
    static func from(raw: String) -> ExpressionVariety {
        
        var variety: ExpressionVariety = .none
        
        if let scheme = ColorScheme.allCases.first(where: { raw.hasPrefix($0.rawValue) }) {
            variety = color(hex: String(raw.dropFirst(scheme.rawValue.count)))
        } else if let scheme = ScriptScheme.allCases.first(where: { raw.hasPrefix($0.rawValue) }) {
            variety = script(scheme: scheme, script: String(raw.dropFirst(scheme.rawValue.count)))
        }
        
        return variety
    }
}

struct Expression {
    
    var raw: RawTypable
    
    func execute(_ handler: (ExpressionTypable?) -> Void) {
        
        var e: ExpressionTypable?
        
        repeat {
            if raw is ImmediateRawTypable {
                e = raw
                break
            }
            guard let str = raw as? String else { break }
            
            let v = ExpressionVariety.from(raw: str)
            switch v {
            case .none:
                break
            case .color(let hex):
                e = handle(color: hex)
            case .script(let scheme, let script):
                e = handle(scheme: scheme, script: script)
            }
            
        } while false
        
        handler(e)
    }
}

extension Expression {
    
    func handle(color hex: String) -> ExpressionTypable {
        UIColor.ifc.fromHexString(hex: hex)
    }
    
    func handle(scheme: ScriptScheme, script: String) -> ExpressionTypable? {
        
        let e: ExpressionTypable?
        
        switch scheme {
        case .javascript:
            fatalError()
        case .native:
            fatalError()
        }
        
        return e
    }
}
