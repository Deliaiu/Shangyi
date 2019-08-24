//
//  MyCardViewController.swift
//  上医医生版
//
//  Created by 姚永敏 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class MyCardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "我的名片"
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "分享", style: .plain, target: self, action: #selector(share))
    }
    
    @objc func share() {
        
        print("分享")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
