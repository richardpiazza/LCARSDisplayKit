//
//  ElbowButton.swift
//  Example
//
//  Created by Richard Piazza on 11/29/20.
//  Copyright © 2020 Richard Piazza. All rights reserved.
//

import UIKit
import LCARSDisplayKit
import Swift2D

@IBDesignable class ElbowButton: ElbowControl {
    
    @IBInspectable var top: Bool {
        get { shape.top }
        set { shape.top = newValue }
    }
    
    @IBInspectable var left: Bool {
        get { shape.left }
        set { shape.left = newValue }
    }
    
    @IBInspectable var rounded: Bool {
        get { shape.rounded }
        set { shape.rounded = newValue }
    }
    
    @IBInspectable var horizontalHeight: CGFloat {
        get { CGFloat(shape.horizontalHeight) }
        set { shape.horizontalHeight = newValue }
    }
    
    @IBInspectable var verticalWidth: CGFloat {
        get { CGFloat(shape.verticalWidth) }
        set { shape.verticalWidth = newValue }
    }
    
    @IBInspectable var closedHeight: CGFloat {
        get { CGFloat(shape.closedHeight) }
        set { shape.closedHeight = newValue }
    }
    
    @IBInspectable var matchRadius: Bool {
        get { shape.shouldMatchRadius }
        set { shape.shouldMatchRadius = newValue }
    }
    
    @IBInspectable var inspectableColor: UIColor {
        get { color }
        set { color = newValue }
    }
}

