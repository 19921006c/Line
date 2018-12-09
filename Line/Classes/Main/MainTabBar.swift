//
//  MainTabBar.swift
//  Line
//
//  Created by developer ios on 2018/12/10.
//  Copyright © 2018 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

protocol MainTabBarDelegate: NSObjectProtocol {
    func callBack(string: String)
//    optional func tabBarDidClickPlusBtn(tabBar: MainTabBarController)
}

class MainTabBar: UITabBar {
    
    weak var customDelegate: MainTabBarDelegate?
    
    fileprivate lazy var midBtn: MainTabBarBtn = {
        let view = MainTabBarBtn()
        view.customDelegate = self
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var count = 1
        for view in subviews {
            
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                count = count + 1
            }
        }
        
        addSubview(midBtn)
        // 1. 设置btn
        let midBtnViewWidth: CGFloat = width / CGFloat(count)
        let midBtnViewHeight: CGFloat = height
        let midBtnX: CGFloat = (width - midBtnViewWidth) * 0.5
        let midBtnY: CGFloat = 0
        midBtn.frame = CGRect(x: midBtnX, y: CGFloat(midBtnY), width: midBtnViewWidth, height: midBtnViewHeight)
        
        // 2. 设置其他btn frame
        let tabBarBtnWidth = width / CGFloat(count)
        var index = 0
        for child in subviews {
            let tmpClass = NSClassFromString("UITabBarButton")
            if child.isKind(of: tmpClass!) {
                child.x = CGFloat(index) * tabBarBtnWidth
                child.width = tabBarBtnWidth
                index += 1
                
                if index == (count - 1) / 2 {
                    index += 1
                }
            }
        }

    }
    
}
// MARK: - lazy load
// MARK: - life cycle
// MARK: - delegate
extension MainTabBar: MainTabBarBtnDelegate {
    func callback(string: String) {
        print("btn call back")
        
        if self.customDelegate != nil {
            self.customDelegate?.callBack(string: "")
        }
    }
}
// MARK: - event response
// MARK: - private methods
