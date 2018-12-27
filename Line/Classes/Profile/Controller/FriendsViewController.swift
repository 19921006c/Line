//
//  FriendsViewController.swift
//  Line
//
//  Created by developer ios on 2018/12/27.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

// MARK: - lazy load
class FriendsViewController: UIViewController {
    var tableView: UITableView = UITableView(frame: CGRect.zero)
    let dataList = ["张三", "王二", "李四", "赵武", "阿玉", "帮你", "饿了", "愁人", "医院", "东西", "房子", "官府", "海洋", "抗造", "龙宫", "猛虎"].sorted()
    var searchDataList: [String]?
    let searchVc = UISearchController(searchResultsController: nil)
}

// MARK: - life cycle
extension FriendsViewController {
    
    override func viewDidLoad() {
        
        tableView = UITableView(frame: CGRect.zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        searchDataList = dataList
        searchVc.searchResultsUpdater = self
        searchVc.hidesNavigationBarDuringPresentation = false
        searchVc.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchVc.searchBar
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.frame = view.bounds
    }
}
// MARK: - delegate
extension FriendsViewController: UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let nflTeams = searchDataList else {
            return 0
        }
        return nflTeams.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        if let item = searchDataList {
            let team = item[indexPath.row]
            cell.textLabel!.text = team
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AddActivityViewController()
        
        if let item = searchDataList {
            let title = item[indexPath.row]
            vc.title = title
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            searchDataList = dataList.filter { item in
                return item.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            searchDataList = dataList
        }
        tableView.reloadData()
    }
}
// MARK: - event response
// MARK: - private methods
