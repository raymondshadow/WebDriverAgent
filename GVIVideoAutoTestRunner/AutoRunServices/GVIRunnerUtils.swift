//
//  AutoElementUtils.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/14.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class GVIRunnerUtils: NSObject {
  static func isBackIdentify(label: String) -> Bool {
    guard label.count > 0 else { return false }
    
    let backLabels = ["back"]
    let filterLabel = backLabels.filter {
      label.contains($0, caseSensitive: false)
    }
    
    return filterLabel.count > 0
  }
  
  static func isBackPosition(element: GVIUIElement) -> Bool {
    let normalFrame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: NAVI_STATUS_BAR_HEIGHT)
    guard let el = element.element else { return false}
    let result = CGRectIntersectsRect(el.frame, normalFrame)
    return result
  }
}
