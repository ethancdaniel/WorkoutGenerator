//
//  Data.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation

class Data {
    let exercises = [Exercise(name: "Bench Press", parts: [Parts.chest], isCompound: true, imageName: "benchPress"),
                     Exercise(name: "Barbell Shoulder Press", parts: [Parts.shoulders], isCompound: false, imageName: "barbellShoulderPress"),
                     Exercise(name: "Dumbbell Shoulder Press", parts: [Parts.shoulders], isCompound: false, imageName: "dumbbellShoulderPress"),
                     Exercise(name: "Dumbbell Lateral Raise", parts: [Parts.shoulders], isCompound: false, imageName: "dumbbellLateralRaise"),
                     Exercise(name: "Dumbbell Front Raise", parts: [Parts.shoulders], isCompound: false, imageName: "dumbbellFrontRaise"),
                     Exercise(name: "Dumbbell Rear Lateral Raise", parts: [Parts.shoulders], isCompound: false, imageName: "dumbbellRearLateralRaise"),
                     Exercise(name: "Incline Bench Press", parts: [Parts.chest], isCompound: true, imageName: "inclineBenchPress"),
                     Exercise(name: "Pushups", parts: [Parts.chest, Parts.triceps], isCompound: true, imageName: "pushup"),
                     Exercise(name: "Close-Grip Bench Press", parts: [Parts.chest, Parts.triceps], isCompound: true, imageName: "closeGripBenchPress"),
                     Exercise(name: "Skullcrushers", parts: [Parts.triceps], isCompound: false, imageName: "skullcrushers"),
                     Exercise(name: "Rope Tricep Extension", parts: [Parts.triceps], isCompound: false, imageName: "ropeTricepExtension"),
                     Exercise(name: "Overhead Tricep Extension", parts: [Parts.triceps], isCompound: false, imageName: "overheadTricepExtension"),
                     Exercise(name: "Tricep Dips", parts: [Parts.chest, Parts.triceps], isCompound: true, imageName: "tricepDips"),
                     Exercise(name: "Dumbbell Chest Press", parts: [Parts.chest], isCompound: true, imageName: "dumbbellChestPress"),
                     Exercise(name: "Dumbbell Incline Chest Press", parts: [Parts.chest], isCompound: true, imageName: "inclineDumbbellPress"),
                     Exercise(name: "Cable Chest-Fly", parts: [Parts.chest], isCompound: false, imageName: "cableFly"),
                     Exercise(name: "Dumbbell Row", parts: [Parts.lats, Parts.trapezius], isCompound: false, imageName: "dumbbellRow"),
                     Exercise(name: "Chin-ups", parts: [Parts.biceps], isCompound: false, imageName: "chinup"),
                     Exercise(name: "Pull ups", parts: [Parts.lats, Parts.trapezius], isCompound: true, imageName: "pullup"),
                     Exercise(name: "Seated Cable Row", parts: [Parts.trapezius], isCompound: false, imageName: "seatedCableRow"),
                     Exercise(name: "Hammer Curl", parts: [Parts.biceps], isCompound: false, imageName: "hammerCurl"),
                     Exercise(name: "Dumbbell Curl", parts: [Parts.biceps], isCompound: false, imageName: "dumbbellCurl"),
                     Exercise(name: "EZ-bar Curl", parts: [Parts.biceps], isCompound: false, imageName: "ezBarCurl"),
                     Exercise(name: "Crunches", parts: [Parts.abdominals], isCompound: false, imageName: "crunch"),
                     Exercise(name: "Sit-up", parts: [Parts.abdominals], isCompound: false, imageName: "situp"),
                     Exercise(name: "Lying Leg-raise", parts: [Parts.abdominals], isCompound: true, imageName: "lyingLegRaise"),
                     Exercise(name: "Hanging Leg-raise", parts: [Parts.abdominals], isCompound: true, imageName: "hangingLegRaise"),
                     Exercise(name: "Russian Twist", parts: [Parts.abdominals, Parts.obliques], isCompound: false, imageName: "russianTwist"),
                     Exercise(name: "Plank", parts: [Parts.abdominals], isCompound: false, imageName: "plank"),
                     Exercise(name: "Bicycle Crunches", parts: [Parts.abdominals], isCompound: false, imageName: "bicycleCrunch"),
                     Exercise(name: "L-pullups", parts: [Parts.abdominals], isCompound: true, imageName: "l-pullups"),
                     Exercise(name: "Side-plank", parts: [Parts.abdominals, Parts.obliques], isCompound: false, imageName: "sidePlank"),
                     Exercise(name: "Oblique Raises", parts: [Parts.abdominals, Parts.obliques], isCompound: false, imageName: "obliqueRaise"),
                     Exercise(name: "Body Saw", parts: [Parts.abdominals, Parts.obliques], isCompound: false, imageName: "bodySaw"),
                     Exercise(name: "Farmer Walk", parts: [Parts.forearms], isCompound: false, imageName: "farmerWalk"),
                     Exercise(name: "Wrist Roller", parts: [Parts.forearms], isCompound: false, imageName: "wristRoller"),
                     Exercise(name: "Wrist Curls", parts: [Parts.forearms], isCompound: false, imageName: "wristCurl"),
                     Exercise(name: "Reverse Curls", parts: [Parts.forearms], isCompound: false, imageName: "reverseCurl"),
                     Exercise(name: "Back Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: true, imageName: "backSquat"),
                     Exercise(name: "Zercher Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: true, imageName: "zercherSquat"),
                     Exercise(name: "Goblet Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: false, imageName: "gobletSquat"),
                     Exercise(name: "Leg Extension", parts: [Parts.quadriceps], isCompound: false, imageName: "legExtension"),
                     Exercise(name: "Box Jumps", parts: [Parts.quadriceps, Parts.glutes], isCompound: true, imageName: "boxJump"),
                     Exercise(name: "Dumbbell Lunges", parts: [Parts.quadriceps, Parts.hamstrings, Parts.glutes], isCompound: true, imageName: "lunge"),
                     Exercise(name: "Dumbbell Shrug", parts: [Parts.trapezius], isCompound: false, imageName: "shrug"),
                     Exercise(name: "Face Pull", parts: [Parts.trapezius], isCompound: false, imageName: "facePull"),
                     Exercise(name: "Lat Pull-down", parts: [Parts.lats], isCompound: false, imageName: "latPullDown"),
                     Exercise(name: "Wide-grip Press-down", parts: [Parts.lats], isCompound: false, imageName: "pressDown"),
                     Exercise(name: "Deadlift", parts: [Parts.lowerBack, Parts.hamstrings], isCompound: true, imageName: "deadlift"),
                     Exercise(name: "Hip Abduction", parts: [Parts.glutes], isCompound: false, imageName: "hipAbduction"),
                     Exercise(name: "Hip Thrust", parts: [Parts.glutes, Parts.lowerBack], isCompound: true, imageName: "hipThrust"),
                     Exercise(name: "Front Squat", parts: [Parts.quadriceps, Parts.glutes], isCompound: true, imageName: "frontSquat"),
                     Exercise(name: "Hamstring Curl", parts: [Parts.hamstrings], isCompound: false, imageName: "hamstringCurl"),
                     Exercise(name: "Leg Press", parts: [Parts.quadriceps, Parts.hamstrings, Parts.glutes], isCompound: true, imageName: "legPress"),
                     Exercise(name: "Standing Calf Raises", parts: [Parts.calves], isCompound: false, imageName: "standingCalfRaise"),
                     Exercise(name: "Stairs (machine)", parts: [Parts.calves], isCompound: false, imageName: "stairs"),
                     Exercise(name: "Seated Calf Raises", parts: [Parts.calves], isCompound: false, imageName: "seatedCalfRaise"),
    ]
    
    let workouts = [Workout(name: "Push", bodyParts: [Parts.chest, Parts.triceps, Parts.shoulders]),
                    Workout(name: "Pull", bodyParts: [Parts.lats, Parts.lowerBack, Parts.biceps, Parts.trapezius]),
                    Workout(name: "Legs", bodyParts: [Parts.quadriceps, Parts.glutes, Parts.hamstrings, Parts.calves]),
                    Workout(name: "Abs", bodyParts: [Parts.abdominals])
    ]
    
    let parts = ["Abs", "Biceps", "Calves", "Chest", "Forearms", "Glutes", "Hamstrings", "Lats", "Lowerback", "Obliques", "Quads", "Shoulders", "Traps", "Triceps", ]
    
    let selected = ["SelectedAbs", "SelectedBiceps", "SelectedCalves", "SelectedChest", "SelectedForearms", "SelectedGlutes", "SelectedHamstrings", "SelectedLats", "SelectedLowerback", "SelectedObliques", "SelectedQuads", "SelectedShoulders", "SelectedTraps", "SelectedTriceps"]
    
    let classPart = [Parts.abdominals, Parts.biceps, Parts.calves, Parts.chest, Parts.forearms, Parts.glutes, Parts.hamstrings, Parts.lats, Parts.lowerBack, Parts.obliques, Parts.quadriceps, Parts.shoulders, Parts.trapezius, Parts.triceps]
    
    let hasCompounds = [Parts.abdominals, Parts.lats, Parts.glutes, Parts.hamstrings, Parts.lats, Parts.quadriceps, Parts.shoulders, Parts.chest]
    
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

