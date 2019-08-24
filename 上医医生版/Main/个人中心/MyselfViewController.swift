//
//  MyselfViewController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class MyselfViewController: BaseViewController {

    private var dataArray = [["", "我的收益", "百宝箱" ], ["安全设置"], ["常见问题", "联系客服"]]
    private var imageArray = [["", "myself_shouyi", "myself_xiang" ], ["myself_shezhi"], ["myself_wenti", "myself_kefu"]]


    //列表
    private lazy var tableView: UITableView = {

        let tablev = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNaviHeight), style: .grouped)
        tablev.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 0.01))
        tablev.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 20))
        view.addSubview(tablev)
        tablev.register(MyselfMessageCell.self, forCellReuseIdentifier:  "messageCell")
        tablev.register(MyselfTableViewCell.self, forCellReuseIdentifier:  "cell")

        return tablev
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()

        loadData()

    }


    func setUpUI() {

        tableView.delegate = self
        tableView.dataSource = self

    }

    func loadData() {

    }
}


//MARK： -- table

extension MyselfViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else if section == 1 {
            return 1
        }else if section == 2 {
            return 2
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MyselfMessageCell
            cell.model = UserMeaageModel(dict: [:])
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyselfTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.iconImageV.image = UIImage(named: imageArray[indexPath.section][indexPath.row])
        cell.nameLabel.text = dataArray[indexPath.section][indexPath.row]
        return cell
    }
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        //TODO: -  天知道要不要加点击方法
    }
    //header 和 footer
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        return UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 0.01))
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 12))
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
}



//MARK： -- appear

extension MyselfViewController {

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)

        let tabBarController = self.tabBarController as! MainTabBarController
        tabBarController.tabBar.isHidden = false

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
