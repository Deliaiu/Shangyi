//
//  BaseWebController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/9.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit
import WebKit

class BaseWebController: BaseViewController {

    var webUrl: String = "" {
        didSet {
            // load url
            if webUrl.isEmpty == false {
                webView.load(URLRequest(url:URL(string: webUrl)!))
            }
        }
    }
    var webView: WKWebView = WKWebView()
    var progressView:UIProgressView = UIProgressView()
    var closeBtn: UIButton!
    
    
    deinit {
        webView.removeObserver(self, forKeyPath:"estimatedProgress")
        webView.navigationDelegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        }else{
            automaticallyAdjustsScrollViewInsets = false
        }
      
        webView.addObserver(self, forKeyPath:"estimatedProgress", options: NSKeyValueObservingOptions.new, context:nil)
        webView.navigationDelegate = self
        // webview
        view.addSubview(webView)
        webView.snp.makeConstraints { (make)in
            make.width.height.equalToSuperview()
        }
        
        // progressview
        view.addSubview(progressView)
        progressView.snp.makeConstraints { (make)in
            make.top.width.left.right.equalToSuperview()
            make.height.equalTo(2)
        }
        progressView.tintColor = UIColor.SY_red
        progressView.trackTintColor = UIColor.clear
        progressView.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated:Bool) {
        super.viewWillDisappear(animated)
        
        //清除web缓存
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), completionHandler: { (records) in
            for record in records{
                //清除本站的cookie
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {
                })
            }
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            
            progressView.isHidden = false
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            printLog("progress = \(webView.estimatedProgress)")
        }
    }
}

extension BaseWebController: WKNavigationDelegate{
    
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        title = "加载中..."
        /// 获取网页的progress
        progressView.progress = 0.0
    }
    // 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        
        
    }
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        /// 获取网页title
        title = webView.title
        progressView.progress = 1.0
        progressView.isHidden = true
    }
    // 页面加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        
        progressView.progress = 0.0
        progressView.isHidden = true
        //只有一个按钮的弹窗
        presentAlertVC(confirmBtn: "重新加载", message: "页面加载失败", title: "提示", cancelBtn: "", handler: { (actin) in
            webView .reload()
        })
    }

}
