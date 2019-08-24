//
//  BaseViewController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/7/31.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

import Reachability


class BaseViewController: UIViewController {
    
    let reachability = Reachability()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //设置返回按钮
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "common_back")!.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        
        view.backgroundColor = UIColor.SY_Background

        
    }
}

//MARK： -- appear

extension BaseViewController {
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        let dele = UIApplication.shared.delegate as! AppDelegate
        dele.tabbarCtl.tabBar.isHidden = true
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

