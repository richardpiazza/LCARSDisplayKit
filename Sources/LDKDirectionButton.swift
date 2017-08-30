//===----------------------------------------------------------------------===//
//
// LDKDirectionButton.swift
//
// Copyright (c) 2015 Richard Piazza
// https://github.com/richardpiazza/LCARSDisplayKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Star Trek and related marks are registered trademarks of CBS® / PARAMOUNT®
// PLC. Original LCARS design credit: Mike Okuda.
//
//===----------------------------------------------------------------------===//

import UIKit
import GraphPoint

@IBDesignable open class LDKDirectionButton: LDKButton {
    
    open var direction: Direction = Direction()
    open override var graphable: Graphable {
        get {
            return direction
        }
        set {}
    }
    
    @IBInspectable open var radius: CGFloat {
        get {
            return direction.arc.radius
        }
        set {
            direction.arc.radius = newValue
        }
    }
    @IBInspectable open var startDegree: CGFloat {
        get {
            return direction.arc.startDegree
        }
        set {
            direction.arc.startDegree = newValue
        }
    }
    @IBInspectable open var endDegree: CGFloat {
        get {
            return direction.arc.endDegree
        }
        set {
            direction.arc.endDegree = newValue
        }
    }
    @IBInspectable open var cardinalDegree: CGFloat {
        get {
            return direction.cardinal.degree
        }
        set {
            direction.cardinal = Direction.Cardinal(degreeValue: newValue)
        }
    }
    
    convenience init(rect: CGRect, radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, cardinalDegree: CGFloat) {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        let graphFrame = GraphFrame.graphFrame(graphPoints: arc.graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
        let frame = graphFrame.frame(graphFrame: graphFrame, offset: graphFrame.graphOriginOffset)
        self.init(frame: frame)
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
        self.cardinalDegree = cardinalDegree
    }
    
    // MARK: - Tappable
    override open var colors: [UIColor]? {
        return [Interface.theme.primaryDark, Interface.theme.primaryLight]
    }
    
    override open var touchedColors: [UIColor]? {
        guard let c = self.colors else {
            return nil
        }
        
        var colors = c
        for (index, color) in colors.enumerated() {
            colors[index] = color.adaptingSaturation(by: 0.8)
        }
        return colors
    }
}
