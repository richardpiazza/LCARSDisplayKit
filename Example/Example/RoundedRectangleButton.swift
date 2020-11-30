//
//  RoundedRectangleButton.swift
//  Example
//
//  Created by Richard Piazza on 11/29/20.
//  Copyright © 2020 Richard Piazza. All rights reserved.
//

import UIKit
import LCARSDisplayKit
import Swift2D

@IBDesignable class RoundedRectangleButton: RoundedRectangleControl {
    
    @IBInspectable var roundLeft: Bool {
        get { shape.leftRounded }
        set { shape.leftRounded = newValue }
    }
    
    @IBInspectable var roundRight: Bool {
        get { shape.rightRounded }
        set { shape.rightRounded = newValue }
    }
    
    @IBInspectable var isFrame: Bool {
        get { shape.cornersOnly }
        set { shape.cornersOnly = newValue }
    }
}
