//
//  KittyCatsAppUITests.swift
//  KittyCatsAppUITests
//
//  Created by Sabina Huseynova on 26.10.21.
//

import XCTest
@testable import KittyCatsApp

class KittyCatsAppUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
                let app = XCUIApplication()
        app.launch()

        let img = app.images["myImage"]
        XCTAssertTrue(img.exists, "no")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
