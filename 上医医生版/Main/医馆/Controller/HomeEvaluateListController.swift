//
//  HomeEvaluateListController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift


class HomeEvaluateListController: UITableViewController ,EmptyDataSetSource, EmptyDataSetDelegate {

    var typeString: String = ""
    
    weak var naviController: UINavigationController?
    var dataSource = [HomeEvaluateModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(headerRefresh), for: .valueChanged)
        tableView.register(HomeEvaluateCell.self, forCellReuseIdentifier: typeString + "cell")
        tableView.tableFooterView = UIView()
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
        headerRefresh()
    }
    
    @objc func headerRefresh() {
        
        refreshControl?.beginRefreshing()
        weak var ws = self
        HomeFuncDataManager.requestEvaluateData(params: ["status" : "1"] , finishCallback: { (data) in
            ws?.refreshControl?.endRefreshing()
            ws?.dataSource = data
            
            if data.isEmpty == true {
                ws?.tableView.emptyDataSetView({ (view) in
                    view.titleLabelString(NSAttributedString(string: ""))
                    view.detailLabelString(NSAttributedString(string: ""))
                    view.image(UIImage(named: "evaluate_empty"))
                    view.verticalOffset(-88 * kWidthRatio)
                })
            }
            
            ws?.tableView.reloadData()
        })
    }
    
    //MARK: - UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: typeString + "cell", for: indexPath) as! HomeEvaluateCell
        cell.model = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)        
    }


}




extension HomeEvaluateListController: JXSegmentedListContainerViewListDelegate {
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
