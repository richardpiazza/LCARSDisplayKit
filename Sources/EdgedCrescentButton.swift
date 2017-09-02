//===----------------------------------------------------------------------===//
//
// EdgedCrescentButton.swift
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

/// Button that had an interior matching an arc, and a flat exterior.
@IBDesignable open class EdgedCrescentButton: Button {
    
    open var edgedCrescent: EdgedCrescent = EdgedCrescent()
    open override var graphable: Graphable {
        get {
            return edgedCrescent
        }
        set {}
    }
    
    @IBInspectable open var radius: CGFloat {
        get {
            return edgedCrescent.arc.radius
        }
        set {
            edgedCrescent.arc.radius = newValue
        }
    }
    @IBInspectable open var startDegree: CGFloat {
        get {
            return edgedCrescent.arc.startDegree
        }
        set {
            edgedCrescent.arc.startDegree = newValue
        }
    }
    @IBInspectable open var endDegree: CGFloat {
        get {
            return edgedCrescent.arc.endDegree
        }
        set {
            edgedCrescent.arc.endDegree = newValue
        }
    }
    @IBInspectable open var edgePoint1: CGPoint {
        get {
            guard edgedCrescent.additionalPoints.count > 0 else {
                return CGPoint.zero
            }
            
            return edgedCrescent.additionalPoints[0]
        }
        set {
            guard edgedCrescent.additionalPoints.count > 0 else {
                edgedCrescent.additionalPoints.append(newValue)
                return
            }
            
            edgedCrescent.additionalPoints[0] = newValue
        }
    }
    @IBInspectable open var edgePoint2: CGPoint {
        get {
            guard edgedCrescent.additionalPoints.count > 1 else {
                return CGPoint.zero
            }
            
            return edgedCrescent.additionalPoints[1]
        }
        set {
            guard edgedCrescent.additionalPoints.count > 1 else {
                edgedCrescent.additionalPoints.append(newValue)
                return
            }
            
            edgedCrescent.additionalPoints[1] = newValue
        }
    }
    @IBInspectable open var edgePoint3: CGPoint {
        get {
            guard edgedCrescent.additionalPoints.count > 2 else {
                return CGPoint.zero
            }
            
            return edgedCrescent.additionalPoints[2]
        }
        set {
            guard edgedCrescent.additionalPoints.count > 2 else {
                edgedCrescent.additionalPoints.append(newValue)
                return
            }
            
            edgedCrescent.additionalPoints[2] = newValue
        }
    }
    
    convenience init(with edgedCrescent: EdgedCrescent, rect: CGRect, offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: edgedCrescent.graphFrame, offset: offset)
        self.init(frame: frame)
        self.edgedCrescent = edgedCrescent
    }
    
    func setEdgedCrescent(_ edgedCrescent: EdgedCrescent, rect: CGRect, offset: GraphOriginOffset) {
        self.edgedCrescent = edgedCrescent
        self.frame = rect.frame(graphFrame: edgedCrescent.graphFrame, offset: offset)
    }
}
