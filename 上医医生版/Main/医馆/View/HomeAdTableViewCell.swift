//
//  HomeAdTableViewCell.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeAdTableViewCell: UITableViewCell {

    var model: HomeAdAboutModel? {
        didSet {
            statusImageV.isHidden = model?.status == "1" ? true : false
            nameLabel.text = model?.name
            timeLabel.text = model?.time
            
        }
    }
    
    lazy var statusImageV: UIImageView = {
        let image = UIImageView(image: UIImage(named: "home_Ad_status"))
        return image
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(15)
        label.numberOfLines = 0
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Desc
        label.font = kFontSize(15)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(statusImageV)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        
        statusImageV.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.right.equalTo(-32 - 10)
        }
      
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.right.equalTo(nameLabel.snp.right)
            make.left.equalTo(nameLabel.snp.left)
            make.bottom.equalTo(-15)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

