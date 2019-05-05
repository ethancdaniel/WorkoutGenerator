//
//  WorkoutTableViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit
import Firebase

class WorkoutTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data = Data()
    var currentWorkout: [Exercise] = []
    var exerciseToDisplay: Exercise?
    var ref: DatabaseReference!
    
    @IBOutlet var exercisesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercisesTableView.dataSource = self
        exercisesTableView.delegate = self
        exercisesTableView.rowHeight = 60
        ref = Database.database().reference()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exerciseToDisplay = currentWorkout[indexPath.row]
        performSegue(withIdentifier: "workoutToExercise", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ExerciseViewController {
            dest.exercise = exerciseToDisplay!
        }
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Save Workout", message: "Enter a name for this workout", preferredStyle: .alert)
        let savedConfirmation = UIAlertController(title: "Workout Saved!", message: "", preferredStyle: .alert)
        savedConfirmation.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addTextField { (textField) in
            textField.placeholder = "Cool workout"
            textField.addTarget(alert, action: #selector(alert.textDidChangeInLoginAlert), for: .editingChanged)
        }
        let action = UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            guard let text = alert?.textFields![0].text else { return }
            if let user = Auth.auth().currentUser {
                for exercise in self.currentWorkout {
                    self.ref.child("Saved Workouts").child(user.uid).child(text).child(exercise.name).setValue(["isCompound": exercise.compound])
                }
            }
            self.present(savedConfirmation, animated: true, completion: nil)
        })
        action.isEnabled = false
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIAlertController {
    
    func isValidText(_ text: String) -> Bool {
        return text != nil && text != ""
    }
    
    @objc func textDidChangeInLoginAlert() {
        if let text = textFields?[0].text,
            let action = actions.last {
            action.isEnabled = isValidText(text)
        }
    }
}

