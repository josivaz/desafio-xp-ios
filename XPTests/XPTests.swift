//
//  XPTests.swift
//  XPTests
//
//  Created by Josielle Vaz on 20/07/22.
//

import XCTest
@testable import XP

class XPTests: XCTestCase {

    let service = UserService()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDepositInUserAccount() {
        let amount: Decimal = 10
        let previousBalance = MockDataBase.users.first(where: { $0.id == 1 })!.balance
        let expectedValue = previousBalance + amount
        service.deposit(value: amount, userId: 1, callback: { _ in })
        
        let newBalance = MockDataBase.users.first(where: { $0.id == 1 })!.balance
        XCTAssertEqual(expectedValue, newBalance)
    }
    
    func testWithdrawlInUserAccount() {
        let amount: Decimal = 10
        let previousBalance = MockDataBase.users.first(where: { $0.id == 1 })!.balance
        let expectedValue = previousBalance - amount
        service.withdrawl(value: amount, userId: 1, callback: { _ in })
        
        let newBalance = MockDataBase.users.first(where: { $0.id == 1 })!.balance
        XCTAssertEqual(expectedValue, newBalance)
    }
}
