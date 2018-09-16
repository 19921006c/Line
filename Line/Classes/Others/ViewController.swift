//
//  ViewController.swift
//  Line
//
//  Created by developer ios on 2018/9/15.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "hello"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.green
        
        view.addSubview(label)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

