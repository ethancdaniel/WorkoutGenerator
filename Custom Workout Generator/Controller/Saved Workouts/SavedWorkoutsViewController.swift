//
//  SavedWorkoutsViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/5/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit
import Firebase

class SavedWorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    var savedWorkouts: [String:[Exercise]] = [:]
    @IBOutlet weak var savedWorkoutsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedWorkoutsTableView.dataSource = self
        savedWorkoutsTableView.delegate = self
        
        if let currentUser = Auth.auth().currentUser {
            ref = Database.database().reference().child("Saved Workouts").child(currentUser.uid)
            ref.observe(DataEventType.value) { (snapshot) in
                for child in snapshot.children.allObjects as! [DataSnapshot] {
                    for exercise in child.children.allObjects as! [DataSnapshot] {
                        let exerciseName = exercise.key
                        let dict = exercise.value as? [String:AnyObject] ?? [:]
                        let isCompound = dict["isCompound"]
                        if let _ = self.savedWorkouts[child.key] {
                            self.savedWorkouts[child.key]!.append(Exercise(name: exerciseName, parts: [], isCompound: isCompound as! Bool))
                        } else {
                            self.savedWorkouts[child.key] = [Exercise(name: exerciseName, parts: [], isCompound: isCompound as! Bool)]
                        }
                    }
                }
                self.savedWorkoutsTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedWorkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell") as? WorkoutNamesTableViewCell {
            cell.workoutName.text = Array(savedWorkouts.keys)[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
