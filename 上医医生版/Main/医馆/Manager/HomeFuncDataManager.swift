//
//  HomeFuncDataManager.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeFuncDataManager: NSObject {

    //获取处方列表
    class func requestRecipeListData(params: [String: String] ,finishCallback : @escaping (_ result: [HomeRecipeModel]) -> ()) {
        
        var models : [HomeRecipeModel] = [HomeRecipeModel]()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
            let arr = [["title": "药方名字", "money": "12.34", "content": "哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或", "status": "1" ,"name" : "赵一", "time": "11/11", "age" : ""],
                       ["title": "药方名字","money": "23", "content": "哈哈哈哈哈哈而是人家忒热；WIR哈或", "status": "0" ,"name" : "赵二", "time": "2019.1.1","age" : "33"],
                       ["title": "","money": "348元", "content": "哈违约骗人我们当初别的，二位东方购物任何物品热死人五人或", "status": "1" ,"name" : "赵三", "time": "02/22","age" : ""],
                       ["title": "","money": "2.45元", "content": "额惹我你；任何；梁静茹；了客家人", "status": "0" ,"name" : "赵四四四四四四", "time": "03/03" ,"age" : ""],
                       ["title": "药方名字","money": "10.44元", "content": "让我如额外；浪费几颗；开发人偶我就", "status": "1" ,"name" : "赵五", "time": "04/07" ,"age" : "22"],
                       ["title": "药方名字", "money": "12.34", "content": "哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或", "status": "1" ,"name" : "赵一", "time": "11/11", "age" : ""],
            ]
            
            for dict in arr {
                let model = HomeRecipeModel(dict: dict)
                if params["status"] == "0" {
                    if model.status == "0" {
                        models.append(model)
                    }
                }else{
                    models.append(model)
                }
            }
            finishCallback(models)
        }
    }
    
    //获取评价列表
    class func requestEvaluateData(params: [String: String] ,finishCallback : @escaping (_ result: [HomeEvaluateModel]) -> ()) {
        
        var models : [HomeEvaluateModel] = [HomeEvaluateModel]()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
            let arr: [[String: String]] = []
                        
            for dict in arr {
                let model = HomeEvaluateModel(dict: dict)
                models.append(model)
            }
            finishCallback(models)
        }
    }
}
