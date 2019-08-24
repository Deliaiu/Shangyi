
//
//  HomePatientTableCell.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit
import Kingfisher



class HomePatientTableCell: UITableViewCell {


    var model: HomePatientModel! {
        didSet {
           loadData()
        }
    }
    func loadData() {
        if kStringIsEmpty(model.img as AnyObject) == false {
            iconImageV.kf.setImage(with: ImageResource(downloadURL: URL(string: model.img)!), placeholder: UIImage(named: "home_placeholder_2"))
        }else{
            iconImageV.image = UIImage(named: "home_placeholder_2")
        }
        nameLabel.text = model.name
        if model.phone.isPhoneNumber() == false {
            msgLabel.text = "未完善信息"
        }else{
            
            let startIdx = model.phone.index(model.phone.startIndex, offsetBy: 3)
            let endIdx = model.phone.index(startIdx, offsetBy: 3)
            let result = model.phone.replacingCharacters(in: startIdx...endIdx, with: "****")
            msgLabel.text = result
        }
        let arr = model.gmtCreate.components(separatedBy: "T")
        timeLabel.text = arr[0]

    }
    lazy var iconImageV: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(15)
        return label
    }()
    lazy var msgLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Desc
        label.font = kFontSize(14)
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Desc
        label.textAlignment = .right
        label.font = kFontSize(15)
        return label
    }()
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconImageV)
        contentView.addSubview(nameLabel)
        contentView.addSubview(msgLabel)
        contentView.addSubview(timeLabel)
        
        iconImageV.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.size.equalTo(CGSize(width: 49, height: 49))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(iconImageV.snp.right).offset(12)
            make.height.equalTo(28)
        }
        msgLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.left.equalTo(iconImageV.snp.right).offset(12)
            make.height.equalTo(18)
            make.bottom.equalTo(-15)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(msgLabel.snp.top)
            make.right.equalTo(-15)
            make.height.equalTo(msgLabel.snp.height)
        }
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class HomePatientNumCell: UITableViewCell {
    
    
    lazy var iconImageV: UIImageView = {
        let image = UIImageView(image: UIImage(named: "patient_new"))
        return image
    }()
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(18)
        return label
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(iconImageV)
        contentView.addSubview(countLabel)
       
        iconImageV.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.size.equalTo(CGSize(width: 36, height: 36))
            make.bottom.equalTo(-15)
        }
        countLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(iconImageV.snp.right).offset(13)
        }
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
