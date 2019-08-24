//
//  HomeFunctionView.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class HomeFunctionView: UIView {

    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenWidth / 4, height: 90)                   //设置item尺寸
        layout.minimumLineSpacing = 0  //上下间隔
        layout.minimumInteritemSpacing = 0 //左右间隔
        layout.headerReferenceSize = CGSize(width:0,height:  0)   //头部间隔
        layout.footerReferenceSize = CGSize(width:0,height:  0)   //底部间隔
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)      //section四周的缩进
        layout.scrollDirection = .horizontal  //滚动方向

        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 180), collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.register(CollectionFuncCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(cv)
        return cv
    }()

    
    var models: [HomeFuncModel] = [HomeFuncModel]() {
        didSet {
            //.刷新collection
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: 遵守 UICollectionViewDataSource 协议
extension HomeFunctionView : UICollectionViewDataSource ,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionFuncCell

        let model = models[indexPath.item]
        cell.model = model
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let model = models[indexPath.item]

        if model.title == "邀请患者" {
            
            let vc = MyCardViewController()
            viewForController()?.navigationController?.pushViewController(vc, animated: true)
            
        }else if model.title == "群发公告" {
            let vc = HomeADViewController()
            viewForController()?.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        else{
            
            presentAlertVC(confirmBtn: nil, message: model.title, title: "提示", cancelBtn: "知道了", handler: { (actin) in
            })
        }
        
    }
    
}



class CollectionFuncCell: UICollectionViewCell {
    
    lazy var imgV: UIImageView = {
        let imagev = UIImageView(frame: CGRect(x: (kScreenWidth / 4 - 25) / 2, y: 17, width: 25, height: 25))
        return imagev
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: imgV.frame.origin.y + imgV.frame.size.height + 10, width: kScreenWidth / 4, height: 22))
        label.textColor = UIColor.SY_Normal
        label.textAlignment = .center
        label.font = kFontSize(14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imgV)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 定义模型属性
    var model : HomeFuncModel? {
        
        didSet {
            imgV.image = UIImage(named: model!.pic)
            titleLabel.text = model?.title
        }
    }
}

