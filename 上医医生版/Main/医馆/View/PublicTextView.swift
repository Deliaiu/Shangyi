//
//  PublicTextView.swift
//  绘佳招募
//
//  Created by 刘海燕 on 2019/7/18.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class PublicTextView: UITextView , UITextViewDelegate {

    /// setNeedsDisplay调用drawRect
    var placeHolder: String = ""{
        didSet{
            self.setNeedsDisplay()
        }
    }
    //返回文字，高度block
    var valueBlock:((_ text: String) -> Void)?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        delegate = self
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        setNeedsDisplay()
        
        valueBlock?(textView.text)
    }
    
    
    override func draw(_ rect: CGRect) {
        if hasText {
            return
        }
        var newRect = CGRect()
        newRect.origin.x = 5
        newRect.origin.y = 7
        let size = placeHolder.getStringSize(rectSize: rect.size, font: self.font ?? UIFont.systemFont(ofSize: 15))
        newRect.size.width = size.width
        newRect.size.height = size.height
        /// 将placeHolder画在textView上
        (placeHolder as NSString).draw(in: newRect, withAttributes: [NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: UIColor.hexa(0x999999, 0.5)])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setNeedsDisplay()
    }
}
