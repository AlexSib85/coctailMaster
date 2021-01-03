//
//  CoctailMasterTests.swift
//  CoctailMasterTests
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import XCTest
@testable import CoctailMaster

class CoctailMasterTests: XCTestCase {

    var rootModel: RootViewModel!

    override func setUpWithError() throws {
        AppContainer.shared.register { NetworkManagerTestImpl() }
            .as(NetworkManager.self)
            .lifetime(.single)
            .test()
        rootModel = RootViewModel()
    }

    override func tearDownWithError() throws {
        rootModel = nil
    }

    func testLoading() throws {
        let expectation = self.expectation(description: "Expect")
        rootModel.viewLoaded()
        delay(1) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(true, true)
    }
}

class NetworkManagerTestImpl: NetworkManager {

    func loadList(closure: @escaping ([String]) -> Void) {
        delay(0.1) {
            closure(["5", "6"])
        }
    }
}
