//
//  CustomButtonn.swift
//  Custom Workout Generator
//
//  Created by Andrew Chang on 5/5/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.red : UIColor.white
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
