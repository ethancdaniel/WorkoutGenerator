//
//  ViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/9/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let data = Data()
    @IBOutlet weak var workoutOptions: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutOptions.delegate = self
        workoutOptions.dataSource = self
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
    


}
