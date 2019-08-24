//
//  HomeADHeaderView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeADHeaderView: UIView {

    lazy var countLabel: UILabel = {
       
        let label = UILabel(frame: CGRect(x: kScreenWidth - 100 - 15, y: 0, width: 100, height: 40))
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(15)
        label.textAlignment = .right
        addSubview(label)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.SY_Background
        
        let v = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 40))
        v.backgroundColor = UIColor.white
        addSubview(v)
        
        let titleLabel =  UILabel(frame: CGRect(x:15, y: 0, width: kScreenWidth / 2, height: 40))
        titleLabel.textColor = UIColor.SY_Normal
        titleLabel.text = "本月群发次数"
        titleLabel.font = kFontSize(15)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class HomeADSectionView: UIView {
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        let line = UIView(frame: CGRect(x: 0, y: (frame.size.height - 15) / 2, width: 2, height: 15))
        line.backgroundColor = UIColor.red
        addSubview(line)
        
        let titleLabel =  UILabel(frame: CGRect(x: 15, y: 0, width: kScreenWidth / 2, height: frame.size.height))
        titleLabel.textColor = UIColor.SY_Normal
        titleLabel.text = "我的公告栏"
        titleLabel.font = kFontBoldSize(16)
        addSubview(titleLabel)
        
        let addBtn = UIButton(frame: CGRect(x: kScreenWidth - 50 - 15, y: (frame.size.height - 21) / 2, width: 50, height: 21))
        addBtn.setTitle("添加", for: .normal)
        addBtn.setTitleColor(UIColor.SY_red, for: .normal)
        addBtn.backgroundColor = UIColor.hex(0xF7E6E9)
        addBtn.titleLabel?.font = kFontSize(13)
        addBtn.layer.cornerRadius = 21 / 2
        addBtn.addTarget(self, action: #selector(addBtnAction), for: .touchUpInside)
        addSubview(addBtn)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addBtnAction() {
        let vc = HomeEditAdController()
        viewForController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
