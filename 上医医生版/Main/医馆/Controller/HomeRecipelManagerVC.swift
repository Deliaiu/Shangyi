//
//  HomeRecipelManagerVC.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit


class HomeRecipelManagerVC: BaseViewController {

    var segmentedDataSource: JXSegmentedTitleDataSource!
    var segmentedView: JXSegmentedView!
    var listContainerView: JXSegmentedListContainerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "处方管理"
        
        setSegment()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentedView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        listContainerView.frame = CGRect(x: 0, y: 50, width: view.bounds.size.width, height: view.bounds.size.height - 50)
    }
    
    func setSegment() {
        //1、初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        segmentedView.backgroundColor = UIColor.white
        segmentedView.layer.borderColor = UIColor.SY_line.cgColor
        segmentedView.layer.borderWidth = 0.5
        
        //2、配置数据源
        //segmentedViewDataSource一定要通过属性强持有！！！！！！！！！
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.titles = ["全部", "未支付"]
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.reloadData(selectedIndex: 0)
        segmentedView.dataSource = segmentedDataSource
        
        //3、配置指示器
        let indicator = JXSegmentedIndicatorLineView()
        segmentedView.indicators = [indicator]
        
        //4、配置JXSegmentedView的属性
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView.delegate = self
        view.addSubview(segmentedView)
        
        //5、初始化JXSegmentedListContainerView
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        listContainerView.didAppearPercent = 0.9
        view.addSubview(listContainerView)

        //6、将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.contentScrollView = listContainerView.scrollView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新", style: UIBarButtonItem.Style.plain, target: self, action: #selector(reloadData))
    }
 
    @objc func reloadData() {
       
        //一定要统一segmentedDataSource、segmentedView、listContainerView的defaultSelectedIndex
        //reloadData(selectedIndex:)一定要调用
        segmentedDataSource.reloadData(selectedIndex: 0)
        
        segmentedView.defaultSelectedIndex = 0
        segmentedView.reloadData()
        
        listContainerView.defaultSelectedIndex = 0
        listContainerView.reloadData()
    }
}

extension HomeRecipelManagerVC: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension HomeRecipelManagerVC: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return segmentedDataSource.dataSource.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let vc = HomeRecipeListController()
        vc.naviController = navigationController
        vc.typeString = segmentedDataSource.titles[index]
        return vc
    }
}
