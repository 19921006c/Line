//
//  FollowViewController.swift
//  Line
//
//  Created by developer ios on 2018/12/10.
//  Copyright © 2018 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

let FollowTableViewADCellIdentifier = "FollowTableViewADCell"
let FollowTableViewPhotoCellIdentifier = "FollowTableViewPhotoCell"
let FollowTableViewAreaCellIdentifier = "FollowTableViewAreaCell"
let FollowTableViewNoteCellIdentifier = "FollowTableViewNoteCell"

class FollowViewController: UIViewController {

    // tableView
    @IBOutlet weak var tableView: UITableView!
}
// MARK: - lazy load

// MARK: - life cycle
extension FollowViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置数据源,代理
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: FollowTableViewADCellIdentifier, bundle: nil), forCellReuseIdentifier: FollowTableViewADCellIdentifier)
        tableView.register(UINib.init(nibName: FollowTableViewPhotoCellIdentifier, bundle: nil), forCellReuseIdentifier: FollowTableViewPhotoCellIdentifier)
        tableView.register(UINib.init(nibName: FollowTableViewAreaCellIdentifier, bundle: nil), forCellReuseIdentifier: FollowTableViewAreaCellIdentifier)
        tableView.register(UINib.init(nibName: FollowTableViewNoteCellIdentifier, bundle: nil), forCellReuseIdentifier: FollowTableViewNoteCellIdentifier)

    }
}

// MARK: - delegate
extension FollowViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FollowTableViewADCellIdentifier, for: indexPath)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FollowTableViewPhotoCellIdentifier, for: indexPath)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        } else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: FollowTableViewAreaCellIdentifier, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FollowTableViewNoteCellIdentifier, for: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44
        }
        if indexPath.section == 1 {
            return 150
        }
        if indexPath.section == 2 {
            return 270
        }
        if indexPath.section == 3 {
            return 200
        }
        return 44
    }
}
// MARK: - event response

// MARK: - private methods
