//
//  MainTabBarController.swift
//  上医医生版
//
//  Created by 刘海燕 on 2019/8/1.
//  Copyright © 2019 zhonghuijia. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    var tarbarConfigArr:[Dictionary<String,String>]! //标签栏配置数组，从Plist文件中读取
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        //1.调用父类的初始化方法
        super.init(nibName: nil, bundle: nil)
        //2.读取Plist文件,初始化标签栏配置数组
        tarbarConfigArr = getConfigArrFromPlistFile()
        //3.创建视图控制器
        createControllers()
        //4、设置tabbar
        setTabbar()
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    //读取plist
    private  func  getConfigArrFromPlistFile() ->([Dictionary<String,String>]?){
        let  filePath: String? = Bundle.main.path(forResource: "TabBarConfig", ofType: "plist")
        let plistData = NSDictionary(contentsOfFile: filePath ?? "")
        let configArr = plistData?.object(forKey: "Tabbars") as? [Dictionary<String,String>]
        return configArr;
    }
    
    //创建视图控制器
    private func createControllers(){
        
        var nvcArray = [BaseNaviController]()
        
        for dictionary in tarbarConfigArr{
            
            //在Swift中, 通过字符串创建一个类, 那么必须加上命名空间clsName
            let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            //动态获取的命名空间是不包含.的, 所以需要我们自己手动拼接
            let anyClass: AnyClass? = NSClassFromString(clsName + "." + dictionary["ClassName"]!)
            //将AnyClass类型转换为BaseViewController类型，
            //因为Swift中通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
            if let vcClassType = anyClass as? BaseViewController.Type {
                let viewcontroller = vcClassType.init()
                viewcontroller.title = dictionary["Title"]
                viewcontroller.tabBarItem.image = UIImage(named: dictionary["NormalImage"]!)?.withRenderingMode(.alwaysOriginal)
                viewcontroller.tabBarItem.selectedImage = UIImage(named: dictionary["SelectedImage"]!)?.withRenderingMode(.alwaysOriginal)
                
                let nav = BaseNaviController(rootViewController:viewcontroller)
                nvcArray.append(nav)
            }
        }
        //设置标签栏控制器数组
        viewControllers = nvcArray
    }
    
    //设置tabbar
    private func setTabbar() {
        
        tabBar.tintColor = UIColor.SY_red
        tabBar.barTintColor = UIColor.white
    }
    
}

//MARK: - 代理方法

extension MainTabBarController {
    
    
    //是否允许选择不同item触发后续操作，YES  允许，NO不允许
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
    }
    
    //每次点击tabBarItem后触发这个方法(只有点击标签栏中的五个按钮才会触发，MORE里边的不会触发)
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        

    }
    
}


