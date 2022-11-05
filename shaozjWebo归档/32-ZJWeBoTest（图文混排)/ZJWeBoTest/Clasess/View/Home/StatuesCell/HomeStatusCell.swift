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
        //设置正文的属性文本文字
         contentLabel.attributedText = viewModel?.statusAttrText
        //设置转发微博的文字
        retweetedTextLabel?.attributedText = viewModel?.retweetedAttrText
         userNameLabel.text = viewModel?.status.user?.screen_name
            
         timeLabel.text = viewModel?.created_at
         comeLabel.text = viewModel?.source
         
            
         //设置会员等级图标
         vipIconView.image = viewModel?.vipIcon
         //设置用户头像
         userIconView.zj_setImage(urlStr: viewModel?.status.user?.profile_image_url, placeImg: UIImage(named: "avatar_default_big"),isAvatar: true)
         //设置用户认证图标
         avatarImgView.image = viewModel?.verified_type
        
//        shareBtn.setTitle("\(viewModel?.status.reposts_count)", for: .normal)
//        commentBtn.setTitle("\(viewModel?.status.comments_count)", for: .normal)
//        unlikeBtn.setTitle("\(viewModel?.status.attitudes_count)", for: .normal)
            
        shareBtn.setTitle(viewModel?.repostsStr, for: .normal)
        commentBtn.setTitle(viewModel?.commentsStr, for: .normal)
        unlikeBtn.setTitle(viewModel?.attitudesStr, for: .normal)
            
            
        //测试 4张 图片
//            if (viewModel?.status.pic_urls?.count)! > 4 {
//                var picURLS = (viewModel?.status.pic_urls)!
//                
//                picURLS.removeSubrange((picURLS.startIndex + 4) ..< picURLS.endIndex)
//                pictureView.urlsModelArray = picURLS
//                
//            }else{
//                pictureView.urlsModelArray = viewModel?.status.pic_urls
//            }
            
            //通过视图模型 修改配图视图的高度
            pictureView.viewModel = viewModel

            
        }
    }
    
    @IBOutlet weak var avatarImgView: UIImageView!//认证
    
    @IBOutlet weak var vipIconView: UIImageView!//会员等级
    
    @IBOutlet weak var userIconView: UIImageView! // 用户头像
    
    @IBOutlet weak var userNameLabel: UILabel!// 用户名
    
    @IBOutlet weak var comeLabel: UILabel! // 来源
    
    @IBOutlet weak var timeLabel: UILabel! //时间
    
    @IBOutlet weak var contentLabel: UILabel! // 正文
    
    @IBOutlet weak var shareBtn: UIButton! //分享
    
    @IBOutlet weak var commentBtn: UIButton! // 评论
    
    @IBOutlet weak var unlikeBtn: UIButton! // 点赞
    
    @IBOutlet weak var pictureView: HomePictureView! //配图视图
    
    
    // 特别注意!!!!!! 相同的cell类，但是采用的是不同的xib，所以，label 一定要采用可选类型
    @IBOutlet weak var retweetedTextLabel: UILabel?
    // MARK:- 分享
    @IBAction func shareWbBtn() {
        
    }
    // MARK:- 评论
    @IBAction func commentWbBtn() {
    }
    
    // MARK:- 点在
    @IBAction func unlikeWbBtn() {
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //离屏渲染
        self.layer.drawsAsynchronously = true
        
        // 栅格化 - 异步绘制之后，会生成一张独立的图像，cell在屏幕上滚动时，本质上滚动的是一张图片
        //停止滚动之后，可以接受监听
        self.layer.shouldRasterize = true
        
        //使用栅格化 必须要指定分辨率
        self.layer.rasterizationScale = UIScreen.main.scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
