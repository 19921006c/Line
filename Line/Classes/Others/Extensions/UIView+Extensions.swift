//
//  UIView+Extensions.swift
//  Line
//
//  Created by developer ios on 2018/12/10.
//  Copyright © 2018 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

extension UIView {
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.x = newValue
            frame = tmpFrame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.y = newValue
            frame = tmpFrame
        }
    }
    
    var width: CGFloat{
        get {
            return frame.size.width
        }
        
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.size.width = newValue
            frame = tmpFrame
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.size.height = newValue
            frame = tmpFrame
        }
    }
    
}
