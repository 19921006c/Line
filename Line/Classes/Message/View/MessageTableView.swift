//
//  MessageTableView.swift
//  Line
//
//  Created by developer ios on 2018/12/28.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

private let identifier = "MessageTableViewCell"
// MARK: - lazy load
class MessageTableView: UITableView {
    
    var array: [ActivityModel]?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        delegate = self
        dataSource = self
        self.separatorStyle = UITableViewCellSeparatorStyle.none
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - life cycle
extension MessageTableView {
    
}
// MARK: - delegate
extension MessageTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: MessageTableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MessageTableViewCell
        let model = self.array![indexPath.section]
        cell?.model = model
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.array?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
// MARK: - event response
// MARK: - private methods
extension MessageTableView {
    func loadArray(array: Array<Any>?) {
        let tmpArray = array as? [ActivityModel]
        self.array = tmpArray
        self.reloadData()
    }
}
