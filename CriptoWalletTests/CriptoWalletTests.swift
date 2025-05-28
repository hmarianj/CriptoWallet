//
//  CriptoWalletTests.swift
//  CriptoWalletTests
//
//  Created by MH on 25/03/2025.
//

@testable import CriptoWallet
import XCTest

final class CriptoWalletTests: XCTestCase {
    var sut: HomeView.ViewModel!
    var mockService: ServiceMocks!

    override func setUpWithError() throws {
        mockService = ServiceMocks(shouldFail: false)
        sut = HomeView.ViewModel(coinService: mockService)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockService = nil
    }

    func testGetCoins() async {
        // When
        await sut.getCoin()

        // Then
        XCTAssertEqual(sut.coins.count, 4)
        XCTAssertFalse(sut.displayError)
        XCTAssertFalse(sut.isLoading)
        XCTAssertTrue(sut.coins.contains(where: { coin in
            coin == Coin.bitcoinMock
        }))
        XCTAssertTrue(sut.coins.contains(where: { coin in
            coin == Coin.ethereumMock
        }))
    }

    func testGetCoinsFailure() async {
        // Given
        mockService = ServiceMocks(shouldFail: true)
        sut = HomeView.ViewModel(coinService: mockService)

        // When
        await sut.getCoin()

        // Then
        XCTAssertEqual(sut.coins.count, 0)
        XCTAssertTrue(sut.displayError)
        XCTAssertFalse(sut.isLoading)
    }
}
