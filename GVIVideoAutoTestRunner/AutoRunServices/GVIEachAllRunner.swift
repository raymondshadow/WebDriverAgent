//
//  AutoRunner.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/15.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class GVIEachAllRunner: GVIRunnerProtocol {
  var app: FBApplication = FBApplication(bundleIdentifier: "")
  
  var type: GVIRunnerType = .all
  
  required init(app: FBApplication) {
    self.app = app
  }
  
  func run() {
    
  }
}
