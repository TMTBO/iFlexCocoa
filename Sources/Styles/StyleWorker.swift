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
        
        target.setValue(value, forKey: key)
    }
}
