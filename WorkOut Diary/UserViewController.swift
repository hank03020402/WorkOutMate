//
//  UserViewController.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/28.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class UserViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var exercises = [Exercise]()
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keyWords = searchBar.text ?? ""
        exercises = Exercise.retrieveExercise().filter({$0.name == keyWords})
        tableView.reloadData()
        self.view.endEditing(true)
        self.searchController.dismiss(animated: true, completion: nil)
        
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCell
        let row = indexPath.row
        let exercise = exercises[row]
        cell.nameLabel.text = exercise.name
        return cell
    }
    
    
}
