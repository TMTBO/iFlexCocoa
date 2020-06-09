//
//  ResourceLoader.swift
//  iFlexCocoa
//
//  Created by Thriller on 2020/6/9.
//

import Foundation

class ResourceLoader {
    
    static let shared = ResourceLoader()
    
    private init() {
        
    }
}

extension ResourceLoader {
    
    func bundle() -> Bundle? {
        
        guard let bundlePath = Bundle(for: ResourceLoader.self)
            .path(forResource: "iFlexCocoa", ofType: "bundle") else { return nil }
        return Bundle(path: bundlePath)
    }
    
    // TODO: cache labels
    func flexboxLabels() -> [String: Any] {
        
        var labels: [String: Any] = [:]
        do {
            guard let url = bundle()?.url(forResource: "flexbox_labels", withExtension: "json") else { return labels }
            let data = try Data(contentsOf: url)
            labels = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
            
        } catch let err {
            Logger.error("load flexbox_style.json error: \(err.localizedDescription)")
        }
        return labels
    }
    
    func flexboxLabels(for type: TempleteType) -> [String: String] { flexboxLabels()[type.rawValue] as? [String: String] ?? [:] }
}
