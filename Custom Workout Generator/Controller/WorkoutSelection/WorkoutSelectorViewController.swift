//
//  WorkoutSelectorViewController.swift
//  Custom Workout Generator
//
//  Created by Aidan Tong on 4/5/2019.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit

class WorkoutSelectorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let data = Data()
    //var selectedCell: Int?
    var generatedWorkout: [Exercise] = []
    @IBOutlet weak var workoutOptions: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutOptions.delegate = self
        workoutOptions.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workout_option", for: indexPath) as? WorkoutCollectionViewCell {
            cell.workoutName.text = data.workouts[indexPath.item].name
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //selectedCell = indexPath.item
        generateWorkout(workoutIndex: indexPath.item)
        print(generatedWorkout)
        //performSegue(withIdentifier: "CreatedWorkout", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell, let dest = segue.destination as? WorkoutTableViewController {
            //dest.workoutIndex = selectedCell
            //dest.currentWorkout = generatedWorkout
        }
    }
    
    func generateWorkout(workoutIndex: Int) {
        let parts = data.workouts[workoutIndex].bodyParts
        let numParts = parts.count
        let exPerPart = (6 / numParts)
        var compounds = 0
        var needCompound = true
        var chosenExercises: [Int] = []
        for part in parts {
            if compounds < 2 {
                needCompound = true
            } else {
                needCompound = false
            }
            var count = 0
            var randomInt: Int
            while count < exPerPart {
                randomInt = Int.random(in: 0..<data.exercises.count)
                let exercise = data.exercises[randomInt]
                if needCompound == true {
                    if exercise.compound && exercise.parts.contains(part) && !chosenExercises.contains(randomInt) {
                        generatedWorkout.append(exercise)
                        chosenExercises.append(randomInt)
                        compounds += 1
                        count += 1
                    }
                } else {
                    if exercise.parts.contains(part) && !chosenExercises.contains(randomInt) {
                        generatedWorkout.append(exercise)
                        chosenExercises.append(randomInt)
                        count += 1
                    }
                }
            }
        }
    }
    // ["Dips", "Close-Grip Bench Press", "Skullcrushers", "Rope Tricep Extension", "Barbell Shoulder Press", "Incline Bench Press"]
    // ["Bench Press", "Dips", "Incline Bench Press", "Overhead Tricep Extension", "Rear Lateral Raise", "Dumbbell Shoulder Press"]
    // ["Close-Grip Bench Press", "Dips", "Bench Press", "Pushups", "Barbell Shoulder Press", "Dumbbell Lateral Raise"]
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
