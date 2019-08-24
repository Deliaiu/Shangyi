//
//  BaseVCEXT.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/24.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation

extension BaseViewController {
    
    static func topViewController(_ viewController: UIViewController? = nil) -> UIViewController? {
        let viewController = viewController ?? UIApplication.shared.keyWindow?.rootViewController
        
        if let navigationController = viewController as? UINavigationController,
            !navigationController.viewControllers.isEmpty
        {
            return self.topViewController(navigationController.viewControllers.last)
            
        } else if let tabBarController = viewController as? UITabBarController,
            let selectedController = tabBarController.selectedViewController
        {
            return self.topViewController(selectedController)
            
        } else if let presentedController = viewController?.presentedViewController {
            return self.topViewController(presentedController)
            
        }
        
        return viewController
    }
}
