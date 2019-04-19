//
//  Exercise.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 4/18/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation

class Exercise {
    let name: String
    let parts: [Parts]
    let compound: Bool
    
    init(name: String, parts: [Parts], isCompound: Bool) {
        self.name = name
        self.parts = parts
        self.compound = isCompound
    }
}
