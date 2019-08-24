//
//  HomeNotifiViewController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeNotifiViewController: BaseViewController {

    var dataArray = [HomeNotifiModel]()
    
    lazy var tableView: UITableView = {
        
        let tablev = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .plain)
        tablev.backgroundColor = UIColor.SY_Background
        tablev.separatorStyle = .none
        tablev.register(HomeNotifiTableCell.self, forCellReuseIdentifier: "cell")
     
        return tablev
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "平台通知"
        
        //配置UI
        setUpUI()
        
        getData()
    }
    
    //配置UI
    func setUpUI() {
        
        //tablev
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }
    
    //获取数据
    @objc func getData() {
        weak var ws = self
        HomeDataManager.requestNotifiData { (data) in
            ws?.dataArray = data
            ws?.tableView .reloadData()
        }
    }
}


extension HomeNotifiViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Table dele
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 创建cell，并返回给tableView
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! HomeNotifiTableCell
        cell.model = dataArray[indexPath.row]
        return cell
    }
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
