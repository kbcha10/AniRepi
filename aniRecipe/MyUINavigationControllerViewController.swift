//
//  MyUINavigationControllerViewController.swift
//  aniRecipe
//
//  Created by kaho-hayashi on 2019/08/29.
//  Copyright © 2019 Cookpad Inc. All rights reserved.
//

import UIKit

class MyUINavigationControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //　ナビゲーションバーの背景色
        navigationBar.barTintColor = UIColor.init(red: 36/255, green: 41/255, blue: 50/255, alpha: 100/100)
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        navigationBar.tintColor = UIColor.init(red: 244/255, green: 144/255, blue: 5/255, alpha: 100/100)
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]

        // Do any additional setup after loading the view.
    }
    


}
