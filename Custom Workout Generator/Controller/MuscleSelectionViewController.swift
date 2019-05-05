//
//  MuscleSelectionViewController.swift
//  Custom Workout Generator
//
//  Created by Andrew Chang on 5/4/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit

class MuscleSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var data = Data()
    var selectBool = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var generatedWorkout: [Exercise] = []
    
    @IBOutlet weak var muscleCollectionView: UICollectionView!
    @IBOutlet weak var shoulders: UIButton!
    @IBOutlet weak var abs: UIButton!
    @IBOutlet weak var biceps: UIButton!
    @IBOutlet weak var chest: UIButton!
    @IBOutlet weak var forearms: UIButton!
    @IBOutlet weak var obliques: UIButton!
    @IBOutlet weak var quads: UIButton!
    @IBOutlet weak var traps: UIButton!
    @IBOutlet weak var lats: UIButton!
    @IBOutlet weak var lowerback: UIButton!
    @IBOutlet weak var triceps: UIButton!
    @IBOutlet weak var glutes: UIButton!
    @IBOutlet weak var hamstrings: UIButton!
    @IBOutlet weak var calves: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        muscleCollectionView.delegate = self
        muscleCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.parts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "muscleCell", for: indexPath) as? MuscleCollectionViewCell {
            cell.muscleLabel.text = data.parts[indexPath.item]
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectBool[indexPath.item] {
            selectBool[indexPath.item] = false
            if let button = self.view.viewWithTag(indexPath.item + 1) as? UIButton {
                button.setImage(UIImage(named: data.parts[indexPath.item]), for: .normal)
            }
        } else {
            selectBool[indexPath.item] = true
            if let button = self.view.viewWithTag(indexPath.item + 1) as? UIButton {
                button.setImage(UIImage(named: data.selected[indexPath.item]), for: .normal)
            }
        }
    }
    
    func generateWorkout(listOfParts: [Parts]) {
        let numParts = listOfParts.count
        let exPerPart = Int(ceil(Double(6 / numParts)))
        var compounds = 0
        var needCompound = true
        var chosenExercises: [Int] = []
        for part in listOfParts {
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
                    if exercise.parts.contains(part) && !chosenExercises.contains(randomInt) && !exercise.compound {
                        generatedWorkout.append(exercise)
                        chosenExercises.append(randomInt)
                        count += 1
                    }
                }
            }
        }
    }
    
    
    @IBAction func generatePressed(_ sender: Any) {
        var parts = [Parts]()
        var index = 0
        for b in selectBool {
            if b {
                parts.append(data.classPart[index])
            }
            index += 1
        }
        generateWorkout(listOfParts: parts)
        
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
