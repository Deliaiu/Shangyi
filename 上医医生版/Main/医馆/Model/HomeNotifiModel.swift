//
//  HomeNotifiModel.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeNotifiModel: NSObject {

    var time: String = ""
    var title: String = ""
    var content: String = ""
    
    
    init(dict: [String: Any]) {
        super.init()
            
        time = dict["time"] as! String
        title = dict["title"] as! String
        content = dict["content"] as! String
    }
}
