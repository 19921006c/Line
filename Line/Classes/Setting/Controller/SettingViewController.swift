//
//  SettingViewController.swift
//  Line
//
//  Created by developer ios on 2018/12/28.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit
// MARK: - lazy load
// MARK: - life cycle

private let identtifier = "SettingTableViewCell"
class SettingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var array: NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: identtifier, bundle: nil), forCellReuseIdentifier: identtifier)
        
        let path = Bundle.main.path(forResource: "SettingData.plist", ofType: nil)
        let tmpArray: NSArray? = NSArray(contentsOfFile: path!)
        array = tmpArray
    }
}
// MARK: - delegate
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identtifier) as! SettingTableViewCell
        let row = indexPath.row
        let section = indexPath.section
        var title: String?
        var icon: String?
        if section == 0 {
            title = "个人信息"
            icon = "33"
        }
        if section == 1 {
            if row == 0 {
                title = "清理空间"
                icon = "34"
            }
            if row == 1 {
                title = "关于face2face"
                icon = "35"
            }
        }
        if section == 2 {
            title = "退出"
            icon = "36"
        }
        cell.customImageView.image = UIImage(named: icon ?? "")
        cell.label.text = title
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 2
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AddActivityViewController()
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 { vc.title = "个人信息" }
        if section == 1 && row == 0 { vc.title = "清理空间"}
        if section == 1 && row == 1 { vc.title = "关于face2face" }
        if section == 2 { vc.title = "退出登录" }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - event response
// MARK: - private methods
