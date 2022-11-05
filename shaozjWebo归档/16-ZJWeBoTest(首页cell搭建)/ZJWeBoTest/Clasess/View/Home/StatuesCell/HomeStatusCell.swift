//
//  HomeStatusCell.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/28.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class HomeStatusCell: UITableViewCell {

    
    @IBOutlet weak var userIconView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var comeLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
