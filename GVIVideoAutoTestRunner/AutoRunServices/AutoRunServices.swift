//
//  AutoRunServices.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/6.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class AutoRunServices: NSObject {
  static let shared = AutoRunServices()
  private var runners: [GVIRunnerProtocol] = []
  
  func start() {
    let app = FBApplication.fb_activeApplication(withDefaultBundleId: "com.sobey.JiangXiTV")
    registerRunner(app: app)
    let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] _ in
      self?.timerRun(app: app)
    }
    
    RunLoop.current.add(timer, forMode: .default)
  }
  
  private func timerRun(app: FBApplication) {
    runners.filter {
      $0.type == .randomClick
    }.first?.run()
  }
}

extension AutoRunServices {
  private func registerRunner(app: FBApplication) {
    let buttonRunner = GVIButtonRunner(app: app)
    runners.append(buttonRunner)
    
    let radomRunner = GVIAutoRandomClickRunner(app: app)
    runners.append(radomRunner)
  }
}
