//
//  HomeCycleModel.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeCycleModel: NSObject {

    var pic : String = ""
    var url: String = ""
    
    init(dict: [String: Any]) {
        super.init()
        
        pic = dict["pic"] as! String
        url = dict["url"] as! String
    }
    
  
}
