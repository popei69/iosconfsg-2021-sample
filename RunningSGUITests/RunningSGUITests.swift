//
//  RunningSGUITests.swift
//  RunningSGUITests
//
//  Created by Benoit PASQUIER on 23/11/2020.
//

import XCTest

class RunningSGUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        self.app = nil
    }

    func testScreenshots() throws {
        app.launch()
        
        XCTAssertTrue(app.buttons["CardViews"].waitForExistence(timeout: 5.0))
        
        attachScreenshot(name: "list-view")
        
        app.buttons["CardViews"].firstMatch.tap()
        
        XCTAssertTrue(app.scrollViews["Detail.ScrollView"].waitForExistence(timeout: 5.0))
        
        attachScreenshot(name: "detail-view")
    }

    private func attachScreenshot(name: String) {
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

