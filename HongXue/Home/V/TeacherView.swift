//
//  TeacherView.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/9.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class TeacherView: UIView {

    @IBOutlet weak var WatchBtn: UIButton!
    static func newInstance() -> TeacherView?{
        let nibView = Bundle.main.loadNibNamed("TeacherView", owner: nil, options: nil)
        if let view = nibView?.first as? TeacherView{
            view.backgroundColor = Common.teacherViewBackGray
            view.WatchBtn.backgroundColor = Common.mainRed
            return view
        }
        return nil
    }

}
