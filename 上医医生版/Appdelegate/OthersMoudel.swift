
//
//  OthersMoudel.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

import IQKeyboardManagerSwift
import WebKit

class OthersMoudel: NSObject, ModuleManagerDelegate {

    var delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?){
        printLog("各种第三方实现")
   
        //键盘
        keyboradManage()
        
        //设置初始值
    }
    
    
    func keyboradManage()  {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "完成"
    }
    
    
    func userDefaultManager() {
        if kUserDefaults.string(forKey: home_receipt)?.isEmpty == true {
            kUserDefaults.write(obj: "1", key: home_receipt)
        }
    }
}
