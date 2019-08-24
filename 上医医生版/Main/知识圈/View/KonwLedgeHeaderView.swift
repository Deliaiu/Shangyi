//
//  KonwLedgeHeaderView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class KonwLedgeHeaderView: UIView {
    
    
    lazy var imageView : UIImageView = {
        let v = UIImageView(image: UIImage(named: "zhishi_topView"))
        v.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 140 * kWidthRatio)
        return v
    }()
    
    lazy var searchView: KnowLedgeSearchView = {
        let v = KnowLedgeSearchView(frame: (CGRect(x: 18, y: 140 * kWidthRatio - 9, width: kScreenWidth - 18 - 53, height: 38)))
        return v
    }()
    
    lazy var tishiBtn: UIButton = {
        let b = UIButton(frame: CGRect(x: kScreenWidth - 50, y: 140 * kWidthRatio, width: 47, height: 31))
        b.setImage(UIImage(named: "zhishi_lingdang"), for: .normal)
        b.addTarget(self, action: #selector(tishiBtnAction), for: .touchUpInside)
        return b
    }()

    @objc func tishiBtnAction() {
        presentAlertVC(confirmBtn: nil, message: "点击了小铃铛", title: "提示", cancelBtn: "知道了", handler: { (a) in
        })
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
       
        addSubview(imageView)
        addSubview(searchView)
        addSubview(tishiBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(contentOffsetY: CGFloat) {
        var frame = imageView.frame
        frame.size.height -= contentOffsetY
        frame.origin.y = contentOffsetY
        imageView.frame = frame
    }
}




class KnowLedgeSearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.18
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 5

        let imgV = UIImageView(frame: CGRect(x: (frame.size.height - 15) / 2, y: (frame.size.height - 15) / 2, width: 15, height: 15))
        imgV.image = UIImage(named: "zhishi_search")
        addSubview(imgV)

        let textF = UITextField(frame: CGRect(x: frame.size.height, y: 0, width: frame.size.width -  frame.size.height, height:  frame.size.height))
        textF.placeholder = "搜索文章"
        textF.addTarget(self, action: #selector(textFAction(_:)), for: UIControl.Event.allEvents)
        addSubview(textF)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFAction(_ sender: UITextField) {
        //在这里处理编辑
    }
    
}

