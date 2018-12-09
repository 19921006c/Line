//
//  MainTabBarBtn.swift
//  Line
//
//  Created by developer ios on 2018/12/10.
//  Copyright © 2018 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

protocol MainTabBarBtnDelegate: NSObjectProtocol {
    func callback(string: String)
}
// MARK: - lazy load
class MainTabBarBtn: UIView {
    
    weak var customDelegate: MainTabBarBtnDelegate?
    
    fileprivate lazy var realyBtn: UIButton = {
        var btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(MainTabBarBtn.coverBtnWithTouchDown), for:.touchDown)
        btn.addTarget(self, action: #selector(MainTabBarBtn.coverBtnWithTouchUpInside), for: .touchUpInside)
        btn.addTarget(self, action: #selector(MainTabBarBtn.coverBtnWithTouchDragExit), for: .touchDragExit)
        return btn
    }()
    fileprivate lazy var coverBtn: UIButton = {
        var btn = UIButton(type: .custom)
        changeBtnToNormal()
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(coverBtn)
        addSubview(realyBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        coverBtn.frame = bounds
        realyBtn.sizeToFit()
//        let realyBtnX = center.x - width
//        let realyBtnY = center.y
//        realyBtn.center = CGPoint(x: realyBtnX, y: realyBtnY)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - life cycle
// MARK: - delegate
// MARK: - event response
extension MainTabBarBtn {
    @objc func coverBtnWithTouchDown() {
        realyBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .normal)
        realyBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .normal)
    }
    
    @objc func coverBtnWithTouchUpInside() {
        changeBtnToNormal()
        if customDelegate != nil {
            customDelegate?.callback(string: "点击btn")
        }
    }
    
    @objc func coverBtnWithTouchDragExit() {
        self.changeBtnToNormal()
    }
}
// MARK: - private methods
extension MainTabBarBtn {
    func changeBtnToNormal() {
        realyBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        realyBtn.setImage(UIImage(named: "tabbar_compose_button"), for: .normal)
    }
}



