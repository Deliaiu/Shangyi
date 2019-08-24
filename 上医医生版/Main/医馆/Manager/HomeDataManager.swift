//
//  HomeDataManager.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeDataManager: NSObject {

    
    
    //获取轮播数据
    class func requestCycleData(finishCallback : @escaping (_ result: [HomeCycleModel]) -> ()) {
        
        var models : [HomeCycleModel] = [HomeCycleModel]()
        
        let arr = [["pic": "home_banner1", "url": "https://www.baidu.com"],
                   ["pic": "home_banner2", "url": "http://www.code4app.com/"]]
        
        for dict in arr {
            let model = HomeCycleModel(dict: dict)
            models.append(model)
        }
        finishCallback(models)
    }
    
    //获取统计数据
    class func requestCountData(finishCallback : @escaping (_ result: [Int]) -> ()) {
        
        NetWorkTools.requestData(type: .get, URLString: "/kzt/default/base") { (requestData) in
            guard let data = requestData as? [String: Int] else { return }
            finishCallback([data["patient"]!, data["prescription"]!, data["comment"]!])
        }
    }
    //获取功能数据
    class func requestFuncData(finishCallback : @escaping (_ result: [HomeFuncModel]) -> ()) {
        
        var models : [HomeFuncModel] = [HomeFuncModel]()
        
        let arr = [["pic": "home_func_1", "title": "邀请患者"],
                   ["pic": "home_func_2", "title": "直接开方"],
                   ["pic": "home_func_3", "title": "群发公告"],
                   ["pic": "home_func_4", "title": "药品名录"],
                   ["pic": "home_func_5", "title": "服务设置"],
                   ["pic": "home_func_6", "title": "问诊单"],
                   ["pic": "home_func_7", "title": "常用方"],
                   ["pic": "home_func_8", "title": "坐诊信息"],
        ]
        
        for dict in arr {
            let model = HomeFuncModel(dict: dict)
            models.append(model)
        }
        finishCallback(models)
    }
   
    //获取列表数据
    class func requestListData(finishCallback : @escaping (_ result: [HomeDoctorModel]) -> ()) {
        
        var models : [HomeDoctorModel] = [HomeDoctorModel]()
        
        NetWorkTools.requestData(type: .get, URLString: "/kzt/assistant/show") { (requestData) in
            guard let data = requestData as? [String: AnyObject] else { return }
            
            let model = HomeDoctorModel()
            model.id = data["id"] as! Int
            model.age = data["age"] as! Int
            model.name = data["name"] as! String
            model.phone = data["phone"] as! String
            let sex = data["sex"] as! String
            model.sex = sex == "male" ? "男" : "女"
            models.append(model)
            finishCallback(models)

        }
    }
    
    //获取通知列表
    class func requestNotifiData(finishCallback : @escaping (_ result: [HomeNotifiModel]) -> ()) {
        
        var models : [HomeNotifiModel] = [HomeNotifiModel]()
        
        let arr = [["title": "距离活动结束还有最后10天啦！", "content": "君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。", "time": "11/11"],
                   ["title": "将进酒", "content": " 陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。", "time": "2019.1.1"]]
        
        for dict in arr {
            let model = HomeNotifiModel(dict: dict)
            models.append(model)
        }
        finishCallback(models)
        
    }
    
    //接单开关状态上传
    class func postHomeOnOff(param: [String: AnyObject]) {
        NetWorkTools.requestData(type: .post, URLString: "/kzt/default/onOff", parameters: param) { (data) in
            //数据提交成功。没有返回
        }
    }
}
