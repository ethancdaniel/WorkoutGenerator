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
    var selectedCell: Int?
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
        selectedCell = indexPath.item
        
        performSegue(withIdentifier: "CreatedWorkout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell, let dest = segue.destination as? WorkoutTableViewController {
            dest.workoutIndex = selectedCell
            dest.currentWorkout = generatedWorkout
        }
    }
    
    func generateWorkout(workoutIndex: Int) {
        let parts = data.workouts[selectedCell!].bodyParts
        let numParts = parts.count
        let exPerPart = (6 / numParts)
        var compounds = 0
        var needCompound = true
        for n in 0...numParts {
            if compounds < 2 {
                needCompound = true
            } else {
                needCompound = false
            }
            let targetPart = parts[n]
            var count = 0
            var lastExercise = ""
            while count < exPerPart {
                for exercise in data.exercises {
                    if needCompound == true {
                        if exercise.compound && exercise.parts.contains(targetPart) {
                            generatedWorkout.append(exercise)
                        }
                    } else if needCompound == false {
                        if exercise.parts.contains(targetPart) {
                            generatedWorkout.append(exercise)
                        }
                    }
                }
                count += 1
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
