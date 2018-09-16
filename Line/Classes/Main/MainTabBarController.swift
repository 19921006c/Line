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
    let discoverVc = DiscoverViewController()
    let profileVc = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        addAllChildControoler()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //  添加所有主navigation controller
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
        addAloneChildController(controller: discover, name: "发现")
        addAloneChildController(controller: profile, name: "个人")
    }
    private func addAloneChildController(controller: UIViewController,name: String?) {
        
        let vc = UINavigationController(rootViewController: controller)
        vc.title = name
        addChildViewController(vc)
    }
}
