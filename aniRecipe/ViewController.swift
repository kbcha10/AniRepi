import UIKit
import Firebase
import SwiftyJSON


class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ref:DatabaseReference!
    var recipes = [[String]]()
    var selectCell: [String]!
    var selectHow: [String]!
    var selectIngredient: [[String]]!
    var recipeHow = [[String]]()
    var recipeIngredient = [[[String]]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "あにれぴ！"
        self.navigationController?.navigationBar.titleTextAttributes
            = [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.init(red: 244/255, green: 144/255, blue: 5/255, alpha: 100/100)
        ]
        ref = Database.database().reference()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //コレクションビューのカスタムセルを設定
        collectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 226)
        collectionView.collectionViewLayout = layout
   
        //Firebase読み込み
        let ref = Database.database().reference()
        
        //データが欲しい childAdded
        ref.child("recipeTable").observe(.value , with: { (snapshot: DataSnapshot) in
            
            //JSON形式でもらいたい　オートIDから
            let getjson = JSON(snapshot.value as? [String : AnyObject] ?? [:])
            //print(getjson["recipe01"]["how"])
            
            //データが0件の場合何もしない
            if getjson.count == 0 { return }
            for (key, val) in getjson.dictionaryValue{
                let anime: String = getjson[key]["anime"].stringValue
                let name: String = getjson[key]["name"].stringValue
                let recipeID: String = getjson[key]["recipeID"].stringValue
                let comment: String = getjson[key]["comment"].stringValue
                self.recipes.append([anime,name, recipeID,comment])
                
                //作り方の配列を作る
                self.recipeHow.append([])
                for i in 1..<getjson[key]["how"].count {
                    self.recipeHow[self.recipeHow.count-1].append(getjson[key]["how"]["0\(i)"].stringValue)
                }
                
                //材料の配列を作る
                self.recipeIngredient.append([])
                for i in 1..<getjson[key]["ingredients"].count { self.recipeIngredient[self.recipeIngredient.count-1].append([getjson[key]["ingredients"]["ingredient\(i)"]["ingreName"].stringValue,getjson[key]["ingredients"]["ingredient\(i)"]["ingreNum"].stringValue])
                }
            }
            
            self.collectionView.reloadData()
        })
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("OK!")
        selectCell = recipes[indexPath.item]
        selectHow = recipeHow[indexPath.item]
        selectIngredient = recipeIngredient[indexPath.item]
        //print(recipes)
        // Identifierが"Segue"のSegueを使って画面遷移する関数
        performSegue(withIdentifier: "ToRecipePage", sender: nil)
    }
    // 画面遷移先のViewControllerを取得し、データを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToRecipePage" {
            let vc = segue.destination as! RecipeViewController
            vc.recipe = selectCell
            vc.recipeHow = selectHow
            vc.recipeIngredient = selectIngredient
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    //セルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    //セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath)
        
        /*if let cell = cell as? HomeCell {
         cell.setupCell(model: models[indexPath.row])
         }*/
        if let cell = cell as? HomeCell {
            
            //print(self.recipes)
            cell.setupCell(homeRecipe:recipes, num:indexPath.row)
        }
        
        return cell
    }
    
}
