//
//  rickandmorty_characterdatabaseTests.swift
//  rickandmorty_characterdatabaseTests
//
//  Created by Admin on 30/9/22.
//

import XCTest
@testable import rickandmorty_characterdatabase

class rickandmorty_characterdatabaseTests: XCTestCase {

    // MARK: TEST PREPARE NETWORK REQUEST SUCCESS
    // test to see if the correct url will successfully generate a request
    func test_PrepareNetworkRequest_Success() {
        let testingURL = "https://rickandmortyapi.com/api/character/"
        let testingData = NetworkManager.shared.prepareNetworkRequest(urlString: testingURL)
        XCTAssertNotNil(testingData.request)
        XCTAssertNil(testingData.error)
    }
    
    // MARK: TEST PREPARE NETWORK REQUEST ERROR
    // test to see if the function will throw an error if string provided to form the url was either empty or was some other string
    func test_PrepareNetworkRequest_URLError() {
        let emptyURL = ""
        let emptyData = NetworkManager.shared.prepareNetworkRequest(urlString: emptyURL)
        XCTAssertNotNil(emptyData.error)
        XCTAssertNil(emptyData.request)
        XCTAssertEqual(emptyData.error?.localizedDescription, NetworkManager.errorMessage.urlError.localizedDescription)
        
        let notURL = "wrong url"
        let notData = NetworkManager.shared.prepareNetworkRequest(urlString: notURL)
        XCTAssertNotNil(notData.error)
        XCTAssertNil(notData.request)
        XCTAssertEqual(notData.error?.localizedDescription, NetworkManager.errorMessage.urlError.localizedDescription)
    }
    
    // MARK: TEST PROCESS NETWORK REQUEST SUCCESS
    // test to see if can successfully receive data from the process network request function
    func test_ProcessNetworkRequest_Success() {
        let testingCorrectURL = URL(string: "https://rickandmortyapi.com/api/character/")
        
        let expectation = self.expectation(description: "receive data or error from network request")
        
        var request = URLRequest(url: testingCorrectURL!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        NetworkManager.shared.processNetworkRequest(request: request)
        { data, error in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 20, handler: nil)
    }
    
    // MARK: TEST PROCESS NETWORK REQUEST ERROR
    // test to see if wrong url format will throw an error if there is no data to receive from the process network request function
    func test_ProcessNetworkRequest_Error() {
        let testingWrongURL = URL(string: "blep")
        
        let expectation = self.expectation(description: "receive data or error from network request")
        
        var request = URLRequest(url: testingWrongURL!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        NetworkManager.shared.processNetworkRequest(request: request)
        { data, error in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.localizedDescription, NetworkManager.errorMessage.dataError.localizedDescription)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 20, handler: nil)
    }
    
    // MARK: TEST LOAD CHARACTER ARRAY SUCCESS
    // test to see if the load character array function can decode and return character objects correctly based on static json data
    func test_LoadCharacterArray_StaticData_Success(){
        let HomeScreenViewModel = HomeScreenViewModel()
        let results = HomeScreenViewModel.loadCharacterArray(jsonData: staticFullJSON)
        XCTAssertNil(results.error)
        XCTAssertEqual(results.array.count, 3)
    }
    
    // MARK: TEST LOAD CHARACTER ARRAY ERROR
    // test to see if the load character array can throw an error successfully when it tries to decode wrong json data
    func test_LoadCharacterArray_StaticData_Error(){
        let HomeScreenViewModel = HomeScreenViewModel()
        let results = HomeScreenViewModel.loadCharacterArray(jsonData: characterJSON)
        
        XCTAssertEqual(results.array.count, 0)
        XCTAssertNotNil(results.error)
        XCTAssertEqual(results.error?.localizedDescription, "Error Decoding Data")
    }
}
