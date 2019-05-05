//
//  WorkoutTableViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data = Data()
    var currentWorkout: [Exercise] = []
    
    @IBOutlet var exercisesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercisesTableView.dataSource = self
        exercisesTableView.delegate = self
        exercisesTableView.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWorkout.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as? WorkoutTableViewControllerCell {
            let exercise = currentWorkout[indexPath.row]
            cell.exerciseNameLabel.text = exercise.name
            if exercise.compound {
                cell.setsAndRepsLabel.text = "4 x 6 reps"
            } else {
                cell.setsAndRepsLabel.text = "3 x 8-12 reps"
            }
            return cell
        }
        return UITableViewCell()
    }
}
