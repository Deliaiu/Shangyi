//
//  HomeNumCountView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeNumCountView: UIView {

    var nums  = [Int]() {
        
        didSet {
            if nums.count == 3 {
                
                patientButton.setAttributedTitle(loadAttributeString(num: String(nums[0]), type: "患者"), for: .normal)
                prescriptionButton.setAttributedTitle(loadAttributeString(num: String(nums[1]), type: "处方"), for: .normal)
                evaluateButton.setAttributedTitle(loadAttributeString(num: String(nums[2]), type: "评价"), for: .normal)
            
            }else{
                patientButton.setAttributedTitle(loadAttributeString(num: "0", type: "患者"), for: .normal)
                prescriptionButton.setAttributedTitle(loadAttributeString(num: "0", type: "处方"), for: .normal)
                evaluateButton.setAttributedTitle(loadAttributeString(num: "0", type: "评价"), for: .normal)
            }
        }
    }
    
    lazy var patientButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: kScreenWidth / 3, height: 72))
        btn.titleLabel?.numberOfLines = 0
        btn.tag = 10010
        btn.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        addSubview(btn)
        return btn
    }()
    
    lazy var prescriptionButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: kScreenWidth / 3, y: 0, width: kScreenWidth / 3, height: 72))
        btn.titleLabel?.numberOfLines = 0
        btn.tag = 10011
        btn.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        addSubview(btn)
        return btn
    }()
    lazy var evaluateButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: kScreenWidth / 3 * 2, y: 0, width: kScreenWidth / 3, height: 72))
        btn.titleLabel?.numberOfLines = 0
        btn.tag = 10012
        btn.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        addSubview(btn)
        return btn
    }()
    
    @objc func buttonAction(_ sender: UIButton) {
        
        if sender.tag == 10010 {
            //患者
            let vc = HomePatientManagerVC()
            viewForController()?.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 10011 {
            //处方
            let vc = HomeRecipelManagerVC()
            viewForController()?.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 10012 {
            //评价
            let vc = HomeEvaluateManagerVC()
            viewForController()?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white

        layer.borderColor = UIColor.SY_line.cgColor
        layer.borderWidth = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadAttributeString(num: String, type: String) -> NSMutableAttributedString {
        
        let text = NSMutableAttributedString(string: num + "\n" + type)
        text.bs_font = kFontSize(13)
        text.bs_color = UIColor.SY_Desc
        text.bs_lineSpacing = 5
    
        
        let range: NSRange = NSRange(location: 0, length: num.count)
        text.bs_set(font: kFontBoldSize(18), range: range)
        text.bs_set(color: UIColor.SY_Normal, range: range)
        text.bs_set(alignment: .center, range: range)
        
        return text
    }
}


