//
//  HomeADViewController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeADViewController: BaseViewController {
    
    //列表
    private lazy var tableView: UITableView = {
        
        let tablev = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kTabbarHeight - kNaviHeight), style: .grouped)
        tablev.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 20))
        view.addSubview(tablev)
        return tablev
    }()
    
    private lazy var headerV: HomeADHeaderView = {
        return HomeADHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 50))
    }()
    
    var dataArray = [HomeAdAboutModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "编辑公告"
        
        setUpUI()
        
        loadData()
        
    }
    
    
    func setUpUI() {
        
        tableView.tableHeaderView = headerV
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func loadData() {
        weak var ws = self
        CountDataManager.requestADListData { (data) in
            //回头数字也得赋值
            ws?.dataArray = data
            ws?.tableView.reloadData()
            
            ws?.headerV.countLabel.text = "1 / 3"
        }
        
    }
    
}

//MARK： -- table

extension HomeADViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 创建cell，并返回给tableView
        var cell: HomeAdTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "HomeAdTableViewCell") as? HomeAdTableViewCell
        if cell == nil {
            cell = HomeAdTableViewCell(style: .subtitle, reuseIdentifier: "HomeAdTableViewCell")
        }
        let model: HomeAdAboutModel = dataArray[indexPath.row]
        //去model赋值
        cell?.model = model
        
        return cell!
    }
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //TODO: -  天知道要不要加点击方法
        
    }
    
    
    //header 和 footer
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return HomeADSectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 50))
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 12))
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
}

