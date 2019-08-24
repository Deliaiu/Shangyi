//
//  HomeRecipeTableCell.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeRecipeTableCell: UITableViewCell {

    var model: HomeRecipeModel? {
        didSet {
            let age = model?.age.isEmpty == true ? "" : model!.age + "岁"
            nameLabel.text = model!.name + "        " + age
            timeLabel.text = model?.time
            statusLabel.text = model?.status == "1" ? "已支付" : "未支付"
            titleLabel.text = model?.title
            moneyLabel.text = "处方金额：" + model!.money
            descLabel.text = model?.content
        }
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(15)
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Desc
        label.font = kFontSize(15)
        label.textAlignment = .right
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(13)
        return label
    }()
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.red
        label.font = kFontSize(15)
        label.textAlignment = .right
        return label
    }()
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Desc
        label.font = kFontSize(13)
        return label
    }()
    lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(13)
        label.textAlignment = .right
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(statusLabel)

        contentView.addSubview(titleLabel)
        contentView.addSubview(moneyLabel)

        contentView.addSubview(descLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(nameLabel)
            make.size.equalTo(nameLabel.snp.size)
        }
        
        statusLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.left)
            make.right.equalTo(nameLabel.snp.right)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(statusLabel)
            make.size.equalTo(statusLabel.snp.size)
        }
        
        moneyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(statusLabel.snp.bottom).offset(13)
            make.right.bottom.equalTo(-15)
            make.height.equalTo(15)
        }
        
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(statusLabel.snp.bottom).offset(13)
            make.left.equalTo(nameLabel.snp.left)
            make.width.equalTo(kScreenWidth / 2)
            make.bottom.equalTo(descLabel.snp.bottom)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
