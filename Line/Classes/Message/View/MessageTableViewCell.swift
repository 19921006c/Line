//
//  MessageTableViewCell.swift
//  Line
//
//  Created by developer ios on 2018/12/27.
//  Copyright © 2018年 developer.ios.zz@gmail.com. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    private var _model: ActivityModel?
    var model: ActivityModel? {
        set {
            _model = newValue
            iconImageView.image = UIImage(named: newValue?.icon ?? "")
            titleLabel.text = newValue?.title
            contentLabel.text = newValue?.content
        }
        get {
            return _model
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 10
        iconImageView.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
