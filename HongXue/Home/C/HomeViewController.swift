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
    private var tableView:UITableView!
    private var informationArr:[HXInformationData]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI(){
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        
        weak var weakSelf = self
        HXNetwork.shareNetworkTool.loadInformationData { (informationArr) in
            DispatchQueue.main.async {
                 weakSelf?.informationArr = informationArr
                 weakSelf?.setupInformationSection()
            }
            
        }
        let banner = Banner(frame: CGRect(x: 0, y: 0, width: Common.screenWidth , height: bannerH))
        scrollView.addSubview(banner)
        
        setupSideMenu()
        
        setupVideoSection()
        
        setupBattleSection()
        
        setupTeacherSection()
        
        scrollView.contentSize = CGSize(width: Common.screenWidth, height: bannerH + (Common
            .videoViewHeight) * 2 + Common.informationViewHeight + Common.teacherSectionHeight + 64) 
        
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
        
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.titleViewHeight))
        titleView.viewTitleLabel.text = "资讯"
        titleView.viewSubTitleLabel.text = "带你了解最新资讯"
        informationSectionView.addSubview(titleView)
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: Common.titleViewHeight, width: Common.screenWidth, height: 500))
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: String(describing: InformationCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InformationCell")
        tableView.rowHeight = 100
        informationSectionView.addSubview(tableView)
        
        scrollView.addSubview(informationSectionView)
        
    }
    
    private func setupBattleSection(){
        
        let battleSectionView = UIView(frame: CGRect(x: 0, y: bannerH + Common
            .videoViewHeight + Common.informationViewHeight, width: Common.screenWidth, height: Common.videoViewHeight))
        let battleVC = BattleReviewViewController()
        addChildViewController(battleVC)
        battleSectionView.addSubview(battleVC.view)
        scrollView.addSubview(battleSectionView)
        
    }
    
    private func setupTeacherSection(){
        
        
        let teacherView = UIView(frame: CGRect(x: 0, y: bannerH + (Common
            .videoViewHeight) * 2 + Common.informationViewHeight, width: Common.screenWidth, height: Common.teacherSectionHeight))
        
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.titleViewHeight))
        titleView.viewTitleLabel.text = "名师风采"
        titleView.viewSubTitleLabel.text = "最新鲜的干货讲解"
        teacherView.addSubview(titleView)
        
        let viewWidth = (Common.screenWidth - 4 * Common
            .tenPxMargin) / 3
        for i in 0 ..< 3 {
            
            let View = TeacherView.newInstance()
            View?.frame = CGRect(x: CGFloat(i+1) * Common.tenPxMargin + CGFloat(i) * viewWidth, y: Common.titleViewHeight, width: viewWidth, height: 180)
    
      
            teacherView.addSubview(View!)
        }
        scrollView.addSubview(teacherView)
        
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


extension HomeViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
        cell.data = informationArr[indexPath.row]
        return cell
        
    }
    
    
    
}
