//
//  DataTests.swift
//  DataTests
//
//  Created by Bruna Fernanda Drago on 02/01/21.
//

import XCTest

class RemoteAddAccount {
    
    private let url : URL
    private let httpClient: HttpClient
    
    init(url:URL , httpClient:HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(){
        httpClient.post(url: url)
    }
}

protocol HttpClient {
    func post(url:URL)
}

class RemoteAddAccountTests: XCTestCase {
    
    func test_(){
        let url = URL(string: "www.google.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }
    class HttpClientSpy: HttpClient {
        var url: URL?
        
        func post(url:URL) {
            self.url = url
        }
    }
}
