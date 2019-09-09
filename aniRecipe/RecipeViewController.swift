//
//  RecipeViewController.swift
//  aniRecipe
//
//  Created by kaho-hayashi on 2019/08/28.
//  Copyright © 2019 Cookpad Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import Social

class RecipeViewController: UIViewController {
    var recipe: [String]!
    var recipeHow: [String]!
    var recipeIngredient: [[String]]!
    @IBOutlet var recipeView: UIView!
    @IBOutlet var animeImage: UIImageView!
    @IBOutlet var realImage: UIImageView!
    @IBOutlet var tagLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var commentConstraint: NSLayoutConstraint!
    @IBOutlet var ingredientView: UIView!
    @IBOutlet var ingredientName: UILabel!
    @IBOutlet var ingredientNum: UILabel!
    @IBOutlet var ingredientConstraint: NSLayoutConstraint!
    @IBOutlet var howTo: UILabel!
    @IBOutlet var howToView: UIView!
    @IBOutlet var howToConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = recipe[1]
        
        //画像をセット
        let storageref = Storage.storage().reference(forURL: "gs://group-e-843e0.appspot.com/image/\(recipe[2]).png")
        animeImage.sd_setImage(with: storageref)
        let storageref2 = Storage.storage().reference(forURL: "gs://group-e-843e0.appspot.com/image2/\(recipe[2]).png")
        realImage.sd_setImage(with: storageref2)
        
        self.navigationController?.hidesBarsOnSwipe = true
        
        
        
        //コメントの設定
        commentLabel.text = recipe[3]
        var rect0: CGSize = commentLabel.sizeThatFits(CGSize(width: 331, height: CGFloat.greatestFiniteMagnitude))
        commentConstraint.constant = 50+rect0.height
        
        //材料の高さによる設定
        var ingredientText: String! = ""
        for i in 0..<recipeIngredient.count {
            ingredientText += recipeIngredient[i][0]
            if(i != recipeIngredient.count-1){
                ingredientText += "\n"
            }
        }
        ingredientName.text = ingredientText
        ingredientText = ""
        for i in 0..<recipeIngredient.count {
            ingredientText += recipeIngredient[i][1]
            if(i != recipeIngredient.count-1){
                ingredientText += "\n"
            }
        }
        ingredientNum.text = ingredientText
        var rect: CGSize = ingredientName.sizeThatFits(CGSize(width: 331, height: CGFloat.greatestFiniteMagnitude))
        let ingredientHeight = rect.height
        ingredientName.frame.size.height = ingredientHeight
        ingredientNum.frame.size.height = ingredientHeight
        ingredientConstraint.constant = 50+rect.height
        
        //作り方の高さによる設定
        var howToText: String! = ""
        for i in 0..<recipeHow.count {
            howToText += recipeHow[i]
            if(i != recipeHow.count-1){
                howToText += "\n\n"
            }
        }
        howTo.text = howToText
        var rect2: CGSize = howTo.sizeThatFits(CGSize(width: 331, height: CGFloat.greatestFiniteMagnitude))
        howTo.frame.size.height = rect2.height
        howToConstraint.constant = 80 + rect2.height
        
        //ページの長さ設定
        recipeView.translatesAutoresizingMaskIntoConstraints = true
        recipeView.frame.size.height = 667+rect.height+rect2.height+1018
        
        tagLabel.text = "#"+recipe[0]
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func share(sender: AnyObject) {
        let text = recipe[1]+"\n#"+recipe[0]+" #あにれぴ\n #cookpad_summer_intern"
        let sampleUrl = NSURL(string: "http://cookpad.com/recipe/1348038")!
        let items = [text, sampleUrl] as [Any]
        
        // UIActivityViewControllerをインスタンス化
        let activityVc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        // UIAcitivityViewControllerを表示
        self.present(activityVc, animated: true, completion: nil)
    }
}

extension UIView {
    
    // 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    // 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    // 角丸設定
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

