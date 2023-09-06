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
  
  func start() {
    let app = FBApplication.fb_activeApplication(withDefaultBundleId: "com.sobey.JiangXiTV")
    app.cells.element(boundBy: 0).tap()
    
    let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {[weak self] _ in
      self?.timerRun(app: app)
    }
    
    RunLoop.current.add(timer, forMode: .default)
  }
  
  private func timerRun(app: FBApplication) {
    let size = app.frame.size
    let offset = CGVector(dx: CGFloat(arc4random() % UInt32(size.width)), dy: CGFloat(arc4random() % UInt32(size.height)))
    let tapCoordinate = app.coordinate(withNormalizedOffset: .zero).withOffset(offset)
    tapCoordinate.tap()
    print("--- auto services:", offset)
  }
}
