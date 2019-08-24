//
//  HomeRecipeModel.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeRecipeModel: NSObject {

    
    var name : String = ""
    var status: String = ""
    var time: String = ""
    var money: String = ""
    var title: String = ""
    var content: String = ""
    var age: String = ""
    
    
    init(dict: [String: Any]) {
        super.init()
        
        name = dict["name"] as! String
        status = dict["status"] as! String
        time = dict["time"] as! String
        money = dict["money"] as! String
        title = dict["title"] as! String
        content = dict["content"] as! String
        age = dict["age"] as! String
    }
}
