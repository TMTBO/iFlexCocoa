//
//  Expression.swift
//  iFlexCocoa
//
//  Created by Thriller on 6/10/20.
//

import Foundation

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

enum ColorScheme: String, CaseIterable {
    
    case color = "color:"
    case sharp = "#"
}

enum ExpressionVariety {
    
    case none
    case color(hex: String)
    
    static func from(raw: String) -> ExpressionVariety {
        
        var variety: ExpressionVariety = .none
        
        if let colorScheme = ColorScheme.allCases.first(where: { raw.hasPrefix($0.rawValue) }) {
            variety = color(hex: String(raw.dropFirst(colorScheme.rawValue.count)))
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
                e = UIColor.ifc.fromHexString(hex: hex)
            }
            
        } while false
        
        handler(e)
    }
}
