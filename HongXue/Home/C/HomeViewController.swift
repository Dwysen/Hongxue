//
//  ViewController.swift
//  HongXue
//
//  Created by 王彦森 on 2017/9/26.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit
import Kingfisher

import SideMenu


class HomeViewController: UIViewController {

    var topView:UIView!
    
    var swipeLeft :UISwipeGestureRecognizer!;   // 左滑手势
    var swipeRight :UISwipeGestureRecognizer!;  // 右滑手势
    
    var bottomView:UIView!        // 底层view
    var aboveView:UIView!         // 表层view
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        SideMenuManager.menuFadeStatusBar = false
        
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        

        

    }
    func setupUI(){
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "菜单", style:.plain, target: self, action: #selector(leftMenuClick))
        
        view.backgroundColor = UIColor.white
        let banner = Banner(frame: CGRect(x: 0, y: 64, width: Common.screenWidth , height: Common.screenWidth / 3))
        view.addSubview(banner)
        
        let leftMenu = UISideMenuNavigationController(rootViewController: SideMenuTableView())
//        leftMenu.leftSide = true 
        SideMenuManager.menuLeftNavigationController = leftMenu
    
    }
    
    @objc private func leftMenuClick(){
        
        present(SideMenuManager.menuLeftNavigationController!, animated: true
        , completion: nil)
        
        
    

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
