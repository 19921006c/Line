//
//  MainTabBarController.swift
//  Line
//
//  Created by developer ios on 2018/9/16.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit


// MARK: - lazy load
class MainTabBarController: UITabBarController {
    /**
     *  activiry view controler
     */
    lazy var actVc: ActivityViewController = {
        let vc = ActivityViewController()
        return vc
    }()
    /**
     *  message view controller
     */
    lazy var msgVc: MessageViewController = {
        let vc = MessageViewController()
        return vc
    }()
    /**
     *  friends view controler
     */
    lazy var friendsVc: FriendsViewController = {
        let vc = FriendsViewController()
        return vc
    }()
    /**
     *  profile view controller
     */
    lazy var profileVc: FollowViewController = {
        let vc = FollowViewController()
        return vc
    }()
    lazy var setttingVc: SettingViewController = {
        let vc = SettingViewController()
        return vc
    }()
}
// MARK: - life cycle
extension MainTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 添加所有自控制器
        addAllChildControoler()
        
        
        // 2. 设置tabbar
        //        let customTabBar = MainTabBar()
        //        customTabBar.customDelegate = self as? MainTabBarDelegate
        //        self.setValue(customTabBar, forKey: "tabBar")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
        
}


// MARK: - delegate
extension MainTabBarController: MainTabBarDelegate {
    func callBack(string: String) {
//        let vc = AddViewController()
//        vc.view.backgroundColor = UIColor.blue
//        present(vc, animated: true, completion: nil)
    }
}
// MARK: - event response
// MARK: - private methods
    extension MainTabBarController {
        /** 添加所有自控制器 */
        private func addAllChildControoler() {
            addAloneChildController(controller: actVc, name: "活动")
            addAloneChildController(controller: msgVc, name: "消息")
            addAloneChildController(controller: friendsVc, name: "好友")
            addAloneChildController(controller: profileVc, name: "我的")
            addAloneChildController(controller: setttingVc, name: "设定")
        }
        /** 单独添加控制器 */
        private func addAloneChildController(controller: UIViewController,name: String?) {
            let naVc = UINavigationController(rootViewController: controller)
            naVc.title = name
            controller.title = name
            addChildViewController(naVc)
        }
}
