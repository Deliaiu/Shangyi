//
//  StringEXT.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/24.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation

extension String{
   
    //MARK: - 以1开头的11位数字
    func isPhoneNumber() -> Bool {
        let mobile = "^1[0-9]{10}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regextestmobile.evaluate(with: self) == true {
            return true
        }else{
            return false
        }
    }
    
    func isvalitemobile() -> Bool {
        let mobileRegex = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
        let mobileTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", mobileRegex)
        return mobileTest.evaluate(with: self)
    }
    
    func isvaliteemail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    func isvaliteidnum() -> Bool {
        let idRegex = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
        return idTest.evaluate(with: self)
    }
    
    //MARK: - 计算textsize
    func getStringSize(rectSize: CGSize,font: UIFont) -> CGSize {
        let str: NSString = self as NSString
        let rect = str.boundingRect(with: rectSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return CGSize(width: ceil(rect.width), height: ceil(rect.height))
    }
}
