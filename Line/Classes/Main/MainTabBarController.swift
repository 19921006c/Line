//
//  MainTabBarController.swift
//  Line
//
//  Created by developer ios on 2018/9/16.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let homeVc = HomeViewController()
    let searchVc = SearchViewController()
    let addVc = AddViewController()
    let followVc = FollowViewController()
//    let discoverVc = DiscoverViewController()
    let profileVc = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. 添加所有自控制器
        addAllChildControoler()
        // 2. 设置tabbar
        let customTabBar = MainTabBar()
        customTabBar.customDelegate = self as? MainTabBarDelegate
        self.setValue(customTabBar, forKey: "tabBar")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /** 添加所有自控制器 */
    private func addAllChildControoler() {
        // home
        let home = HomeViewController()
        home.view.backgroundColor = UIColor.red
        
        // discover
        let discover = DiscoverViewController()
        discover.view.backgroundColor = UIColor.blue
        
        // profile
        let profile = ProfileViewController()
        profile.view.backgroundColor = UIColor.yellow
        addAloneChildController(controller: home, name: "首页")
//        addAloneChildController(controller: discover, name: "发现")
        addAloneChildController(controller: searchVc, name: "搜索")
//        addAloneChildController(controller: addVc, name: "添加")
        addAloneChildController(controller: followVc, name: "关注")
        addAloneChildController(controller: profile, name: "个人")
    }
    private func addAloneChildController(controller: UIViewController,name: String?) {
        
        let naVc = UINavigationController(rootViewController: controller)
        naVc.title = name
        controller.title = name
        addChildViewController(naVc)
    }
}

// MARK: - lazy load
// MARK: - life cycle
// MARK: - delegate
extension MainTabBarController: MainTabBarDelegate {
    func callBack(string: String) {
        print("bar call back")
    }
}
// MARK: - event response
// MARK: - private methods
