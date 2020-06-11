//
//  ExpressionTests.swift
//  iFlexCocoaDemoTests
//
//  Created by Thriller on 6/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import iFlexCocoa

class ExpressionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJSScript() throws {
        
        let jsScript = "js:onClick"
        let e = Expression.init(raw: jsScript)
        
        e.execute { (r) in
            XCTAssertNotNil(r)
        }
    }

}
