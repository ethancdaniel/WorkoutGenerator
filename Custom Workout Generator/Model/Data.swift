//
//  Data.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation

class Data {
    let exercises = [Exercise(name: "Bench Press", parts: [Parts.chest, Parts.triceps, Parts.shoulders], isCompound: true)]
    let workouts = [Workout(name: "Push", bodyParts: [Parts.chest, Parts.triceps, Parts.shoulders]),
                    Workout(name: "Pull", bodyParts: [Parts.lats, Parts.lowerBack, Parts.biceps]),
                    Workout(name: "Legs", bodyParts: [Parts.quadriceps, Parts.glutes, Parts.hamstrings, Parts.calves])]
}

enum Parts : String {
    case chest
    case triceps
    case biceps
    case trapezius
    case shoulders
    case abdominals
    case obliques
    case forearms
    case quadriceps
    case lats
    case lowerBack
    case glutes
    case hamstrings
    case calves
}
