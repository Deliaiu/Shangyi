//
//  HomeEvaluateManagerVC.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/2.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeEvaluateManagerVC: BaseViewController {

    var segmentedDataSource: JXSegmentedTitleAttributeDataSource!
    var segmentedView: JXSegmentedView!
    var listContainerView: JXSegmentedListContainerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "查看评论"
        
        setSegment()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentedView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 52)
        listContainerView.frame = CGRect(x: 0, y: 52, width: view.bounds.size.width, height: view.bounds.size.height - 52)
    }
 
    func setSegment() {
        
        //1、初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        segmentedView.backgroundColor = UIColor.white
        segmentedView.layer.borderColor = UIColor.SY_line.cgColor
        segmentedView.layer.borderWidth = 0.5
        
        //2、配置数据源

        let dataSource = JXSegmentedTitleAttributeDataSource()
        
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 4
        paraph.alignment = .center
        func formatNormal(attriText: NSMutableAttributedString) {
           attriText.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.SY_Normal, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.paragraphStyle: paraph], range: NSRange(location: 0, length: attriText.string.count))
        }
        func formatSelected(attriText: NSMutableAttributedString) {
            attriText.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.red, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.paragraphStyle: paraph], range: NSRange(location: 0, length: attriText.string.count))
        }
        
        let AttriText1 = NSMutableAttributedString(string: "全部\n0")
        let AttriText2 = NSMutableAttributedString(string: "好评\n0")
        let AttriText3 = NSMutableAttributedString(string: "中评\n0")
        let AttriText4 = NSMutableAttributedString(string: "差评\n0")
        let AttriText5 = NSMutableAttributedString(string: "未回复\n0")
        
        formatNormal(attriText: AttriText1)
        formatNormal(attriText: AttriText2)
        formatNormal(attriText: AttriText3)
        formatNormal(attriText: AttriText4)
        formatNormal(attriText: AttriText5)
        
        dataSource.attributedTitles = [AttriText1.copy(), AttriText2.copy(), AttriText3.copy(), AttriText4.copy(), AttriText5.copy()] as! [NSAttributedString]
        
        formatSelected(attriText: AttriText1)
        formatSelected(attriText: AttriText2)
        formatSelected(attriText: AttriText3)
        formatSelected(attriText: AttriText4)
        formatSelected(attriText: AttriText5)
        
        dataSource.selectedAttributedTitles = [AttriText1.copy(), AttriText2.copy(), AttriText3.copy(), AttriText4.copy(), AttriText5.copy()] as? [NSAttributedString]

        dataSource.reloadData(selectedIndex: 0)
        segmentedDataSource = dataSource
        segmentedView.dataSource = segmentedDataSource
        
        //3、配置指示器
        let indicator = JXSegmentedIndicatorBaseView()
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

extension HomeEvaluateManagerVC: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension HomeEvaluateManagerVC: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return segmentedDataSource.dataSource.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let vc = HomeEvaluateListController()
        vc.naviController = navigationController
        vc.typeString = segmentedDataSource.attributedTitles[index].string
        return vc
    }
}

