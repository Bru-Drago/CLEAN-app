//
//  DataTests.swift
//  DataTests
//
//  Created by Bruna Fernanda Drago on 02/01/21.
//

import XCTest
import Domain

class RemoteAddAccount {
    
    private let url : URL
    private let httpClient: HttpPostClient
    
    init(url:URL , httpClient:HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(addAccountModel: AddAccountModel){
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url:URL)
}

class RemoteAddAccountTests: XCTestCase {
    
    func test_add_should_call_httpClient_with_correct_url(){
        let url = URL(string: "www.google.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add(addAccountModel: <#AddAccountModel#>)
        XCTAssertEqual(httpClientSpy.url, url)
    }
    func test_add_should_call_httpClient_with_correct_data(){
        let url = URL(string: "www.google.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        sut.add(addAccountModel: <#AddAccountModel#>)
        XCTAssertEqual(httpClientSpy.data, data)
    }
}

extension RemoteAddAccountTests {
 
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        
        func post(url:URL) {
            self.url = url
        }
    }
}
