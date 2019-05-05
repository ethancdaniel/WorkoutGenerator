//
//  ProfileViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/5/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var workoutsButton: UIButton!
    @IBOutlet weak var savedWorkouts: UIView!
    @IBOutlet weak var personalStats: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statsButton.isSelected = true
        savedWorkouts.isHidden = true
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
}
