//
//  InformationCell.swift
//  HongXue
//
//  Created by 王彦森 on 2017/10/8.
//  Copyright © 2017年 boxin. All rights reserved.
//

import UIKit

class InformationCell: UITableViewCell {

    var data:HXInformationData?{
        didSet{
            titleLabel.text = data?.title
            timeLabel.text = data?.time
            
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
