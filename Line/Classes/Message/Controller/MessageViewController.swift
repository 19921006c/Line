//
//  MessageViewController.swift
//  Line
//
//  Created by developer ios on 2018/12/27.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit
import MJRefresh


// MARK: - lazy load

class MessageViewController: UIViewController {
    /** table view */
    lazy var tableView: MessageTableView = {
        let view = MessageTableView()
        return view
    }()
}
// MARK: - life cycle
extension MessageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加table view
        view.addSubview(tableView)
        
        let array: Array? = MessageModel.getArray()
            
        self.tableView.loadArray(array: array)
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
extension MessageViewController {
}
