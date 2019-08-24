
//
//  HomeDoctorTableCell.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit
import Kingfisher


class HomeDoctorTableCell: UITableViewCell {

    var model: HomeDoctorModel! {
        didSet {
            
            loadData()
           
        }
    }
    func loadData()  {
        if model.id != 0 {
            iconImageV.image = UIImage(named: "home_placeholder_0")
        }else{
            iconImageV.image = UIImage(named: "home_placeholder_1")

        }
        nameLabel.text = model.name
        timeLabel.text = model.time
        msgLabel.text = model.message
        
        statusImageV.isHidden = model.id == 0 ? true : false

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
        label.font = kFontSize(13)
        return label
    }()
    lazy var statusImageV: UIImageView = {
        let imgV = UIImageView(image: UIImage(named: "home_status_0"))
        return imgV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconImageV)
        contentView.addSubview(nameLabel)
        contentView.addSubview(msgLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(statusImageV)
        
        iconImageV.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.size.equalTo(CGSize(width: 49, height: 49))
            make.bottom.equalTo(-18)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(iconImageV.snp.right).offset(12)
            make.height.equalTo(28)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(28)
        }
        msgLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.left.equalTo(iconImageV.snp.right).offset(12)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)
        }
        statusImageV.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(15)
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.size.equalTo(CGSize(width: 56, height: 20))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


