//
//  ExerciseViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/4/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation
import UIKit

class ExerciseViewController: UIViewController {
    var exercise: Exercise?
    var volume: String?
    var image: UIImage?
    
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var setsAndReps: UILabel!
    @IBOutlet weak var exerciseImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseName.text = exercise!.name
        setsAndReps.text = volume!
        exerciseImage.image = image!
    }
}
