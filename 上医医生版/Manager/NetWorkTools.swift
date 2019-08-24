//
//  NetWorkTools.swift
//  绘佳健康
//
//  Created by 刘海燕 on 2019/8/6.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation
import Alamofire


struct HTTPAPI {
    // 设置公共域名或者Ip
    static let  hostName = "http://www.kztyycloud.cn"
}

enum MethodType {
    case get
    case post
}

class NetWorkTools {
    
    class func requestData(type: MethodType, URLString: String, parameters: [String : Any]? = nil, finishCallback: @escaping (_ result: AnyObject) -> ()) {
        
        let  httpUrl = HTTPAPI.hostName + URLString
        
        // 设置公共请求参数
        var updict = parameters == nil ? [String: Any]() : parameters
        updict?["token"] = "9ab796f2af5528545ddf515938d10d84"
        
        //1. 获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        //2. 发送请求
        Alamofire.request(httpUrl, method: method, parameters: updict).responseJSON { (response) in
            
            //去掉loding
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(NVActivityIndicatorView.DEFAULT_FADE_OUT_ANIMATION)

            switch response.result {
            case .success:
                //3. 获取数据
                guard let result = response.result.value else { return }
                guard let resultDict = result as? [String : AnyObject] else { return }
                
                let code = resultDict["code"] as! Int
                if code == 0 {
                    //成功
                    //4. 将结果返回
                    finishCallback(resultDict["data"] as AnyObject)
                }
                else{
                    presentAlertVC(confirmBtn: nil, message: resultDict["message"] as! String, title: "提示", cancelBtn: "知道了", handler: { (actin) in
                    })
                }
             

            case .failure:
                //只有一个按钮的弹窗
                presentAlertVC(confirmBtn: nil, message: "网络请求失败", title: "提示", cancelBtn: "知道了", handler: { (actin) in
                })
            }
            
        }
    }
}
