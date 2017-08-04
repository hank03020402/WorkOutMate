//
//  TableViewCell.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/30.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import UIKit
class TableViewCell : UITableViewCell{
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
}
