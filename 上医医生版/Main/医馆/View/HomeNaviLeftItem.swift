//
//  HomeNaviViews.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeLeftItem: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        //定义控件x:30 y:100 width:80 height:40
        let switcher = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        switcher.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.7)
        //设置开启状态显示的颜色
        switcher.onTintColor = UIColor.SY_red
        //添加状态变化监听器
        switcher.addTarget(self, action: #selector(switchDidChange(_:)), for: .valueChanged)

        if kUserDefaults.string(forKey: home_receipt) == "1" {
            switcher.isOn = true
        }else{
            switcher.isOn = false
        }
        addSubview(switcher)
        
        let label = UILabel(frame: CGRect(x: 0, y: 28, width: frame.size.width, height: 15))
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(9)
        label.text = "接单开关"
        label.textAlignment = .center
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func switchDidChange(_ sender: UISwitch){
        //打印当前值
        printLog("sender.isOn = \(sender.isOn)")
        
        ///这是监听的变化之后的值
        //false。是之前开，点击变为关，弹出确定关闭，如果点击取消，变回true
        
        if sender.isOn == false {
            let alert = HomeImageAlertView(frame: CGRect.zero, content: "关闭医馆服务，您将不再接受新线上复诊及线上咨询，请及时处理进行中的订单。", confirmTitle: "确定关闭")
            alert.valueBlock = {(flag) -> Void in
               
                sender.isOn = !flag
                //设置接单状态
                kUserDefaults.write(obj: sender.isOn == true ? "1" : "0", key: home_receipt)
                HomeDataManager.postHomeOnOff(param: ["Status": "off" as AnyObject])

            }
        }else {
            let alert = HomeImageAlertView(frame: CGRect.zero, content: "您将开启医馆服务，请及时处理收到的线上咨询或线上复诊。", confirmTitle: "确定开启")
            alert.valueBlock = {(flag) -> Void in
                
                sender.isOn = flag
                //设置接单状态
                kUserDefaults.write(obj: sender.isOn == true ? "1" : "0", key: home_receipt)
                HomeDataManager.postHomeOnOff(param: ["Status": "on" as AnyObject])

            }
        }
        
    }
}
