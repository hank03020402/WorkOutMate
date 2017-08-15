//
//  PreviousViewController.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/28.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import UIKit
class PreviousViewController : UITableViewController{
    
    @IBOutlet var previousTableView: UITableView!
    var workouts: [WorkOut]?
    static var selectedRow: Int16?
    override func viewDidLoad() {
        super.viewDidLoad()
        workouts = WorkOut.retrieveWorkOuts()
          self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (workouts?.count)!
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousCell", for: indexPath) as! PreviousCell
        let workout = workouts?[indexPath.row]
        cell.workoutNameLabel.text = workout?.name ?? "WorkOut"
        cell.workoutTimeLabel.text = workout?.time?.convertToString()
        return cell
  }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PreviousViewController.selectedRow = Int16(indexPath.row)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            WorkOut.delete(workout: (workouts?[indexPath.row])!)
            workouts = WorkOut.retrieveWorkOuts()
            previousTableView.reloadData()
        }
        
    }
}
