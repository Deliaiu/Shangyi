//
//  KnowledgeController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class KnowledgeController: BaseViewController {

    var pagingView: JXPagingView!
    var userHeaderView: KonwLedgeHeaderView!
    var userHeaderContainerView: UIView!
    var segmentedViewDataSource: JXSegmentedTitleDataSource!
    var segmentedView: JXSegmentedView!
    
    let titles = ["关注", "热门", "收藏", "分类" , "我的文章"]
    var JXTableHeaderViewHeight: CGFloat = 140 * kWidthRatio + 38.0
    var JXheightForHeaderInSection: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavi()
        
        setSegment()
    }
    
    func setNavi()  {
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 44))
        btn.titleLabel?.font = kFontSize(14)
        btn.setTitle("发布", for: .normal)
        btn.setTitleColor(UIColor.SY_Normal, for: .normal)
        btn.addTarget(self, action: #selector(itemAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
    }
    
    @objc func itemAction() {
       
        presentAlertVC(confirmBtn: nil, message: "点击了发布", title: "提示", cancelBtn: "知道了", handler: { (ac) in
        })
    }

    
    func setSegment() {
        
        userHeaderContainerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: JXTableHeaderViewHeight))
        userHeaderView = KonwLedgeHeaderView(frame: userHeaderContainerView.bounds)
        userHeaderContainerView.addSubview(userHeaderView)
        
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedViewDataSource = JXSegmentedTitleDataSource()
        segmentedViewDataSource.titles = titles
        segmentedViewDataSource.reloadData(selectedIndex: 0)
        
        segmentedView = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: JXheightForHeaderInSection))
        segmentedView.backgroundColor = UIColor.white
        segmentedView.dataSource = segmentedViewDataSource
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        
        let lineView = JXSegmentedIndicatorLineView()
        segmentedView.indicators = [lineView]

        pagingView = JXPagingView(delegate: self)
        self.view.addSubview(pagingView)
        
        segmentedView.contentScrollView = pagingView.listContainerView.collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pagingView.frame = self.view.bounds
    }
}


extension KnowledgeController: JXPagingViewDelegate {
    
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        return Int(JXTableHeaderViewHeight)
    }
    
    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return userHeaderContainerView
    }
    
    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        return Int(JXheightForHeaderInSection)
    }
    
    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        return segmentedView
    }
    
    func numberOfLists(in pagingView: JXPagingView) -> Int {
        return titles.count
    }
    
    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        let list = KonwLedgeListBaseView()
        if index == 0 {
            list.dataSource = []
        }else if index == 1 {
            list.dataSource = []
        }else {
            list.dataSource = []
        }
        list.beginFirstRefresh()
        return list
    }
    
    func mainTableViewDidScroll(_ scrollView: UIScrollView) {

    }
}







//MARK： -- appear

extension KnowledgeController {
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        let tabBarController = self.tabBarController as! MainTabBarController
        tabBarController.tabBar.isHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
