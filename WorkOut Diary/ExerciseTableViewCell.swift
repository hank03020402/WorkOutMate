//
//  TableViewCell.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/28.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import UIKit

class ExerciseTableViewCell : UITableViewCell{
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBOutlet weak var weightTextField: UITextField!

    @IBOutlet weak var repTextField: UITextField!
    
    @IBOutlet weak var setLabel: UILabel!
    
}
