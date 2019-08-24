//
//  CountDataManager.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class CountDataManager: NSObject {

    //获取患者数据
    class func requestPatientListData(param: [String: AnyObject], finishCallback : @escaping (_ total: [HomePatientModel], _ new: [HomePatientModel]) -> ()) {
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)

        var totalmodels : [HomePatientModel] = [HomePatientModel]()
        var newmodels : [HomePatientModel] = [HomePatientModel]()

        
        NetWorkTools.requestData(type: .get, URLString: "/kzt/patient/list", parameters: param) { (requestData) in
            print(requestData)
            if let totaldata = requestData["totalData"] as? [[String: AnyObject]] {
                for dict in totaldata {
                    let model = HomePatientModel(dict: dict)
                    totalmodels.append(model)
                }
            }
            if let newData = requestData["newData"] as? [[String: AnyObject]] {
                for dict in newData {
                    let model = HomePatientModel(dict: dict)
                    newmodels.append(model)
                }
            }
            finishCallback(totalmodels, newmodels)
        }
    }
    
    //获取公告数据
    class func requestADListData(finishCallback : @escaping (_ result: [HomeAdAboutModel]) -> ()) {
        
        var models : [HomeAdAboutModel] = [HomeAdAboutModel]()
        
        let arr = [["status": "1" ,"name" : "赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一赵一", "time": "11/11 扫码关注"],
                   [ "status": "1" ,"name" : "孙三", "time": "02/22 扫码关注"],
                   ["status": "0" ,"name" : "李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四李四四", "time": "03/03 扫码关注"],
                   ["status": "1" ,"name" : "张五", "time": "2019/04/07 扫码关注"]]
        
        for dict in arr {
            let model = HomeAdAboutModel(dict: dict)
            models.append(model)
        }
        finishCallback(models)
    }
}
