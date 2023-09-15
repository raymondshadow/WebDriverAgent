//
//  AutoUIElement.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/14.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class GVIUIElement: NSObject {
  var isExecuted = false
  var pageIdentify = ""
  var element: XCUIElement?
  
  var actualIdentify: String {
    guard let el = element else { return "" }
    
    if el.identifier.count > 0 {
      return el.identifier
    }
    
    let id = pageIdentify + "-\(el.frame.minX):\(el.frame.minY):\(el.frame.width):\(el.frame.height)"
    return id
  }
}

class GVIPageElement: NSObject {
  var identify = ""
  var element: XCUIElement?
  var childs: [GVIUIElement] = []
}
