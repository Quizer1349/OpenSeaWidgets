//
//  APIClientTests.swift
//  OpenSeaWidgetsTests
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import XCTest
@testable import OpenSeaWidgets

class APIClientTests: XCTestCase {
    var apiClient: APIClient!
    let session = MockURLSession()

    override func setUp() {
        super.setUp()
        apiClient = APIClient.shared
        apiClient.urlSession = session
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_GetRequestWithRouterMock() {
        apiClient.router(RouterMock.self).request(.get) { (result: Result<CharactersList, NetworkError>) in
            // Return data
        }
        
        XCTAssert(session.lastURL == RouterMock.get.urlForCheck)
    }
    
    func test_GetParamsRequestWithRouterMock() {
        let params = ["page": 123]
        apiClient.router(RouterMock.self).request(.getWithParams(params: params)) { (result:    Result<CharactersList, NetworkError>) in
            // Return data
        }
      
        XCTAssertNotNil(session.lastURL)
        let urlComponent = URLComponents(string: session.lastURL!.absoluteString)
        XCTAssert(urlComponent?.queryItems?.contains(URLQueryItem(name: "page", value: "123")) == true)
    }
    
    func test_GetResumeCalled() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask

        apiClient.router(RouterMock.self).request(.get) { (result: Result<CharactersList, NetworkError>) in
            // Return data
        }
      
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_GetCancelCalled() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask

        let router = apiClient.router(RouterMock.self)
        router.request(.get) { (result: Result<CharactersList, NetworkError>) in
            // Return data
        }
        router.cancel()
      
        XCTAssert(dataTask.cancelWasCalled)
    }
    
    func test_GetShouldReturnData() {
        let expectedData = """
        {
          "count": 671,
          "pages": 34,
          "next": "https://rickandmortyapi.com/api/character?page=2",
          "prev": null
        }
        """.data(using: .utf8)
        session.nextData = expectedData
      
        var actualData: Pagination?
        apiClient.router(RouterMock.self).request(.get) { (result: Result<Pagination, NetworkError>) in
            switch result {
            case .success(let response):
                actualData = response
            case .failure(let error):
              fatalError(error.localizedDescription)
            }
        }
      
        XCTAssertNotNil(actualData)
        XCTAssertEqual(actualData?.count, 671)
    }
}
