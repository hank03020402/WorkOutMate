//
//  ExerciseViewController.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/28.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import UIKit
class ExerciseViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var exercise: Exercise?
    var sets = [Set]()
  
    var timer = Timer()
   var counter = 0
    @IBOutlet weak var exerciseTableView: UITableView!
    
    override func viewDidLoad() {

          self.navigationController?.isNavigationBarHidden = true
        exerciseTableView.reloadData()
        exercise = self.exercise ?? Exercise.newExercise()
        exerciseNameTextField.text = exercise?.name ?? ""
        exerciseTableView.dataSource = self
        exerciseTableView.delegate = self
        
        if let currentRow = TableViewController.selectedRow {
            let he = Set.retrieveSets().filter({($0.exercise?.workout?.id)! == PreviousViewController.selectedRow!})
            sets = he.filter({$0.exercise?.id == currentRow})
        }
        
    }
   
    @IBOutlet weak var exerciseNameTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var repTextField: UITextField!
    
    
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        let set = Set.newSet()
        set.repetition = Int16(repTextField.text!)!
        set.weight = (Double(weightTextField.text!))!
        set.exerciseName = exerciseNameTextField.text
        set.exercise = self.exercise
        Set.saveSet()
        sets.append(set)
        exerciseTableView.reloadData()
        
    }
    
    @IBAction func finishTapped(_ sender: UIButton) {
        exercise?.name = exerciseNameTextField.text ?? ""
        
        exercise?.time = Date() as NSDate
        let workouts = WorkOut.retrieveWorkOuts()
        exercise?.workout = workouts[WorkOut.retrieveWorkOuts().count-1]
        exercise?.workout?.id =  Int16(WorkOut.retrieveWorkOuts().count-1)
        for set in sets {
            set.exercise?.workout?.id =  Int16(WorkOut.retrieveWorkOuts().count-1)
        }
        if let id = TableViewController.selectedRow{
            for set in sets{
                set.exercise?.id = id
            }
            exercise?.id = id
        }
        else{
            for set in sets{
                set.exercise?.id = TableViewController.count
            }
            exercise?.id = TableViewController.count
        }
        Set.saveSet()
        Exercise.saveExercise()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                Exercise.saveExercise()
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCell", for: indexPath) as! ExerciseTableViewCell
        
        let row = indexPath.row
        let set = sets[row]
        
        cell.setLabel.text = "Set#\(row+1)"
        cell.weightTextField.text = String(describing: set.weight)
        cell.repTextField.text = String(describing: set.repetition)
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Set.delete(set: sets[indexPath.row])
            if let id = TableViewController.selectedRow{
                sets = Set.retrieveSets().filter({$0.exercise?.id == id})
            }
            else{
                sets = Set.retrieveSets().filter({$0.exercise?.id == TableViewController.count})
            }
            exerciseTableView.reloadData()
        }
    }
    
}
