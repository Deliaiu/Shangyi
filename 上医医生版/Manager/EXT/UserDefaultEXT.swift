//
//  UserDefaultEXT.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/24.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation


extension UserDefaults {

    //写入
    func write(obj: Any, key: String) {
        
        self.set(obj, forKey: key)
        self.synchronize()
    }
    //清除数据
    func clear(keys: [String]) {
        
        let dics = self.dictionaryRepresentation()
        
        if keys.isEmpty == true {
            for value in dics {
                self.removeObject(forKey: value.key)
            }
        }else{
            for value in dics {
                for str in keys {
                    if value.key == str {
                        self.removeObject(forKey: value.key)
                    }
                }
            }
        }
        self.synchronize()
    }
}

