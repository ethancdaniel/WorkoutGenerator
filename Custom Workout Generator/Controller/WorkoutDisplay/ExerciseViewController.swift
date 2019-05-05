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
    @IBOutlet weak var exerciseName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseName.text = exercise!.name
    }
}
