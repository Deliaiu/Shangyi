//
//  HomePatientManagerVC.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomePatientManagerVC: BaseViewController {
    
    private var params: [String: Any] = ["searchParam" : "", "hasKeep": true, "notKeep": true]
    private var dataArray = [HomePatientModel]()
    private var newArray = [HomePatientModel]()

    //列表
    private lazy var tableView: UITableView = {
        
        let tablev = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNaviHeight), style: .grouped)
        tablev.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 20))
        tablev.sectionIndexColor = UIColor.SY_Desc
        view.addSubview(tablev)
        return tablev
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "患者管理"
        
        setUpUI()
        
        loadData()
        
    }

    
    func setUpUI() {
        
        tableView.tableHeaderView = HomePatientSearchView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 56))
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func loadData() {
        weak var ws = self
        CountDataManager.requestPatientListData(param: params as [String : AnyObject]) { (total, new) in
            //回头数字也得赋值
            ws?.dataArray = total
            ws?.newArray = new
            ws?.tableView.reloadData()
        }
    }
}


//MARK： -- table

extension HomePatientManagerVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            // 创建cell，并返回给tableView
            var cell: HomePatientNumCell? = tableView.dequeueReusableCell(withIdentifier: "HomePatientNumCell") as? HomePatientNumCell
            if cell == nil {
                cell = HomePatientNumCell(style: .subtitle, reuseIdentifier: "HomePatientNumCell")
            }
            cell?.countLabel.text = "新增患者（\(newArray.count)人）"
            
            return cell!
            
        }else{
          
            // 创建cell，并返回给tableView
            var cell: HomePatientTableCell? = tableView.dequeueReusableCell(withIdentifier: "HomePatientTableCell") as? HomePatientTableCell
            if cell == nil {
                cell = HomePatientTableCell(style: .subtitle, reuseIdentifier: "HomePatientTableCell")
            }
            let model: HomePatientModel = dataArray[indexPath.row]
            //去model赋值
            cell?.model = model
            
            return cell!
        }
    }
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //TODO: -  天知道要不要加点击方法
        
    }
    
    
    //添加右侧索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var indexes=[String]()
        for i in 0...25
        {
            let ch = String(format: "%c",i+65)
            indexes.append(ch)
        }
        return indexes
    }
   
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    //header 和 footer
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let v = HomePatientHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 55), params: params, count: dataArray.count)
            weak var ws = self
            v.valueBlock = {(dic) -> Void in
                ws?.params = dic
                ws?.loadData()
            }
            return v
        }
        return UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 0.01))
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 55
        }
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 12))
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
}

