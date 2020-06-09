//
//  ResourceLoaderTests.swift
//  iFlexCocoaTests
//
//  Created by Thriller on 2020/6/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import iFlexCocoa

class ResourceLoaderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadBundle() throws {
        
        let b = ResourceLoader.shared.bundle()
        
        XCTAssertNotNil(b)
    }
    
    func testLoadLabels() {
        
        let labels = ResourceLoader.shared.flexboxLabels()
        
        XCTAssertTrue(labels.count > 0)
    }
    
    func testLoadLabelsForKey() {
        let labels = ResourceLoader.shared.flexboxLabels(for: .base)
        
        XCTAssertTrue(labels.count > 0)
    }

}
