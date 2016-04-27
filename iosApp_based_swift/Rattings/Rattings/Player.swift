//
//  Player.swift
//  Rattings
//
//  Created by HuanGong on 16/3/1.
//  Copyright © 2016年 HuanGong. All rights reserved.
//

import UIKit

struct Player {
    var name: String?
    var game: String?
    var rating: Int
    
    init(name: String?, game: String?, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
    }
}