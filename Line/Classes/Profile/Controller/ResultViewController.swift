//
//  ResultViewController.swift
//  Line
//
//  Created by developer ios on 2018/12/28.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    static let cellIdentifer = "myCell"
    var tableView: UITableView?
    var itemArray : Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.intiSubView()
    }
    
    func intiSubView()
    {
        self.tableView = UITableView(frame: CGRect(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kViewHeight), style: UITableViewStyle.plain)
        self.tableView?.backgroundColor = UIColor.clear
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        let aaaView = UIView()
        aaaView.backgroundColor = UIColor.white
        self.tableView?.tableFooterView = aaaView
        self.view.addSubview(self.tableView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = itemArray[indexPath.row]
        cell?.textLabel?.textColor = UIColor.black
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
