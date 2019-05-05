//
//  WorkoutTableViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    
    let data = Data()
    //var workoutIndex: Int?
    var currentWorkout: [Exercise] = []
    
    @IBOutlet var exercisesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercisesTableView.dataSource = self
        exercisesTableView.delegate = self
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWorkout.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO
        return UITableViewCell()
    }
}
