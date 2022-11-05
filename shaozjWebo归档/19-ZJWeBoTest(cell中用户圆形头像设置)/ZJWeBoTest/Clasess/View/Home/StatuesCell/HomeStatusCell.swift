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
        //重写didSet方法
        didSet{
            
         contentLabel.text = viewModel?.status.text
         userNameLabel.text = viewModel?.status.user?.screen_name
         //设置会员等级图标
         vipIconView.image = viewModel?.vipIcon
         //设置用户头像
         userIconView.zj_setImage(urlStr: viewModel?.status.user?.profile_image_url, placeImg: UIImage(named: "avatar_default_big"),isAvatar: true)
         //设置用户认证图标
         avatarImgView.image = viewModel?.verified_type
        }
    }
    
    @IBOutlet weak var avatarImgView: UIImageView!//认证
    
    @IBOutlet weak var vipIconView: UIImageView!//会员等级
    
    @IBOutlet weak var userIconView: UIImageView! // 用户头像
    
    @IBOutlet weak var userNameLabel: UILabel!// 用户名
    
    @IBOutlet weak var comeLabel: UILabel! // 来源
    
    @IBOutlet weak var timeLabel: UILabel! //时间
    
    @IBOutlet weak var contentLabel: UILabel! // 正文
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
