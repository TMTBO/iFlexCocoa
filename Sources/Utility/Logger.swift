//
//  Support.Logger.swift
//  ITNetLibrary
//
//  Created by Thriller on 2019/9/27.
//

import Foundation
#if canImport(LZLogSystem)
import LZLogSystem
#endif

struct Logger {
    
    struct Level: OptionSet {
        var rawValue: UInt
        
        init(rawValue: Self.RawValue) {
            self.rawValue = rawValue
        }
        
        public static let error = Level(rawValue: 1 << 0)
        public static let warning = Level(rawValue: 1 << 1)
        public static let info = Level(rawValue: 1 << 2)
        public static let debug = Level(rawValue: 1 << 3)
        public static let verbose = Level(rawValue: 1 << 4)
    }
}

extension Logger {
    
    static var tag: String = "ViMe"
    
    static func debug(_ items: Any...,
        file: String = #file,
        line: Int = #line,
        function: String = #function) {
        log(items: items, level: .debug, file: file, line: line, function: function)
    }
    
    static func info(_ items: Any...,
        file: String = #file,
        line: Int = #line,
        function: String = #function) {
        log(items: items, level: .info, file: file, line: line, function: function)
    }
    
    static func warning(_ items: Any...,
        file: String = #file,
        line: Int = #line,
        function: String = #function) {
        log(items: items, level: .warning, file: file, line: line, function: function)
    }
    
    static func error(_ items: Any...,
        file: String = #file,
        line: Int = #line,
        function: String = #function) {
        log(items: items, level: .error, file: file, line: line, function: function)
    }
}

private extension Logger {
    
    static func log(items: [Any],
                            level: Level,
                            file: String,
                            line: Int,
                            function: String) {
        
        let fileName: String
        if let lastComponent = URL(string: file)?.deletingPathExtension().lastPathComponent {
            fileName = lastComponent
        } else {
            fileName = String((file as NSString).lastPathComponent)
        }
        
        let header = "<\(fileName):\(line)::{\(function)}> "
        let c = content(from: items)
        
        let res: String
        if tag.isEmpty {
            res = header + c
        } else {
            res = header + c
        }
        
        output(res, level: level)
        
    }
    
    static func content(from items: Array<Any>) -> String {
        
        let res = items.compactMap { (item) -> String? in
            if JSONSerialization.isValidJSONObject(item) {
                guard let jsonData = try? JSONSerialization.data(withJSONObject: item, options: .prettyPrinted),
                    let json = String(data: jsonData, encoding: .utf8) else {
                        return nil
                }
                
                return json
            } else {
                return "\(item)"
            }
        }.joined(separator: " ")
        return res
    }
    
    static func output(_ output: String, level: Level) {
        #if canImport(LZLogSystem)
        LLog.sharedInstance
            .log2(LLogFlag(rawValue: level.rawValue),
                  mode: .default,
                  tag: tag,
                  file: #file,
                  function: #function,
                  line: #line,
                  context: 0,
                  format: output,
                  args: getVaList([]))
        #elseif DEBUG
        print(tag, output)
        #endif
    }
}
