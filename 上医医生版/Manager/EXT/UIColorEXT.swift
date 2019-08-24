
//  UIColorEXT.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/24.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation

// MARK: - 颜色
extension UIColor {
    /// 扩展RGB类型，类型方法
    static func rgba(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
        return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
    }
    static func rgb(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return rgba((r), (g), (b), 1)
    }
    /// 十六进制的色值，类型方法
    static func hex(_ value:Int) -> UIColor{
        return rgb(CGFloat((value & 0xFF0000) >> 16),
                   CGFloat((value & 0x00FF00) >> 8),
                   CGFloat((value & 0x0000FF)))
    }
    static func hexa(_ value:Int, _ a:CGFloat) -> UIColor{
        return rgba(CGFloat((value & 0xFF0000) >> 16),
                    CGFloat((value & 0x00FF00) >> 8),
                    CGFloat((value & 0x0000FF)), a)
    }
    /// 随机色，类型属性
    static var rand: UIColor {
        return rgb(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)))
    }
    
    // MARK:- 颜色
    static var SY_red: UIColor {
        return hex(0xC72B31) //暗红色
    }
  
    static var SY_Background: UIColor {
        return hex(0xEFEFF3) //背景
    }
    
    
    static var SY_Desc: UIColor {
        return hex(0x9B9B9B) //提示文字
    }
    
    static var SY_Normal: UIColor {
        return hex(0x3C3C3C) //主要文字
    }
    
    static var SY_line: UIColor {
        return hex(0xE8E9EA) // line
    }
    
    static var SY_HidGold: UIColor {
        return hex(0x8F6043) // 暗金色
    }
    
  
}
