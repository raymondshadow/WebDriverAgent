//
//  AutoButtonRunner.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/14.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class GVIButtonRunner: GVIRunnerProtocol {
  var app: FBApplication = FBApplication(bundleIdentifier: "")
  
  var type: GVIRunnerType {
    return .button
  }
  
  required init(app: FBApplication) {
    self.app = app
  }
  
  func run() {
    let buttons = app.buttons
    guard buttons.count > 0 else { return }
    let index = Int(arc4random() % UInt32(buttons.count))
    let currentBtn = buttons.element(boundBy: index)
    currentBtn.tap()
  }
}
