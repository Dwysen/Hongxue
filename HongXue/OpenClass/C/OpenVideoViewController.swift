
//
//  OpenVideoViewController.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/10.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class OpenVideoViewController: UIViewController {
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        // scrllView - navH:64 - tabbarH:49 - titleH:35
        scrollView.frame = CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.screenHeight - 64 - 49 - 35)
        return scrollView
    }()
    
    private let videoViewHeight:CGFloat = 258
    private let tableViewHeight:CGFloat = 210
    
    private var tableView:UITableView!
    
    private lazy var videoView:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: videoViewHeight))
        view.backgroundColor = UIColor.cyan
        return view
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        view.addSubview(scrollView)
        
        scrollView.addSubview(videoView)
        
        setupTableView()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView(){
        
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: 50))
        headView.backgroundColor = UIColor.yellow
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: videoViewHeight, width: Common.screenWidth, height: tableViewHeight ))
        tableView.tableHeaderView = headView
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        
        tableView.rowHeight = 40
        tableView.register(OpenVideoCell.self, forCellReuseIdentifier: "OpenVideoCell")
        scrollView.addSubview(tableView)
        
        print(tableView.maxY)
        
        scrollView.contentSize = CGSize(width: Common.screenWidth, height: videoViewHeight + tableViewHeight)
        
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

extension OpenVideoViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OpenVideoCell", for: indexPath) as! OpenVideoCell
        
        
        return cell
        
    }
    
    
}
