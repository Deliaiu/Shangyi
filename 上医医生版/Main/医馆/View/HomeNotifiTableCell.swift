//
//  HomeNotifiTableCell.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeNotifiTableCell: UITableViewCell {

    var model: HomeNotifiModel? {
        didSet {
            titleLabel.text = model?.title
            contentLabel.text = model?.content
            timeLabel.text = model?.time
        }
    }
    
    
    
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        v.layer.borderColor = UIColor.SY_line.cgColor
        v.layer.borderWidth = 0.5
        v.layer.cornerRadius = 6
        v.layer.masksToBounds = true
        return v
    }()
    
    lazy var imageV: UIImageView = {
        let v = UIImageView(image: UIImage(named: "home_notifi"))
        return v
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(15)
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Normal
        label.font = kFontSize(14)
        label.numberOfLines = 0
        return label
    }()
    lazy var line: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.SY_line
        return v
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.SY_Desc
        label.font = kFontSize(14)
        return label
    }()
    
    lazy var moreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("查看更多 >", for: .normal)
        btn.setTitleColor(UIColor.SY_Desc, for: .normal)
        btn.titleLabel?.font = kFontSize(15)
        btn.addTarget(self, action: #selector(moreBtnAction), for: .touchUpInside)
        btn.contentHorizontalAlignment = .right
        return btn
    }()
    
    @objc func moreBtnAction() {
        
        presentAlertVC(confirmBtn: nil, message: "点击了查看更多", title: "提示", cancelBtn: "知道了", handler: { (a) in
        })
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = UIColor.SY_Background
        
        contentView.addSubview(bgView)
        bgView.addSubview(imageV)
        bgView.addSubview(titleLabel)
        bgView.addSubview(contentLabel)
        bgView.addSubview(line)
        bgView.addSubview(timeLabel)
        bgView.addSubview(moreBtn)
        
        
        bgView.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-3)
        }
        imageV.snp.makeConstraints { (make) in
            make.top.left.equalTo(13)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.top)
            make.left.equalTo(48)
            make.right.equalTo(-15)
            make.bottom.equalTo(imageV.snp.bottom)
        }
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(14)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(0.5)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(line.snp.bottom)
            make.height.equalTo(42)
            make.bottom.equalTo(0)
        }
        moreBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(timeLabel.snp.edges)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
