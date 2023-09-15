//
//  AutoRadomClickRunner.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/13.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class GVIAutoRandomClickRunner: GVIRunnerProtocol {
  var app: FBApplication = FBApplication(bundleIdentifier: "")
  var type: GVIRunnerType {
    return .randomClick
  }
  
  required init(app: FBApplication) {
    self.app = app
  }
  
  func run() {
    let size = app.frame.size
    let offset = CGVector(dx: CGFloat(arc4random() % UInt32(size.width)), dy: CGFloat(arc4random() % UInt32(size.height)))
    let tapCoordinate = app.coordinate(withNormalizedOffset: .zero).withOffset(offset)
    tapCoordinate.tap()
    
    app.buttons.element(boundBy: 0).frame
  }
}
