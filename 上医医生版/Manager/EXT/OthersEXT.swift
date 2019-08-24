//
//  Extensions.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

 

extension UIView {
    
    func viewForController() -> UIViewController?{
       
        var next:UIView? = self
       
        repeat{
            if let nextResponder = next?.next, nextResponder is UIViewController {
                return (nextResponder as! UIViewController)
            }
            next = next?.superview
        }while next != nil
        
        return nil
    }
}

// MARK:返回className
extension NSObject
{
    var className: String{
        get{
            let name =  type(of: self).description()
            if(name.contains(".")){
                return name.components(separatedBy: ".")[1];
            }else{
                return name;
            }
        }
    }
    
}
