//
//  MyselfMessageCell.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class MyselfMessageCell: UITableViewCell {

 
    var model: UserMeaageModel? {
        didSet {
            nameLabel.text = "郭艳芳"
            jobLabel.text = "主治医师"
            companyLabel.text = "济阳县中医医院"
            statusButton.isHidden = false
        }
    }
    
    lazy var bgImageV: UIImageView = {
        let bgv = UIImageView(image: UIImage(named: "myself_bg"))
        return bgv
    }()
    
    lazy var iconImageV: UIImageView = {
        let image = UIImageView(image: UIImage(named: "myself_placeholder"))
        return image
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal

        label.font = kFontSize(16)
        return label
    }()
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(14)
        return label
    }()
    lazy var companyLabel: UILabel = {
        let label = UILabel()

        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(14)
        return label
    }()
    lazy var statusButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "myself_renzheng"), for: .normal)
        btn.setTitle("已认证", for: .normal)
        btn.setTitleColor(UIColor.SY_Normal, for: .normal)
        btn.titleLabel?.font = kFontSize(13)
        btn.layoutButton(style: .Left, imageTitleSpace: 8)
        return btn
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        accessoryType = .disclosureIndicator
        
        contentView.addSubview(bgImageV)
        contentView.addSubview(iconImageV)
        contentView.addSubview(nameLabel)
        contentView.addSubview(jobLabel)
        contentView.addSubview(companyLabel)
        contentView.addSubview(statusButton)
        
        bgImageV.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        iconImageV.snp.makeConstraints { (make) in
            make.top.equalTo(52)
            make.left.equalTo(19)
            make.size.equalTo(CGSize(width: 65, height: 65))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageV.snp.top)
            make.left.equalTo(iconImageV.snp.right).offset(14)
            make.height.equalTo(23)
        }
        statusButton.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.top)
            make.left.equalTo(nameLabel.snp.right).offset(25)
            make.width.equalTo(100)
            make.height.equalTo(nameLabel.snp.height)
        }
        
        jobLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.right.equalTo(nameLabel.snp.right)
            make.left.equalTo(nameLabel.snp.left)
            make.height.equalTo(18)

        }
        companyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(jobLabel.snp.bottom).offset(8)
            make.left.equalTo(iconImageV.snp.right).offset(12)
            make.right.equalTo(nameLabel.snp.right)
            make.height.equalTo(18)

            make.bottom.equalTo(-20)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
