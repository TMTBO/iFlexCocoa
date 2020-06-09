//
//  UtilityTests.swift
//  iFlexCocoaDemoTests
//
//  Created by Thriller on 2020/6/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import iFlexCocoa

class UtilityTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testColorFromHexRGBA() throws {
        
        let rgba = "#ff0000ff"
        
        let color = UIColor.ifc.fromHexString(hex: rgba)
        
        XCTAssertEqual(color, UIColor.red)
    }

    func testColorFromHexRGB() throws {
        
        let rgb = "#00ff00"
        
        let color = UIColor.ifc.fromHexString(hex: rgb)
        
        XCTAssertEqual(color, UIColor.green)
    }
    
    func testColorFromHexRGBABrown() throws {
        // 0.6, 0.4, 0.2 RGB
        let rgb = "#996633"
        
        let color = UIColor.ifc.fromHexString(hex: rgb)
        
        XCTAssertEqual(color, UIColor.brown)
    }
}
