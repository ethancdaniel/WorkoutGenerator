//
//  Exercise.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation

class Exercise: Equatable {
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name
    }
    
    let name: String
    let parts: [Parts]
    let compound: Bool
    let imageName: String
    
    init(name: String, parts: [Parts], isCompound: Bool, imageName: String) {
        self.name = name
        self.parts = parts
        self.compound = isCompound
        self.imageName = imageName
    }
}
