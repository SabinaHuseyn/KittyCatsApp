//
//  KittyCatsAppTests.swift
//  KittyCatsAppTests
//
//  Created by Sabina Huseynova on 26.10.21.
//

import XCTest
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import KittyCatsApp

class KittyCatsAppTests: XCTestCase {
    
    var viewModel: ObservableCatViewModel!
    var expectedResult: [ObservableCatViewModel.CatViewModel]!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        viewModel = ObservableCatViewModel()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    func testFetchedCats() throws {
        
        let result = try viewModel.fetchCats().toBlocking().first()
        XCTAssertEqual(result!.count, 5)
    }
    
}
