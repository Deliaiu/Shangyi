//
//  HomeAdAboutModel.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeAdAboutModel: NSObject {

    var name : String = ""
    var status: String = ""
    var time: String = ""
    
    
    init(dict: [String: Any]) {
        super.init()
        
        name = dict["name"] as! String
        status = dict["status"] as! String
        time = dict["time"] as! String
    }
}
