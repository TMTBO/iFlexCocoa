//
//  StyleWorker.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import UIKit

struct StyleWorker {
    
    let key: String
    let value: Any
    
    func work(on target: UIView) {
        
        do {
            let action = try ExpressionParser.parse(value: value)
            
            if let a = action as? AssignAction {
                target.setValue(a.value, forKeyPath: key)
            } else {
                Logger.error("cast StyleAction error \(action)")
            }
        } catch let err {
            Logger.error("work error: \(err.localizedDescription)")
        }
    }
}
