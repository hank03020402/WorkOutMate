//
//  TableViewController.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/28.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import UIKit
class TableViewController : UITableViewController {
    static var selectedRow : Int16? = nil
    static var count:Int16 = -1
    @IBOutlet weak var workoutNameTextField: UITextField!
    var workout: WorkOut? 
    @IBOutlet var workoutTableView: UITableView!
    override func viewDidLoad() {
        let swipeBack = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeBack.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeBack)
       workoutTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        for exercise in exercises{
            if exercise.time == nil{
                print("There is an empty one!")
                Exercise.delete(exercise: exercise)
            }
        }
        super.viewDidLoad()
       if let result = PreviousViewController.selectedRow{
            exercises = Exercise.retrieveExercise().filter({$0.workout?.id == result })
        }
       else{
        exercises = Exercise.retrieveExercise().filter({$0.workout?.id == Int16(WorkOut.retrieveWorkOuts().count-1 )})
        }
        
        TableViewController.count = Int16(exercises.count-1)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toModifyExercise" {
               let indexPath = tableView.indexPathForSelectedRow!
                let exercise = exercises[indexPath.row]
                TableViewController.selectedRow = Int16(indexPath.row)
                let ExerciseViewController = segue.destination as! ExerciseViewController
                // 4
                ExerciseViewController.exercise = exercise
               
                
            } else if identifier == "toAddExercise" {
                TableViewController.selectedRow = nil
                TableViewController.count = TableViewController.count + 1
            }
            else if identifier == "toSaveExercise"{
                if PreviousViewController.selectedRow == nil{
                    let workouts = WorkOut.retrieveWorkOuts()
                    let workout = workouts[WorkOut.retrieveWorkOuts().count-1]
                if workout.exercises != nil{
                    workout.time = Date() as NSDate
                    workout.id =  Int16(WorkOut.retrieveWorkOuts().count-1)
                    workout.name = workoutNameTextField.text ?? "WorkOut\( Int16(WorkOut.retrieveWorkOuts().count))"
                   
                WorkOut.saveWorkOut()
                }
                else{
                    WorkOut.delete(workout: workout)
                    }
                }
                else{
                    let workouts = WorkOut.retrieveWorkOuts()
                    let workout = workouts[Int(PreviousViewController.selectedRow!)]
                    for exercise in exercises{
                        exercise.workout = workout
                        exercise.workout?.id = PreviousViewController.selectedRow!
                        Exercise.saveExercise()
                    }
                }
            }
        
        }
        
    }
    var exercises = [Exercise]() {
        didSet {
            tableView.reloadData()
        }
    }
   
  
    
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        // 1
        let row = indexPath.row
        
        // 2
        let exercise = exercises[row]
        
        // 3
        cell.exerciseNameLabel.text = exercise.name
        
        cell.timeLabel.text = exercise.time?.convertToString()
        
        return cell
    }
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue){
        self.exercises = Exercise.retrieveExercise()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Exercise.delete(exercise: exercises[indexPath.row])
            if let id = TableViewController.selectedRow{
                exercises = Exercise.retrieveExercise().filter({$0.workout?.id == id})
            }
            else{
                exercises = Exercise.retrieveExercise().filter({$0.workout?.id ==  Int16(WorkOut.retrieveWorkOuts().count-1)})
            }
            workoutTableView.reloadData()
        }

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TableViewController.selectedRow = Int16(indexPath.row)
    }
}
extension UIViewController{
    func swipeAction(swipe: UISwipeGestureRecognizer){
        performSegue(withIdentifier: "back", sender: self)
    }
}
