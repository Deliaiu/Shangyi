//
//  HomeHeaderCycleView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeHeaderCycleView: UIView {
  
    //MARK: - 定义属性
    lazy var collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize(width: kScreenWidth, height: 140 * kWidthRatio)             //设置item尺寸
        layout.minimumLineSpacing = 0  //上下间隔
        layout.minimumInteritemSpacing = 0 //左右间隔
        layout.headerReferenceSize = CGSize(width:0,height:  0)   //头部间隔
        layout.footerReferenceSize = CGSize(width:0,height:  0)   //底部间隔
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)      //section四周的缩进
        layout.scrollDirection = .horizontal  //滚动方向
        
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 140 * kWidthRatio), collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.register(CollectionCycleCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(cv)
        return cv
    }()
    lazy var pageControl: UIPageControl = {
        let page = UIPageControl(frame: CGRect(x: 0, y: 140 * kWidthRatio - 20 , width: kScreenWidth, height: 20))
        page.currentPageIndicatorTintColor = UIColor.SY_red
        page.pageIndicatorTintColor = UIColor.white
        addSubview(page)
        return page
    }()
    
    var cycleTimer: Timer?
    var cycleModels: [HomeCycleModel]? {
        didSet {
            //1.刷新collection
            collectionView.reloadData()
            //2.设置pageControl个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            //3、添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        autoresizingMask = []
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: 遵守 UICollectionViewDataSource 协议
extension HomeHeaderCycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCycleCell
        let cycleModel = cycleModels![indexPath.item]
        cell.cycleModel = cycleModel
        
        return cell
    }
    
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cycleModels?.count ?? 0
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cycleModel = cycleModels![indexPath.item]
        let vc = BaseWebController()
        vc.webUrl = cycleModel.url
        viewForController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
}


// MARK: 遵守 UICollectionViewDelegate 协议
extension HomeHeaderCycleView : UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //1. 获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        //2. 计算 pageControl 的 currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
        
    }
    
    // 监听用户拖拽
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        addCycleTimer()
    }
    
}



// MARK: 对定时器的操作方法
extension HomeHeaderCycleView {
    
    // 创建定时器的方法
    private func addCycleTimer() {
        
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: .common)
    }
    
    // 移除定时器的方法
    private func removeCycleTimer() {
        
        //1. 从运行循环中移除
        cycleTimer?.invalidate()
        //2.
        cycleTimer = nil
    }
    
    @objc private func scrollToNext() {
        
        //1. 获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        //2. 滚动到该位置
        if offsetX >= kScreenWidth * CGFloat(cycleModels!.count) {
            collectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)

        }else{
            collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        }
        
    }
    
}


class CollectionCycleCell: UICollectionViewCell {
    
    lazy var imgV: UIImageView = {
        let imagev = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 140 * kWidthRatio))
        
        return imagev
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imgV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 定义模型属性
    var cycleModel : HomeCycleModel? {
        
        didSet {
            imgV.image = UIImage(named: cycleModel!.pic)
        }
    }
}

