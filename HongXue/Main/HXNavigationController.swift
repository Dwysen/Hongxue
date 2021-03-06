
//

import UIKit

class HXNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = Common.e51c24  
        
//       NSAttributedStringKey.foregroundColor
        navBar.isTranslucent = false
    
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        
    }
    
    @objc private func test(){
        
        print("yes")
        
    }
    
////    func initialize() {
//
//        /// 设置导航栏标题
//    }
//        navBar.titleTextAttributes = [: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
//    }
    /**
     # 统一所有控制器导航栏左上角的返回按钮
     # 让所有push进来的控制器，它的导航栏左上角的内容都一样
     # 能拦截所有的push操作
     - parameter viewController: 需要压栈的控制器
     - parameter animated:       是否动画
     */
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        /// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0 {
            // push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    /// 返回按钮
    @objc func navigationBackClick() {
//        if SVProgressHUD.isVisible() {
//            SVProgressHUD.dismiss()
//        }
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }
    
}
