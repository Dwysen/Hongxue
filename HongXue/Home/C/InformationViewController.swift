//
//  InformationViewController.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/8.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        
        view.backgroundColor = UIColor.brown
        view.height = Common.informationViewHeight
        
        setupInformationView()
        
        
        
    }
    
    private func setupInformationView(){
        
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.titleViewHeight))
        view.addSubview(titleView)
        
        tableView = UITableView(frame: CGRect(x: 0, y: Common.titleViewHeight, width: Common.screenWidth, height: 1000))
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: String(describing: InformationCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InformationCell")
        tableView.rowHeight = 100
        
        
        view.addSubview(tableView)
        
//        for i in 0 ..< 5 {
//            let singleInformationView = SingleInformationView(frame: CGRect(x: 0, y: Common
//                .titleViewHeight + CGFloat(i) * 170, width: Common.screenWidth, height: 170))
//            let tap = UITapGestureRecognizer(target: self
//                , action: #selector(tapInformation))
//            tap.view?.tag = i
//
//            singleInformationView.addGestureRecognizer(tap)
//            view.addSubview(singleInformationView)
//        }
        
        
        
        
    }
    
    @objc private func tapInformation(sender:UITapGestureRecognizer){
        print(sender.view?.tag ?? 0)
        
    
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

extension InformationViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
        .dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath)
        return cell
        
    }
    
    
    
}

