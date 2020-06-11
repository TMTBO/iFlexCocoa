//
//  StyleWorker.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import UIKit

struct StyleWorker {
    
    let key: String
    let value: RawTypable
    
    func work(on target: UIView) {
        
        do {
            let e = Expression(raw: value)
            
            e.execute { (r) in
                target.setValue(r, forKeyPath: key)
            }
        } catch let err {
            Logger.error("work error: \(err.localizedDescription)")
        }
    }
}
