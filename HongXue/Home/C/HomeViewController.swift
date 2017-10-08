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

    private let bannerH:CGFloat = Common.screenWidth / 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI(){
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        
        
        let banner = Banner(frame: CGRect(x: 0, y: 0, width: Common.screenWidth , height: bannerH))
        scrollView.addSubview(banner)
        
        setupSideMenu()
        
        setupVideoSection()
        
        setupInformationSection()
        
        scrollView.contentSize = CGSize(width: Common.screenWidth, height: 1000)
        
    }
    
    private func setupSideMenu(){
        
      self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "菜单", style:.plain, target: self, action: #selector(leftMenuClick))
        
        let leftMenu = UISideMenuNavigationController(rootViewController: SideMenuTableView())
        //        leftMenu.leftSide = true
        SideMenuManager.menuLeftNavigationController = leftMenu
        
        SideMenuManager.menuFadeStatusBar = false
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
    }
    
    private func setupVideoSection(){
        
        let videoSectionView = UIView(frame: CGRect(x: 0, y: bannerH, width: Common.screenWidth, height: Common.videoViewHeight))
        let videoVC = VideoViewController()
        addChildViewController(videoVC)
        videoSectionView.addSubview(videoVC.view)
        scrollView.addSubview(videoSectionView)
        
    }
    
    private func setupInformationSection(){
        
        let informationSectionView = UIView(frame: CGRect(x: 0, y: bannerH + Common.videoViewHeight, width: Common
            .screenWidth, height: Common.informationViewHeight))
        let informationVC = InformationViewController()
        addChildViewController(informationVC)
        informationSectionView.addSubview(informationVC.view)
        
    
         scrollView.addSubview(informationSectionView)
        
        
        
    }
    
    @objc private func leftMenuClick(){
        
        present(SideMenuManager.menuLeftNavigationController!, animated: true
        , completion: nil)
    
    }
    
    /// 懒加载创建 scrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
      
        scrollView.frame = CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.screenHeight)
        return scrollView
    }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
