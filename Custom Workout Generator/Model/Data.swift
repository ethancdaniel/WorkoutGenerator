//
//  Data.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation

class Data {
    let exercises = [Exercise(name: "Bench Press", parts: [Parts.chest, Parts.triceps, Parts.shoulders], isCompound: true),
                     Exercise(name: "Barbell Shoulder Press", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Dumbbell Shoulder Press", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Dumbbell Lateral Raise", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Dumbbell Front Lateral Raise", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Rear Lateral Raise", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Incline Bench Press", parts: [Parts.chest, Parts.triceps, Parts.shoulders], isCompound: true),
                     Exercise(name: "Pushups", parts: [Parts.chest, Parts.triceps, Parts.shoulders], isCompound: true),
                     Exercise(name: "Cable Crossovers", parts: [Parts.chest], isCompound: false),
                     Exercise(name: "Close-Grip Bench Press", parts: [Parts.chest, Parts.triceps, Parts.shoulders], isCompound: true),
                     Exercise(name: "Skullcrushers", parts: [Parts.triceps], isCompound: false),
                     Exercise(name: "Rope Tricep Extension", parts: [Parts.triceps], isCompound: false),
                     Exercise(name: "Overhead Tricep Extension", parts: [Parts.triceps], isCompound: false),
                     Exercise(name: "Dips", parts: [Parts.chest, Parts.shoulders, Parts.triceps], isCompound: true)
    ]
        
    let workouts = [Workout(name: "Push", bodyParts: [Parts.chest, Parts.triceps, Parts.shoulders]),
                    Workout(name: "Pull", bodyParts: [Parts.lats, Parts.lowerBack, Parts.biceps]),
                    Workout(name: "Legs", bodyParts: [Parts.quadriceps, Parts.glutes, Parts.hamstrings, Parts.calves])]
    
    let parts = ["Abs", "Biceps", "Calves", "Chest", "Forearms", "Glutes", "Hamstrings", "Lats", "Lowerback", "Obliques", "Quads", "Shoulders", "Traps", "Triceps", ]
    
    let selected = ["SelectedAbs", "SelectedBiceps", "SelectedCalves", "SelectedChest", "SelectedForearms", "SelectedGlutes", "SelectedHamstrings", "SelectedLats", "SelectedLowerback", "SelectedObliques", "SelectedQuads", "SelectedShoulders", "SelectedTraps", "SelectedTriceps"]
    
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

