//
//  Style.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

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
