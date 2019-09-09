//
//  MyTabBar.swift
//  aniRecipe
//
//  Created by kaho-hayashi on 2019/08/30.
//  Copyright © 2019 Cookpad Inc. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 58
        return size
    }
    
}
