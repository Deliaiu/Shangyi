//
//  MyselfTableViewCell.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class MyselfTableViewCell: UITableViewCell {

   
    lazy var iconImageV: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(16)
        return label
    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(iconImageV)
        contentView.addSubview(nameLabel)
    
        
        iconImageV.snp.makeConstraints { (make) in
            make.top.left.equalTo(17)
            make.size.equalTo(CGSize(width: 18, height: 18))
            make.bottom.equalTo(-17)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(iconImageV)
            make.left.equalTo(iconImageV.snp.right).offset(15)
            make.right.equalTo(-30)
        }
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
