//
//  ModuleManager.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/24.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

//制定协议
public protocol ModuleManagerDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]?)
    
    //其它的处理。。。
    func applicationDidEnterBackground(_ application: UIApplication)
}

extension ModuleManagerDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]?){}
    //其它的处理。。。    
    func applicationDidEnterBackground(_ application: UIApplication){}
}
//创建管理类
public class ModuleManager : NSObject {
    static let shareInstence = ModuleManager.init()
    
    private override init() {
    }
    
    public func loadModule(_ module: ModuleManagerDelegate? ){
        if((module) != nil){
            self.allModules.append(module!)
        }
    }
    public func loadAllModule(_ modules:[Array<ModuleManagerDelegate>]?){
        if((modules) != nil){
            self.allModules.removeAll()
            for item in modules!{
                self.allModules.append(item as! ModuleManagerDelegate)
            }
        }
    }
    
    // MARK: - app delegate
    public  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]?){
        for  service in self.allModules {
            service.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    }

    
    lazy var allModules: Array<ModuleManagerDelegate> = {
        var array = Array<ModuleManagerDelegate>()
        return array
    }()
}


//MARK: - 用一个类管理所有的业务，注册服务模块
public class ServiceComponentManager {
  
    public class func  registerAllService(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]?){
       
        //other
        ModuleManager.shareInstence.loadModule(OthersMoudel())
        
        ModuleManager.shareInstence.application(application,didFinishLaunchingWithOptions: launchOptions)
    }
}
