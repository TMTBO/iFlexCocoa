//
//  iFlexCocoa.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

struct Extension<Base> {
    
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

protocol Compatible {
    
    associatedtype CompatibleType
    
    static var ifc: CompatibleType.Type { get }
    var ifc: CompatibleType { get }
}

extension Compatible {
    
    static var ifc: Extension<Self>.Type {
        Extension.self
    }
    
    var ifc: Extension<Self> {
        Extension(self)
    }
}

