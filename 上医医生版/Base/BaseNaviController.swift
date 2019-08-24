//
//  BaseNaviController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class BaseNaviController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        navigationBar.barTintColor = UIColor.HJ_Orange // 背景色
        
        navigationBar.tintColor = UIColor.SY_Normal //字体颜色
        navigationBar.isTranslucent = false


    }
    

    
    /// 重写此方法让 preferredStatusBarStyle 响应
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
