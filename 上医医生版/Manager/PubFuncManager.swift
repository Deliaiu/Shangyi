//
//  PubFuncManager.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/31.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation
import UIKit

//MARK: - 获取当前页面的最顶层控制器

func getCurrentVC() -> UIViewController {
    
    let keywindow = (UIApplication.shared.delegate as! AppDelegate).window//UIApplication.shared.keyWindow使用此有时会崩溃
    let firstView: UIView = (keywindow?.subviews.first)!
    let secondView: UIView = firstView.subviews.first!
    var vc = secondView.viewForController()
    vc = ((vc as! UITabBarController).selectedViewController! as! UINavigationController).visibleViewController!
    return vc!
}


// MARK: - alert

func presentAlertVC(confirmBtn:String?, message:String, title:String, cancelBtn:String, handler:@escaping(UIAlertAction) ->Void) {
    let alertVc = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: cancelBtn, style: .cancel, handler:nil)
    alertVc.addAction(cancelAction)
    if confirmBtn != nil {
        let okAction = UIAlertAction(title: confirmBtn, style: .default, handler: { (action)in
            handler(action)
        })
        alertVc.addAction(okAction)
    }
    getCurrentVC().present(alertVc, animated:true, completion:nil)
}


/// 调整字体大小

func kFontSize(_ a: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: a)
}
func kFontBoldSize(_ a: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: a)
}

// MARK:- 日志打印
//开发的时候打印，但是发布的时候不打印,使用方法，输入 printLog(message: "输入")
// 带方法名、行数
func printLog<T>(_ message:T,method:String = #function,line:Int = #line){
    #if DEBUG
    print("-[method:\(method)] " + "[line:\(line)] " + "\(message)")
    #endif
}


//MARK:- 字符串判空 如果为空返回@“”
func kStringIsEmpty(_ value: AnyObject?) -> Bool {
    //首先判断是否为nil
    if (nil == value) {
        //对象是nil，直接认为是空串
        return true
    }else{
        //然后是否可以转化为String
        if let myValue  = value as? String{
            //然后对String做判断
            return myValue == "" || myValue == "(null)" || 0 == myValue.count || myValue.contains("null")
        }else{
            //字符串都不是，直接认为是空串
            return true
        }
    }
}
