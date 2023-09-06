//
//  GVIVideoAutoTestRunner.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/6.
//  Copyright © 2023 Facebook. All rights reserved.
//

import XCTest

final class GVIVideoAutoTestRunner: XCTestCase {
  override class func setUp() {
    super.setUp()
  }
  
  func testRunner() {
    let app = FBApplication(bundleIdentifier: "com.sobey.JiangXiTV")
    app.launch()
    AutoRunServices.shared.start()
    while RunLoop.main.run(mode: .default, before: Date.distantFuture) {
      
    }
  }
  
}
