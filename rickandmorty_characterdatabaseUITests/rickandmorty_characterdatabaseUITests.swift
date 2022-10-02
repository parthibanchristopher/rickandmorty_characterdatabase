//
//  rickandmorty_characterdatabaseUITests.swift
//  rickandmorty_characterdatabaseUITests
//
//  Created by Admin on 30/9/22.
//

import XCTest
import rickandmorty_characterdatabase

class rickandmorty_characterdatabaseUITests: XCTestCase {

    // MARK: TEST HOME SCREEN UI
    // tests the existence of the UI elements on the home screen and checks if the total number of character elements present and the intended number of characters per page is the same
    func test_HomeScreen_UI() {
        let app = XCUIApplication()
        app.launch()
        let elementsQuery = app.scrollViews.otherElements
        
        XCTAssert(elementsQuery.buttons.count == 20)
        
        XCTAssert(elementsQuery.buttons["Character 1"].exists)
        XCTAssert(elementsQuery.buttons["Character 2"].exists)
        XCTAssert(elementsQuery.buttons["Character 3"].exists)
        XCTAssert(elementsQuery.buttons["Character 4"].exists)
        XCTAssert(elementsQuery.buttons["Character 5"].exists)
        XCTAssert(elementsQuery.buttons["Character 6"].exists)
        XCTAssert(elementsQuery.buttons["Character 7"].exists)
        XCTAssert(elementsQuery.buttons["Character 8"].exists)
        XCTAssert(elementsQuery.buttons["Character 9"].exists)
        XCTAssert(elementsQuery.buttons["Character 10"].exists)
        XCTAssert(elementsQuery.buttons["Character 11"].exists)
        XCTAssert(elementsQuery.buttons["Character 12"].exists)
        XCTAssert(elementsQuery.buttons["Character 13"].exists)
        XCTAssert(elementsQuery.buttons["Character 14"].exists)
        XCTAssert(elementsQuery.buttons["Character 15"].exists)
        XCTAssert(elementsQuery.buttons["Character 16"].exists)
        XCTAssert(elementsQuery.buttons["Character 17"].exists)
        XCTAssert(elementsQuery.buttons["Character 18"].exists)
        XCTAssert(elementsQuery.buttons["Character 19"].exists)
        XCTAssert(elementsQuery.buttons["Character 20"].exists)
    }
    
    // MARK: TEST DETAIL SCREEN UI
    // test the existence of the UI elements of the detail screen
    func test_DetailScreen_UI() {
        let app = XCUIApplication()
        app.launch()
        let elementsQuery = app.scrollViews.otherElements
        
        // button tap from home screen to detail screen
        XCTAssert(elementsQuery.buttons["Character 7"].exists)
        elementsQuery.buttons["Character 7"].tap()
        
        XCTAssert(elementsQuery.staticTexts["Character Name"].exists)
        XCTAssert(elementsQuery.staticTexts["Character Species"].exists)
        XCTAssert(elementsQuery.staticTexts["Character Gender"].exists)
        XCTAssert(elementsQuery.staticTexts["Character Origin"].exists)
        XCTAssert(elementsQuery.staticTexts["Character Date"].exists)
        XCTAssert(elementsQuery.staticTexts["Character Status"].exists)
        XCTAssert(elementsQuery.staticTexts["Character Location"].exists)
        XCTAssert(elementsQuery.staticTexts["Character Episodes"].exists)
    }
}
