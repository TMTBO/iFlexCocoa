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
        let style: [String : Any] = [
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

}
