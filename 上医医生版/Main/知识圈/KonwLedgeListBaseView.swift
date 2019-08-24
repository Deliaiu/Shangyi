//
//  KonwLedgeListBaseView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/5.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift


class KonwLedgeListBaseView: UIView ,EmptyDataSetSource, EmptyDataSetDelegate{

    @objc public var tableView: UITableView!
    @objc public var dataSource: [String]? {
        didSet {
            if dataSource?.isEmpty == true {
            
                 tableView.emptyDataSetView({ (view) in
                    view.titleLabelString(NSAttributedString(string: ""))
                    view.detailLabelString(NSAttributedString(string: ""))
                    view.image(UIImage(named: "zhishi_empty"))
                    view.verticalOffset(-150 * kWidthRatio)
                    view.buttonTitle(NSAttributedString(string: "查看更多热门文章", attributes: [NSAttributedString.Key.font: kFontSize(14) ,NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
                })
            }
        }
    }
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    private var isHeaderRefreshed: Bool = false
    deinit {
        listViewDidScrollCallback = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame: frame, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        addSubview(tableView)
    }
    
    func beginFirstRefresh() {
        if !isHeaderRefreshed {
            self.isHeaderRefreshed = true
            self.tableView.reloadData()
        }
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.frame = self.bounds
    }
    
}

extension KonwLedgeListBaseView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isHeaderRefreshed {
            return dataSource?.count ?? 0
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource?[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.listViewDidScrollCallback?(scrollView)
    }
}

extension KonwLedgeListBaseView: JXPagingViewListViewDelegate {
    public func listView() -> UIView {
        return self
    }
    
    public func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }
    
    public func listScrollView() -> UIScrollView {
        return self.tableView
    }
}

