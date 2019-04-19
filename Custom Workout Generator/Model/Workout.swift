//
//  Workout.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation

class Workout {
    let name: String
    let bodyParts: [Parts]
    let exercises: [Exercise]
    
    init(name: String, bodyParts: [Parts]) {
        self.name = name
        self.bodyParts = bodyParts
        self.exercises = []
    }
    
}
