//
//  ProductWebServiceTest.swift
//  TableViewTests
//
//  Created by Jitendra Kumar on 21/07/20.
//  Copyright © 2020 Jitendra Kumar. All rights reserved.
//

import XCTest
@testable import TableView

class ProductWebServiceTest: XCTestCase {
    var productWebService:WebService!
    
    // Set up your properties
    override func setUp() {
        productWebService = WebService(urlString: ProductConstant.productURLString)
        
    }
    // Release all the properties that you created
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        productWebService = nil
    }

    func testApiResponse() {

        let expectations = expectation(description: "WebService Response")
        // Act
        productWebService.getProducts() { (productResponseModel, error) in
            XCTAssert(productResponseModel != nil, "Data is not receiving from server")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
