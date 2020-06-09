//
//  StyleAction.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

protocol StyleAction {}

struct AssignAction<ValueType>: StyleAction {
    
    let value: ValueType
}

struct AsyncAction: StyleAction {
    
}
