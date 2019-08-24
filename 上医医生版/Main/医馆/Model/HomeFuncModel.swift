//
//  HomeFuncModel.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeFuncModel: NSObject {

    var pic : String = ""
    var title: String = ""
    
    init(dict: [String: Any]) {
        super.init()

        pic = dict["pic"] as! String
        title = dict["title"] as! String
    }
  
}
