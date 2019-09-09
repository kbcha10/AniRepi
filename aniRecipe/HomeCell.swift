//
//  HomeCell.swift
//  aniRecipe
//
//  Created by kaho-hayashi on 2019/08/27.
//  Copyright © 2019 Cookpad Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class HomeCell: UICollectionViewCell {
    @IBOutlet weak var animeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet var heartButton: UIButton!
    var isHeart: Bool = false
    //var ref:DatabaseReference!
    
    /*func setupCell(model: Model) {
     title.text = model.title
     
     if let text = model.subTitle {
     subTitle.text = text
     }
     
     self.backgroundColor = .lightGray
     }*/
    func setupCell(homeRecipe: [[String]], num: Int) {
        
        print(homeRecipe)
        //print(num)
        if homeRecipe.isEmpty{
            
        } else {
            animeLabel!.text = "#"+homeRecipe[num][0]
            titleLabel!.text = homeRecipe[num][1]
            //画像をセット
            let storageref = Storage.storage().reference(forURL: "gs://group-e-843e0.appspot.com/image/\(homeRecipe[num][2]).png")
            recipeImage.sd_setImage(with: storageref)
        }
        
    }
    @IBAction func heartTapped(){
        
        if(!isHeart){
            print("empty")
            heartButton.setImage(UIImage(named: "heart_full.png"), for: .normal)
            isHeart = true
        } else {
            heartButton.setImage(UIImage(named: "heart_empty.png"), for: .normal)
            isHeart = false
        }
    }
}

