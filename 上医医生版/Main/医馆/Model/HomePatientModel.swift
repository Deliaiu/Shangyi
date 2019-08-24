//
//  HomePatientModel.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomePatientModel: NSObject {

    
    var name : String = ""
    var status: String = ""
    var phone: String = ""
    var img : String = ""
    var gmtCreate: String = ""
    var gmtModify:String = ""
    var id: Int = 0
    var source: String = ""
    var remark: String = ""
    
    init(dict: [String: Any]) {
        super.init()
        
        id = dict["id"] as! Int
        name = dict["name"] as! String
        status = dict["status"] as! String
        phone = dict["phone"] as! String
        gmtCreate = dict["gmtCreate"] as! String
        gmtModify = dict["gmtModify"] as! String
        source = dict["source"] as! String
        remark = dict["remark"] as! String
        img = dict["img"] as? String ?? ""
    }
}

