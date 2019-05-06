//
//  ProfileViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/5/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Charts

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var workoutsButton: UIButton!
    @IBOutlet weak var savedWorkouts: UIView!
    @IBOutlet weak var personalStats: UIView!
    @IBOutlet weak var savedWorkoutsTableView: UITableView!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var chart: LineChartView!
    @IBOutlet weak var bmiLabel: UILabel!
    
    
    var ref: DatabaseReference!
    var savedWorkoutsDict: [String:[Exercise]] = [:]
    var selectedWorkout: String?
    var weights: [Double] = []
    var height: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statsButton.isSelected = true
        savedWorkouts.isHidden = true
        personalStats.isHidden = false
        savedWorkoutsTableView.dataSource = self
        savedWorkoutsTableView.delegate = self
        ref = Database.database().reference()
        loadWorkouts()
    }
    
    @IBAction func statsPressed(_ sender: Any) {
        if !statsButton.isSelected {
            statsButton.isSelected = true
            workoutsButton.isSelected = false
            personalStats.isHidden = false
            savedWorkouts.isHidden = true
        }
    }
    
    @IBAction func workoutsPressed(_ sender: Any) {
        if !workoutsButton.isSelected {
            workoutsButton.isSelected = true
            statsButton.isSelected = false
            savedWorkouts.isHidden = false
            personalStats.isHidden = true
        }
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        let weight = Double(weightInput.text!)
        if heightInput.text != "" {
            height = Double(heightInput.text!)!
        }
        weights.append(weight!)
        updateGraph()
        calculateBMI(weight: weight!)
    }
    
    func updateGraph() {
        var lineChartEntry  = [ChartDataEntry]()
        for i in 0..<weights.count {
            let value = ChartDataEntry(x: Double(i), y: weights[i])
            lineChartEntry.append(value)
        }
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Weight")
        line1.colors = [NSUIColor.blue]
        let weightData = LineChartData()
        weightData.addDataSet(line1)
        chart.data = weightData
        chart.chartDescription?.text = "Weight Chart"
    }
    
    func calculateBMI(weight: Double) {
        let bmi = Int(weight / pow(height, 2) * 10000)
        bmiLabel.text! = "BMI: \(bmi)"
    }
    
    func loadWorkouts() {
        if let currentUser = Auth.auth().currentUser {
            ref = Database.database().reference().child("Saved Workouts").child(currentUser.uid)
            ref.observe(DataEventType.value) { (snapshot) in
                for child in snapshot.children.allObjects as! [DataSnapshot] {
                    for exercise in child.children.allObjects as! [DataSnapshot] {
                        var exerciseName = exercise.key
                        let dict = exercise.value as? [String:AnyObject] ?? [:]
                        let isCompound = dict["isCompound"]
                        let imageName = dict["imageName"]
                        exerciseName.remove(at: exerciseName.startIndex)
                        if let _ = self.savedWorkoutsDict[child.key] {
                            self.savedWorkoutsDict[child.key]!.append(Exercise(name: exerciseName, parts: [], isCompound: isCompound as! Bool, imageName: imageName as! String))
                        } else {
                            self.savedWorkoutsDict[child.key] = [Exercise(name: exerciseName, parts: [], isCompound: isCompound as! Bool, imageName: imageName as! String)]
                        }
                    }
                }
                self.savedWorkoutsTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedWorkoutsDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell") as? WorkoutNamesTableViewCell {
            cell.workoutName.text = Array(savedWorkoutsDict.keys)[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! WorkoutNamesTableViewCell
        selectedWorkout = cell.workoutName.text
        performSegue(withIdentifier: "profileToActiveWorkout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? WorkoutTableViewController {
            dest.currentWorkout = savedWorkoutsDict[selectedWorkout!]!
            dest.navigationItem.title = selectedWorkout
        }
    }
}
