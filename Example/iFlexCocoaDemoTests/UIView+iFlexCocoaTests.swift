//
//  UIView+iFlexCocoaTests.swift
//  iFlexCocoaDemoTests
//
//  Created by Thriller on 2020/6/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import iFlexCocoa

class UIView_iFlexCocoaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMapLabels() throws {
        
        let v = UIView()
        let style: [String : RawTypable] = [
            "alpha": 1,
            "color": "#ff0000",
            "background-color": "#00ff00",
            "background": "#0000ff",
            "border-radius": 5,
            "border": 1,
            "border-color": "#0088dd"
            ]
        
        let newStyle = v.ifc.map(style: style)
        
        XCTAssertTrue(style.count == 7)
        XCTAssertTrue(newStyle.count == 5)
    }
    
    func testStyle() {
        let v = UIView()
        let style: [String : RawTypable] = [
            "alpha": 0.5,
            "color": "#ff0000",
            "background-color": "#00ff00",
            "background": "#0000ff",
            "border-radius": 5,
            "border": 1,
            "border-color": "#0088dd"
        ]
        
        XCTAssertEqual(v.alpha, 1)
        XCTAssertEqual(v.backgroundColor, nil)
        XCTAssertEqual(v.layer.cornerRadius, 0)
        XCTAssertEqual(v.layer.borderWidth, 0)
//        XCTAssertEqual(v.layer.borderColor, UIColor.black.cgColor)
        
        _ = v.ifc.style(style)
        
        XCTAssertEqual(v.alpha, 0.5)
//        XCTAssertEqual(v.backgroundColor, UIColor.blue)
        XCTAssertEqual(v.layer.cornerRadius, 5)
        XCTAssertEqual(v.layer.borderWidth, 1)
    }

}
