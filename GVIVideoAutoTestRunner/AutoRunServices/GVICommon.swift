//
//  GVICommon.swift
//  GVIVideoAutoTestRunner
//
//  Created by wu on 2023/9/14.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

let STATUS_BAR_HEIGHT           = { StatusHeight }
let NAVI_BAR_HEIGHT: CGFloat = 44.0
let NAVI_STATUS_BAR_HEIGHT: CGFloat = STATUS_BAR_HEIGHT() + NAVI_BAR_HEIGHT
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let StatusHeight: CGFloat = {
  if #available(iOS 13.0, *) {
    let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let frame = scene?.statusBarManager?.statusBarFrame
    return frame?.height ?? 0
  } else {
    return UIApplication.shared.statusBarFrame.size.height
  }
}()


