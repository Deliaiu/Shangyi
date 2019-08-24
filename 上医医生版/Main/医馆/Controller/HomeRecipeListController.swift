//
//  HomeRecipeListController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeRecipeListController: UITableViewController {

    var typeString: String = ""
    
    weak var naviController: UINavigationController?
    var dataSource = [HomeRecipeModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(headerRefresh), for: .valueChanged)
        tableView.register(HomeRecipeTableCell.self, forCellReuseIdentifier: typeString + "cell")
        tableView.tableFooterView = UIView()
        
        headerRefresh()
    }
    
    @objc func headerRefresh() {
       
        refreshControl?.beginRefreshing()
        weak var ws = self
        HomeFuncDataManager.requestRecipeListData(params: ["status" : typeString == "全部" ? "1" : "0"] , finishCallback: { (data) in
            ws?.refreshControl?.endRefreshing()
            ws?.dataSource = data
            ws?.tableView.reloadData()
        })
    }
    
    //MARK: - UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:typeString + "cell", for: indexPath) as! HomeRecipeTableCell
        cell.model = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let vc = HomeRecipeDetailController()
        naviController?.pushViewController(vc, animated: true)
    }
}



extension HomeRecipeListController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
    
    func listDidAppear() {
        printLog("listDidAppear")
    }
    
    func listDidDisappear() {
        printLog("listDidDisappear")
    }
}
