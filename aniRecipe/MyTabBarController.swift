import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self // UITabBarControllerDelegate
    }
}

// MARK: - UITabBarControllerDelegateに適合
extension TabBarController: UITabBarControllerDelegate {
    // TabBarItemが選択された時に呼ばれる
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        // TabBarItemタップでModal表示をする画面を指定して実装
        if viewController is PostViewController {
            if let newVC = UIStoryboard(name: "Target", bundle: nil).instantiateInitialViewController() {
                tabBarController.present(newVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
}
