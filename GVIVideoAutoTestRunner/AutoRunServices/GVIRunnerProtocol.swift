//
//  AutoBaseRunner.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/13.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

enum GVIRunnerType {
  case all
  case button
  case randomClick
}

protocol GVIRunnerProtocol {
  var app: FBApplication { get set}
  var type: GVIRunnerType {get}
  init(app: FBApplication)
  func run()
}
