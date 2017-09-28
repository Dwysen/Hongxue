////
////  ViewController.swift
////  HongXue
////
////  Created by 王彦森 on 2017/9/28.
////  Copyright © 2017年 boxin. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    var homeViewController = HXTabBarController()
//    var leftViewController = LeftViewController()
//    
//    
//    // 禁止右滑的状态
//    var banRight = true
//    
//    var distance: CGFloat = 0
//    let FullDistance: CGFloat = 0.78
//    let Proportion: CGFloat = 0.77
//    var centerOfLeftViewAtBeginning: CGPoint!
//    var proportionOfLeftView: CGFloat = 1
//    var distanceOfLeftView: CGFloat = 50
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let imageView = UIImageView(frame: UIScreen.main.bounds)
//        imageView.backgroundColor = UIColor.cyan
//        self.view.addSubview(imageView)
//        
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
//        homeViewController.view.addGestureRecognizer(pan)
//        self.view.addSubview(homeViewController.view)
//        
//        leftViewController.view.center = CGPoint(x: leftViewController.view.center.x - 50, y: leftViewController.view.center.y)
//        leftViewController.view.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
//        
//        // 动画参数初始化
//        centerOfLeftViewAtBeginning = leftViewController.view.center
//        // 把侧滑菜单视图加入根容器
//        //        self.view.addSubview(leftViewController.view)
//        
//        
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    @objc func pan(_ recongnizer: UIPanGestureRecognizer) {
//        
//      
//        
//        
//        var x = recongnizer.translation(in: self.view).x
//        print(x)
//        
//        if banRight && x < 0  {
//            return
//        }
//        
//        let trueDistance = distance + x // 实时距离
//        
//        let trueProportion = trueDistance / (Common.screenWidth*FullDistance)
//        
//        // 如果 UIPanGestureRecognizer 结束，则激活自动停靠
//        if recongnizer.state == UIGestureRecognizerState.ended {
//            
//            if trueDistance > Common.screenWidth * (Proportion / 3) {
//                showLeft()
//                banRight = false
//            } else if trueDistance < Common.screenWidth * -(Proportion / 3) {
//                //              showRight()
//                print("showRight")
//            } else {
//                showHome()
//                banRight = true
//            }
//           
//            return
//        }
//        
//        // 计算缩放比例
//        var proportion: CGFloat = recongnizer.view!.frame.origin.x >= 0 ? -1 : 1
//        proportion *= trueDistance / Common.screenWidth
//        proportion *= 1 - Proportion
//        proportion /= FullDistance + Proportion/2 - 0.5
//        proportion += 1
//        if proportion <= Proportion { // 若比例已经达到最小，则不再继续动画
//            return
//        }
//        // 执行视差特效
//        //        blackCover.alpha = (proportion - Proportion) / (1 - Proportion)
//        // 执行平移和缩放动画
//        recongnizer.view!.center = CGPoint(x: self.view.center.x + trueDistance, y: self.view.center.y)
//        recongnizer.view!.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
//        
//        // 执行左视图动画
//        let pro = 0.8 + (proportionOfLeftView - 0.8) * trueProportion
//        leftViewController.view.center = CGPoint(x: centerOfLeftViewAtBeginning.x + distanceOfLeftView * trueProportion, y: centerOfLeftViewAtBeginning.y - (proportionOfLeftView - 1) * leftViewController.view.frame.height * trueProportion / 2 )
//        leftViewController.view.transform = CGAffineTransform.identity.scaledBy(x: pro, y: pro)
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func showLeft() {
//        // 给首页 加入 点击自动关闭侧滑菜单功能
//        //        mainView.addGestureRecognizer(tapGesture)
//        // 计算距离，执行菜单自动滑动动画
//        distance = self.view.center.x * (FullDistance*2 + Proportion - 1)
//        doTheAnimate(self.Proportion, showWhat: "left")
//        //        homeNavigationController.popToRootViewController(animated: true)
//    }
//    // 展示主视图
//    func showHome() {
//        // 从首页 删除 点击自动关闭侧滑菜单功能
//        //        mainView.removeGestureRecognizer(tapGesture)         // 计算距离，执行菜单自动滑动动画
//        distance = 0
//        doTheAnimate(1, showWhat: "home")
//    }
//    // 展示右视图
//    
//    func doTheAnimate(_ proportion: CGFloat, showWhat: String) {
//        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
//            // 移动首页中心
//            self.homeViewController.view
//                .center = CGPoint(x: self.view.center.x + self.distance, y: self.view.center.y)
//            // 缩放首页
//            self.homeViewController.view.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
//            if showWhat == "left" {
//                // 移动左侧菜单的中心
//                self.leftViewController.view.center = CGPoint(x: self.centerOfLeftViewAtBeginning.x + self.distanceOfLeftView, y: self.leftViewController.view.center.y)
//                // 缩放左侧菜单
//                self.leftViewController.view.transform = CGAffineTransform.identity.scaledBy(x: self.proportionOfLeftView, y: self.proportionOfLeftView)
//            }
//            // 改变黑色遮罩层的透明度，实现视差效果
//            //            self.blackCover.alpha = showWhat == "home" ? 1 : 0
//            
//            // 为了演示效果，在右侧菜单划出时隐藏漏出的左侧菜单，并无实际意义
//            self.leftViewController.view.alpha = showWhat == "right" ? 0 : 1
//        }, completion: nil)
//    }
//    
//    
//}

