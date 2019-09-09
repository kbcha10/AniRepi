//
//  PostViewController.swift
//  aniRecipe
//
//  Created by kaho-hayashi on 2019/08/30.
//  Copyright © 2019 Cookpad Inc. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // NavigationBarを非表示にしたい場合
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
