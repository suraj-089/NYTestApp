//
//  ServiceHelperTests.swift
//  NYTestAppTests
//
//  Created by Suraj on 12/17/20.
//  Copyright © 2020 Madstech. All rights reserved.
//

import XCTest

@testable import NYTestApp

class ServiceHelperTests: XCTestCase {
    
    func testCancelRequest() {
        
        // giving a "previous" session
        ServiceHelper.shared.fetchArticles { (_) in
            // ignore call
        }
        
        // Expected to task nil after cancel
        ServiceHelper.shared.cancelFetchArticles()
        XCTAssertNil(ServiceHelper.shared.task, "Expected task nil")
    }
}
