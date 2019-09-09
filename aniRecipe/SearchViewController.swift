//
//  SearchViewController.swift
//  aniRecipe
//
//  Created by kaho-hayashi on 2019/08/30.
//  Copyright © 2019 Cookpad Inc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // NavigationBarを非表示にしたい場合
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
