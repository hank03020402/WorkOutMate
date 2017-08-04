//
//  UserViewController.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/28.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import UIKit

class UserViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
          self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
