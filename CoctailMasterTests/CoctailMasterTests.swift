//
//  CoctailMasterTests.swift
//  CoctailMasterTests
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import XCTest
@testable import CoctailMaster

class CoctailMasterTests: XCTestCase {

    var mainScreenModel: MainScreenViewModel!

    override func setUpWithError() throws {
        AppContainer.shared.register { DataServiceTestImpl() }
            .as(DataService.self)
            .lifetime(.single)
            .test()
        AppContainer.shared.register { MainScreenViewModel(dataService: $0) }
            .lifetime(.objectGraph)

        mainScreenModel = AppContainer.shared.resolve()
    }

    override func tearDownWithError() throws {
        mainScreenModel = nil
    }

    func testLoading() throws {
        let expectation = self.expectation(description: "Expect")
        mainScreenModel.viewLoaded()
        delay(1) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(true, true)
    }
}

class DataServiceTestImpl: DataService {
    func getIngridientList(closure: @escaping ([Ingridient]?, Error?) -> Void) {
        delay(0.1) {
            closure([Ingridient(strIngredient1: "1"), Ingridient(strIngredient1: "2")], nil)
        }
    }

    func getRandomDrink(closure: @escaping (Drink?, Error?) -> Void) {

    }
}
