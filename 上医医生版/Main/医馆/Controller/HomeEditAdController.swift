//
//  HomeEditAdController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeEditAdController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "编辑公告"
        
        setNavi()
        
        setupUI()
        
    }
    
    func setNavi()  {
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 72, height: 44))
        btn.titleLabel?.font = kFontSize(14)
        btn.setTitle("保存并发送", for: .normal)
        btn.setTitleColor(UIColor.SY_red, for: .normal)
        btn.addTarget(self, action: #selector(itemAction), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
    }
    
    @objc func itemAction() {
        presentAlertVC(confirmBtn: nil, message: "保存并发送", title: "提示", cancelBtn: "知道了", handler: { (ac) in
        })
    }
    
    func setupUI() {
        
        let bgv = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight / 3  * 2 ))
        bgv.backgroundColor = UIColor.white
        view.addSubview(bgv)
        
        let textv = PublicTextView(frame: CGRect(x: 15, y: 15, width: kScreenWidth - 30, height: kScreenHeight / 3  * 2 - 30))
        textv.textColor = UIColor.SY_Normal
        textv.font = kFontSize(16)
        textv.placeHolder = "在此处输入文字"
        view.addSubview(textv)
        textv.valueBlock = {(text) -> Void in
            //文字在这里返回来
            printLog("textv.text = \(textv.text ?? "")")
        }
        
        let bgv2 = UIView(frame: CGRect(x: 0, y: bgv.frame.height + 10, width: kScreenWidth, height: 50))
        bgv2.backgroundColor = UIColor.white
        view.addSubview(bgv2)
        
        // 1. 创建一个属性文本
        let text = NSMutableAttributedString(string: "群发给患者" + "·本月仅可发1次")
        // 2. 为文本设置属性
        text.bs_font = kFontSize(12)
        text.bs_color = UIColor.SY_red
    
        let range: NSRange = NSRange(location: 0, length: "群发给患者".count)
        text.bs_set(font: kFontSize(15), range: range)
        text.bs_set(color: UIColor.SY_Normal, range: range)
        
        let descLabel = BSLabel(frame:CGRect(x: 15, y: 0, width: kScreenWidth - 51 - 30, height: 50))
        descLabel.attributedText = text
        bgv2.addSubview(descLabel)
        
        
        //定义控件
        let switcher = UISwitch(frame: CGRect(x: kScreenWidth - 51 - 15, y: (50 - 31 ) / 2, width: 0, height: 0))
        switcher.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        //设置开启状态显示的颜色
        switcher.onTintColor = UIColor.SY_red
        //添加状态变化监听器
        switcher.addTarget(self, action: #selector(switchDidChange(_:)), for: .valueChanged)
        bgv2.addSubview(switcher)
    }
    
    @objc func switchDidChange(_ sender: UISwitch){
        //打印当前值
        printLog("sender.isOn = \(sender.isOn)")
        
    }
}
