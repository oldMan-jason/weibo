//
//  HomeStatusCell.swift
//  ZJWeBoTest
//
//  Created by 邵泽俊 on 2017/2/28.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

import UIKit

class HomeStatusCell: UITableViewCell {

    var  viewModel: WBStatusViewModel? {
        didSet{
            
         contentLabel.text = viewModel?.status.text
            
         userNameLabel.text = viewModel?.status.user?.screen_name
         //设置会员等级图标
         vipIconView.image = viewModel?.vipIcon
        //设置用户认证图标
        avatarImgView.image = viewModel?.verified_type
        }
    }
    
    @IBOutlet weak var avatarImgView: UIImageView!
    
    @IBOutlet weak var vipIconView: UIImageView!
    
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
