//
//  PlayerCellTableViewCell.swift
//  Rattings
//
//  Created by HuanGong on 16/3/2.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

class PlayerCellTableViewCell: UITableViewCell {
    
    //All these variables are IBOutlets, which can be connected up to your scene in the storyboard.
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var player: Player! {
        didSet { // 这个函数会在类 被赋值改变的时候触发， 触发的时候只要将类的成员变量正确地设置即可
            gameLabel.text = player.game
            nameLabel.text = player.name
            ratingImageView.image = imageForRating(player.rating)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func imageForRating(rating:Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }

}
