//
//  ActivityViewController.swift
//  Line
//
//  Created by developer ios on 2018/12/27.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit
import MJRefresh


// MARK: - lazy load

class ActivityViewController: UIViewController {
    /** table view */
    lazy var tableView: ActivityTableView = {
        let view = ActivityTableView()
        return view
    }()
}
// MARK: - life cycle
 extension ActivityViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加table view
        view.addSubview(tableView)
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            let array: Array? = ActivityModel.getArray()
            
            self.tableView.loadArray(array: array)
            
            let time: TimeInterval = 0.5
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.tableView.mj_header.endRefreshing()
            }
        })
        tableView.mj_header.beginRefreshing()
        // 添加 添加活动 btn
        let rightItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(rightDown))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // tableview frame
        tableView.frame = CGRect(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kViewHeight)
    }
}
// MARK: - delegate
// MARK: - event response
// MARK: - private methods
extension ActivityViewController {
    // 点击right btn action
    @objc func rightDown() {
        let vc = AddActivityViewController()
        vc.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(vc, animated: true)
    }
}


