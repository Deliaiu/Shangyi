//
//  UIButtonEXT.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/24.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import Foundation


//MARK: -定义button相对label的位置
enum ButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}

extension UIButton {
    
    func layoutButton(style: ButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = imageView?.frame.size.width
        let imageHeight = imageView?.frame.size.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        
        labelWidth = titleLabel?.intrinsicContentSize.width
        labelHeight = titleLabel?.intrinsicContentSize.height
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imagEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .Top:
            imagEdgeInsets = UIEdgeInsets(top: -labelHeight - imageTitleSpace / 2, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -imageHeight! - imageTitleSpace / 2, right: 0)
        case .Left:
            imagEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpace / 2, bottom: 0, right: imageTitleSpace)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpace / 2, bottom: 0, right: -imageTitleSpace / 2)
        case .Bottom:
            imagEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight! - imageTitleSpace / 2, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight! - imageTitleSpace / 2, left: -imageWidth!, bottom: 0, right: 0)
        case .Right:
            imagEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + imageTitleSpace / 2, bottom: 0, right: -labelWidth - imageTitleSpace / 2)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth! - imageTitleSpace / 2, bottom: 0, right: imageWidth! + imageTitleSpace / 2)
        }
        titleEdgeInsets = labelEdgeInsets
        imageEdgeInsets = imagEdgeInsets
    }
}
