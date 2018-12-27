//
//  MessageModel.swift
//  Line
//
//  Created by developer ios on 2018/12/28.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

class MessageModel: NSObject {
    var icon: String?
    var title: String?
    var content: String?
    
    class func getArray() -> [ActivityModel]? {
        let path = Bundle.main.path(forResource: "MessageData.plist", ofType: nil)
        let array = NSArray(contentsOfFile: path!)
        if array == nil { return nil }
        var tmpArray = [ActivityModel]()
        for item in array! {
            let model = ActivityModel()
            
            let tmpItem = item as! NSDictionary
            model.icon = tmpItem["icon"] as? String
            model.title = tmpItem["name"] as? String
            model.content = tmpItem["content"] as? String
            tmpArray.append(model)
        }
        return tmpArray
    }
}
