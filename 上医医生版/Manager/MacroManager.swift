//
//  File.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/31.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation
import UIKit

// MARK:- 沙盒相关
//获取沙盒Document路径
let kDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
//获取沙盒Cache路径
let kCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
//获取沙盒temp路径
let kTempPath = NSTemporaryDirectory()

//MARK:- 适配
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenFrame = UIScreen.main.bounds

let kStatusHeight = UIApplication.shared.statusBarFrame.height
let kNaviHeight = UIApplication.shared.statusBarFrame.height + 44.0
let kTabbarHeight = kStatusHeight > 20 ? CGFloat(83) : CGFloat(49)


//MARK: 屏幕比率
let kWidthRatio = (kScreenWidth / 375.0)

//MARK: userdefault
let kUserDefaults = UserDefaults.standard
let home_receipt = "home_receipt"//首页接收按钮 bool
