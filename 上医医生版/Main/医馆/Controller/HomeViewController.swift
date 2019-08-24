//
//  HomeViewController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    //轮播
    private lazy var cycleView : HomeHeaderCycleView = {
        let cycleView = HomeHeaderCycleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 140 * kWidthRatio))        
        return cycleView
    }()
    //数据
    private lazy var countView : HomeNumCountView = {
        let v = HomeNumCountView(frame: CGRect(x: 0, y: 140 * kWidthRatio, width: kScreenWidth, height: 72))
        v.nums = []
        return v
    }()
    //功能
    private lazy var funcView: HomeFunctionView = {
        let v = HomeFunctionView(frame: CGRect(x: 0, y: 140 * kWidthRatio + 72, width: kScreenWidth, height: 180))
        return v
    }()
    
    //列表
    private lazy var tableView: UITableView = {
        
        let tablev = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kTabbarHeight - kNaviHeight), style: .grouped)
        tablev.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 20))
        view.addSubview(tablev)
        return tablev
    }()
    
    private var dataArray = [HomeDoctorModel](){
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavi()
        
        setUpUI()
        
        loadData()

    }
    
    func setNavi() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: HomeLeftItem(frame: CGRect(x: 0, y: 0, width: 50, height: 44)))
        navigationItem.titleView = UIImageView(image: UIImage(named:  "home_title"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_item_right")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(rightItemAction))
    }
    @objc func rightItemAction(){
        //todo
        let vc = HomeNotifiViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpUI() {
        
        let v = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 140 * kWidthRatio + 72 + 180))
        v.addSubview(cycleView)
        v.addSubview(countView)
        v.addSubview(funcView)
        tableView.tableHeaderView = v

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func loadData() {
        
        //创建 Group
        let dispatchGroup = DispatchGroup()
        
        weak var ws = self
        
        //进入组
        dispatchGroup.enter()
        HomeDataManager.requestCycleData { (data) in
            ws?.cycleView.cycleModels = data
            //离开组
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        HomeDataManager.requestCountData { (data) in
            ws?.countView.nums = data
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        HomeDataManager.requestFuncData { (data) in
            ws?.funcView.models = data
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        HomeDataManager.requestListData { (data) in
            ws?.dataArray = data
            let model = HomeDoctorModel()
            model.name = "平台药师"
            model.message = "您可在此处查看您提交的拍照，电话开方"
            ws?.dataArray.insert(model, at: 0)
            dispatchGroup.leave()
        }
    }

}

//MARK： -- table

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 创建cell，并返回给tableView
        var cell: HomeDoctorTableCell? = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeDoctorTableCell
        if cell == nil {
            cell = HomeDoctorTableCell(style: .subtitle, reuseIdentifier: "cell")
        }
        let model: HomeDoctorModel = dataArray[indexPath.row]
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
        return UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 12))
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 12))
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }

}




//MARK： -- appear

extension HomeViewController {
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        let tabBarController = self.tabBarController as! MainTabBarController
        tabBarController.tabBar.isHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
