//
//  OpenClassHistoryViewController.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/10.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class OpenKungFuViewController: UIViewController {
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        
        setupTableView()
        
    }
    
    private func setupTableView(){
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.openScrollViewHeight ))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300 
        
        view.addSubview(tableView)
        
        tableView.register(UINib.init(nibName: "KungFuCell", bundle: nil), forCellReuseIdentifier: "KungFuCell")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

extension OpenKungFuViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KungFuCell", for: indexPath) as! KungFuCell
        
        return cell
    }
    
    
}

