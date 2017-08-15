//
//  ViewController.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/28.
//  Copyright © 2017年 Hank. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
          self.navigationController?.isNavigationBarHidden = true
        if revealViewController() != nil{
      self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        if revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "toTrackmyWorkout"{
                PreviousViewController.selectedRow = nil
               _ = WorkOut.newWorkOut()
                WorkOut.saveWorkOut()
        }
    }
  }
}
