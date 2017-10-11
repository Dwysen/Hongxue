//
//  CaseViewController.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/10.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit
import PullToRefreshKit
import MJRefresh

class CaseViewController: UIViewController {
    
    var tableView:UITableView!
    var battleArr:[HXBattleData]?
//    var refreshControl = UIRefreshControl()
    
    var nextIndex = 2
    
    let footer = MJRefreshAutoNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HXNetwork.shareNetworkTool.loadBattleReviewData(index: 1) { (battleArr) in
            self.battleArr = battleArr
            DispatchQueue.main.async {
                self.setupTableView()
            }
        }
        
        
        // Do any additional setup after loading the view.
        
    }
    
    private func setupTableView(){
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.screenHeight - 64 - 49 - 35))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Common.screenWidth / 2
        tableView.register(CaseCell.self, forCellReuseIdentifier: "cell")
        
        //         self.tableView.setUpFooterRefresh {  [weak self] in
        //
        //            print("1111")
        //
        //
        //            HXNetwork.shareNetworkTool.loadBattleReviewData(index: self!.nextIndex, finished: { (arr) in
        //
        //                for battle in arr {
        //                    self?.battleArr?.append(battle)
        //                }
        //
        //                self?.tableView.endFooterRefreshing()
        //
        //                self?.tableView.reloadData()
        //
        //                self?.nextIndex += 1
        //
        //            })
        //
        //        }
        
        
        
        view.addSubview(tableView)
        
        
        tableView.mj_footer = footer
        footer.setRefreshingTarget(self, refreshingAction: #selector(refresh))
        
//        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        refreshControl.attributedTitle = NSAttributedString(string: "下拉加载更多")
//        tableView.addSubview(refreshControl)
        
        
    }
    
    @objc private func refresh(){
        
        print("get Data from sever")
        
  
        HXNetwork.shareNetworkTool.loadBattleReviewData( index: self.nextIndex, finished: { (arr) in

            for battle in arr {
                self.battleArr?.append(battle)
            }

            self.footer.endRefreshingWithNoMoreData()
            
            self.tableView.reloadData()

            self.nextIndex += 1

        })
        
      
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CaseViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return battleArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CaseCell
        cell.battleData = battleArr![indexPath.row]
        return cell
    }
    
    
}
