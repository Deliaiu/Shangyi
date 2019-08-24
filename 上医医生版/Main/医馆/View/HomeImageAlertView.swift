//
//  HomeImageAlertView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeImageAlertView: UIView {

    var valueBlock:((_ flag: Bool) -> Void)?

    //背景
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 4
        addSubview(v)
        return v
    }()
    
    init(frame: CGRect, content: String, confirmTitle: String) {
        super.init(frame: frame)
        
        let window = UIApplication.shared.keyWindow
        let frm = window!.bounds
        self.frame = frm
        window?.addSubview(self)
        isUserInteractionEnabled = true
        backgroundColor = UIColor.rgba(0, 0, 0, 0.4)
        
    
        // 1. 创建一个属性文本
        let text = NSMutableAttributedString(string: content)
        // 2. 为文本设置属性
        text.bs_font = kFontSize(16)
        text.bs_color = UIColor.SY_Normal
        text.bs_lineSpacing = 7
        
        let containersize = CGSize(width: kScreenWidth - 40 * kWidthRatio - 40, height: CGFloat.greatestFiniteMagnitude)
        let container = TextContainer()
        container.size = containersize
        guard let layout = TextLayout(container: container, text: text) else {
            return
        }

        bgView.frame = CGRect(x: 0, y: kScreenHeight, width: kScreenWidth - 40 * kWidthRatio, height: (15 + 88) + (13 + layout.textBoundingSize.height) + 30 + 50)
        
        let imageV = UIImageView(frame: CGRect(x: (kScreenWidth - 40 * kWidthRatio - 126) / 2, y: 15, width: 126, height: 88))
        imageV.image = UIImage(named: "home_alert_Image")
        bgView.addSubview(imageV)
        
        let descLabel = BSLabel(frame:CGRect(x: CGFloat(20), y: imageV.frame.origin.y + imageV.frame.size.height + 13, width: kScreenWidth - 40 * kWidthRatio - 40, height: layout.textBoundingSize.height))
        descLabel.attributedText = text
        descLabel.numberOfLines = 0
        bgView.addSubview(descLabel)
        
        //取消
        let cancelBtn = UIButton(frame: CGRect(x: 0, y: bgView.frame.size.height-50, width: bgView.frame.size.width / 2, height: 50))
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(UIColor.SY_Normal, for: .normal)
        cancelBtn.titleLabel?.font = kFontSize(17)
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
        bgView.addSubview(cancelBtn)
        //confirm
        let confirmBtn = UIButton(frame: CGRect(x: bgView.frame.size.width / 2, y: bgView.frame.size.height-50, width: bgView.frame.size.width / 2, height: 50))
        confirmBtn.setTitle(confirmTitle, for: .normal)
        confirmBtn.setTitleColor(UIColor.SY_HidGold, for: .normal)
        confirmBtn.titleLabel?.font = kFontSize(17)
        confirmBtn.addTarget(self, action: #selector(confirmBtnAction), for: .touchUpInside)
        bgView.addSubview(confirmBtn)
        
        let line = UIView(frame: CGRect(x: 0, y: cancelBtn.frame.origin.y, width: bgView.frame.size.width, height: 0.8))
        line.backgroundColor = UIColor.SY_line
        bgView.addSubview(line)
        
        let line2 = UIView(frame: CGRect(x: bgView.frame.size.width / 2, y: cancelBtn.frame.origin.y, width: 0.8, height: 50))
        line2.backgroundColor = UIColor.SY_line
        bgView.addSubview(line2)
        
        
        show()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func cancelBtnAction(){
        remove()
        valueBlock?(false)
    }
    
    @objc func confirmBtnAction() {
        remove()
        valueBlock?(true)
    }
    
    func show() {
        //动画
        bgView.center = center
        bgView.alpha = 0
        bgView.transform = CGAffineTransform.init(scaleX: 0.2, y: 0.3)
        UIView.animate(withDuration: 0.2) {
            self.bgView.transform = CGAffineTransform.identity
            self.bgView.alpha = 1
        }
    }
    func remove() {
        UIView.animate(withDuration: 0.2, animations: {
            self.bgView.transform = CGAffineTransform.init(scaleX: 0.2, y: 0.3)
            self.bgView.alpha = 0
        }) { (b) in
            self.bgView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
}
