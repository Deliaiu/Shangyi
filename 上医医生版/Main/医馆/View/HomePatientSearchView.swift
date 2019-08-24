//
//  HomePatientSearchView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomePatientSearchView: UIView {

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        let bgv = UIView(frame: CGRect(x: 15, y: 10, width: frame.size.width - 30, height: frame.size.height - 20))
        bgv.backgroundColor =  UIColor.hex(0xF7F7F7)
        bgv.layer.cornerRadius = 5
        bgv.layer.masksToBounds = true
        addSubview(bgv)
        
        let imgV = UIImageView(frame: CGRect(x: (bgv.frame.size.height - 15) / 2, y: (bgv.frame.size.height - 15) / 2, width: 15, height: 15))
        imgV.image = UIImage(named: "Patient_search")
        bgv.addSubview(imgV)
        
        let textF = UITextField(frame: CGRect(x: bgv.frame.size.height, y: 0, width: bgv.frame.size.width -  bgv.frame.size.height, height:  bgv.frame.size.height))
        textF.placeholder = "搜索姓名/备注/手机号"
        textF.addTarget(self, action: #selector(textFAction(_:)), for: UIControl.Event.allEvents)
        bgv.addSubview(textF)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFAction(_ sender: UITextField) {
        //在这里处理编辑
    }
    
}


class HomePatientHeaderView: UIView {
    
    var param: [String: Any]!
    var valueBlock:((_ param: [String: Any]) -> Void)?

    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: kScreenWidth - 30 - 118 - 30, height: 55))
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(14)
        addSubview(label)
        return label
    }()
    lazy var jiuzhenBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: kScreenWidth - 30 - 118 - 15, y: (55 - 27) / 2, width: 59, height: 27))
        btn.setBackgroundImage(UIImage(named: "patient_section_1_2"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "patient_section_1_1"), for: .selected)
        btn.tag = 10010
        btn.addTarget(self, action: #selector(jiuzhenBtnAction(_:)), for: .touchUpInside)
        addSubview(btn)
        return btn
    }()
    
    lazy var jiuzhenBtn2: UIButton = {
        let btn = UIButton(frame: CGRect(x: kScreenWidth - 30 - 59, y: (55 - 27) / 2, width: 59, height: 27))
        btn.setBackgroundImage(UIImage(named: "patient_section_2_2"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "patient_section_2_1"), for: .selected)
        btn.tag = 10011
        btn.addTarget(self, action: #selector(jiuzhenBtnAction(_:)), for: .touchUpInside)
        addSubview(btn)

        return btn
    }()
    
    @objc func jiuzhenBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.tag == 10010 {
            param["hasKeep"] = sender.isSelected
        }
        else if sender.tag == 10011 {
            param["notKeep"] = sender.isSelected
        }
        valueBlock?(param)
    }
    
    init(frame: CGRect , params: [String: Any] , count: Int) {
        super.init(frame: frame)
        
        param = params
        
        backgroundColor = UIColor.white
        
        let line = UIView(frame: CGRect(x: 0, y: (frame.size.height - 15) / 2, width: 2, height: 15))
        line.backgroundColor = UIColor.red
        addSubview(line)
        
        jiuzhenBtn.isSelected = params["hasKeep"] as! Bool
        jiuzhenBtn2.isSelected = params["notKeep"] as! Bool

        var title = "全部患者（\(String(count))人）"
        if params["hasKeep"] as! Bool  == true && params["notKeep"] as! Bool == false{
            //已就诊
            title = "已就诊患者（\(String(count))人）"
        }
        else if params["hasKeep"] as! Bool  == false && params["notKeep"] as! Bool == true{
            //已就诊
            title = "未就诊患者（\(String(count))人）"
        }
        titleLabel.text = title
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
