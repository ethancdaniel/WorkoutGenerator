//
//  Data.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation

class Data {
    let exercises = [Exercise(name: "Bench Press", parts: [Parts.chest], isCompound: true),
                     Exercise(name: "Barbell Shoulder Press", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Dumbbell Shoulder Press", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Dumbbell Lateral Raise", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Dumbbell Front Lateral Raise", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Rear Lateral Raise", parts: [Parts.shoulders], isCompound: false),
                     Exercise(name: "Incline Bench Press", parts: [Parts.chest], isCompound: true),
                     Exercise(name: "Pushups", parts: [Parts.chest, Parts.triceps], isCompound: true),
                     Exercise(name: "Cable Crossovers", parts: [Parts.chest], isCompound: false),
                     Exercise(name: "Close-Grip Bench Press", parts: [Parts.chest, Parts.triceps], isCompound: true),
                     Exercise(name: "Skullcrushers", parts: [Parts.triceps], isCompound: false),
                     Exercise(name: "Rope Tricep Extension", parts: [Parts.triceps], isCompound: false),
                     Exercise(name: "Overhead Tricep Extension", parts: [Parts.triceps], isCompound: false),
                     Exercise(name: "Tricep Dips", parts: [Parts.chest, Parts.triceps], isCompound: true),
                     Exercise(name: "Dumbbell Chest Press", parts: [Parts.chest], isCompound: true),
                     Exercise(name: "Dumbbell Incline Chest Press", parts: [Parts.chest], isCompound: true),
                     Exercise(name: "Cable Chest-Fly", parts: [Parts.chest], isCompound: false),
                     Exercise(name: "Dumbbell Row", parts: [Parts.lats, Parts.trapezius], isCompound: false),
                     Exercise(name: "Chin-ups", parts: [Parts.biceps], isCompound: false),
                     Exercise(name: "Pull ups", parts: [Parts.lats, Parts.trapezius], isCompound: true),
                     Exercise(name: "Seated Cable Row", parts: [Parts.trapezius], isCompound: false),
                     Exercise(name: "Hammer Curl", parts: [Parts.biceps], isCompound: false),
                     Exercise(name: "Dumbbell Curl", parts: [Parts.biceps], isCompound: false),
                     Exercise(name: "EZ-bar Curl", parts: [Parts.biceps], isCompound: false),
                     Exercise(name: "Crunches", parts: [Parts.abdominals], isCompound: false),
                     Exercise(name: "Sit-up", parts: [Parts.abdominals], isCompound: false),
                     Exercise(name: "Lying Leg-raise", parts: [Parts.abdominals], isCompound: true),
                     Exercise(name: "Hanging Leg-raise", parts: [Parts.abdominals], isCompound: true),
                     Exercise(name: "Russian Twist", parts: [Parts.abdominals, Parts.obliques], isCompound: false),
                     Exercise(name: "Plank", parts: [Parts.abdominals], isCompound: false),
                     Exercise(name: "Bicycle Crunches", parts: [Parts.abdominals], isCompound: false),
                     Exercise(name: "L-pullups", parts: [Parts.abdominals], isCompound: true),
                     Exercise(name: "Side-plank", parts: [Parts.abdominals, Parts.obliques], isCompound: false),
                     Exercise(name: "Oblique Raises", parts: [Parts.abdominals, Parts.obliques], isCompound: false),
                     Exercise(name: "Body Saw", parts: [Parts.abdominals, Parts.obliques], isCompound: false),
                     Exercise(name: "Farmer Walk", parts: [Parts.forearms], isCompound: false),
                     Exercise(name: "Wrist Roller", parts: [Parts.forearms], isCompound: false),
                     Exercise(name: "Back Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: true),
                     Exercise(name: "Zercher Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: true),
                     Exercise(name: "Goblet Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: false),
                     Exercise(name: "Leg Extension", parts: [Parts.quadriceps], isCompound: false),
                     Exercise(name: "Box Jumps", parts: [Parts.quadriceps, Parts.glutes], isCompound: true),
                     Exercise(name: "Dumbbell Lunges", parts: [Parts.quadriceps, Parts.hamstrings, Parts.glutes], isCompound: true),
                     Exercise(name: "Dumbbell Shrug", parts: [Parts.trapezius], isCompound: false),
                     Exercise(name: "Face Pull", parts: [Parts.trapezius], isCompound: false),
                     Exercise(name: "Lat Pull-down", parts: [Parts.lats], isCompound: false),
                     Exercise(name: "Wide-grip Press-down", parts: [Parts.lats], isCompound: false),
                     Exercise(name: "Skullcrushers", parts: [Parts.triceps], isCompound: false),
                     Exercise(name: "Deadlift", parts: [Parts.lowerBack, Parts.hamstrings], isCompound: true),
                     Exercise(name: "Hip Adduction", parts: [Parts.glutes], isCompound: false),
                     Exercise(name: "Hip Thrust", parts: [Parts.glutes, Parts.lowerBack], isCompound: true),
                     Exercise(name: "Dips", parts: [Parts.chest, Parts.shoulders, Parts.triceps], isCompound: true),
                     Exercise(name: "Front Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: true),
                     Exercise(name: "Hamstring Curl", parts: [Parts.hamstrings], isCompound: false),
                     Exercise(name: "Glute Raises", parts: [Parts.glutes], isCompound: false),
                     Exercise(name: "Leg Press", parts: [Parts.quadriceps, Parts.hamstrings, Parts.glutes], isCompound: true),
                     Exercise(name: "Standing Calf Raises", parts: [Parts.calves], isCompound: false),
                     Exercise(name: "Stairs (machine)", parts: [Parts.calves], isCompound: false),
                     Exercise(name: "Seated Calf Raises", parts: [Parts.calves], isCompound: false),
    ]
    
    let workouts = [Workout(name: "Push", bodyParts: [Parts.chest, Parts.triceps, Parts.shoulders]),
                    Workout(name: "Pull", bodyParts: [Parts.lats, Parts.lowerBack, Parts.biceps]),
                    Workout(name: "Legs", bodyParts: [Parts.quadriceps, Parts.glutes, Parts.hamstrings, Parts.calves]),
                    Workout(name: "Abs", bodyParts: [Parts.abdominals])
    ]
    
    let parts = ["Abs", "Biceps", "Calves", "Chest", "Forearms", "Glutes", "Hamstrings", "Lats", "Lowerback", "Obliques", "Quads", "Shoulders", "Traps", "Triceps", ]
    
    let selected = ["SelectedAbs", "SelectedBiceps", "SelectedCalves", "SelectedChest", "SelectedForearms", "SelectedGlutes", "SelectedHamstrings", "SelectedLats", "SelectedLowerback", "SelectedObliques", "SelectedQuads", "SelectedShoulders", "SelectedTraps", "SelectedTriceps"]
    
    let classPart = [Parts.abdominals, Parts.biceps, Parts.calves, Parts.chest, Parts.forearms, Parts.glutes, Parts.hamstrings, Parts.lats, Parts.lowerBack, Parts.obliques, Parts.quadriceps, Parts.shoulders, Parts.trapezius, Parts.triceps]
    
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

