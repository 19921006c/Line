//
//  ActivityTableView.swift
//  Line
//
//  Created by developer ios on 2018/12/27.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit


private let identifier = "ActivityTableViewCell"
// MARK: - lazy load
class ActivityTableView: UITableView {
    
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
extension ActivityTableView {
    
}
// MARK: - delegate
extension ActivityTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ActivityTableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ActivityTableViewCell
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
}
// MARK: - event response
// MARK: - private methods
extension ActivityTableView {
    func loadArray(array: Array<Any>?) {
        let tmpArray = array as? [ActivityModel]
        self.array = tmpArray
        self.reloadData()
    }
}
