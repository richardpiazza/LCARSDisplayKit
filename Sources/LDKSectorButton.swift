//===----------------------------------------------------------------------===//
//
// LDKSectorButton.swift
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

@IBDesignable open class LDKSectorButton: LDKButton {
    
    open var arc: Arc = Arc()
    open override var graphable: Graphable {
        get {
            return arc
        }
        set {}
    }
    
    @IBInspectable open var radius: CGFloat {
        get {
            return arc.radius
        }
        set {
            arc.radius = newValue
        }
    }
    @IBInspectable open var startDegree: CGFloat {
        get {
            return arc.startDegree
        }
        set {
            arc.startDegree = newValue
        }
    }
    @IBInspectable open var endDegree: CGFloat {
        get {
            return arc.endDegree
        }
        set {
            arc.endDegree = newValue
        }
    }
    
    convenience init(inRect rect: CGRect, radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, graphOrigin: GraphOrigin) {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        let frame = GraphFrame.graphFrame(graphPoints: arc.graphPoints)
        self.init(frame: frame)
        self.radius = arc.radius
        self.startDegree = arc.startDegree
        self.endDegree = arc.endDegree
    }
    
    convenience init(withArc arc: Arc, inRect rect: CGRect, withGraphOriginOffset offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: arc.graphFrame, offset: offset)
        self.init(frame: frame)
        self.arc = arc
    }
    
    open func setArc(_ arc: Arc, inRect rect: CGRect, withGraphOriginOffset offset: GraphOriginOffset) {
        self.arc = arc
        self.frame = rect.frame(graphFrame: arc.graphFrame, offset: offset)
        self.arc.size = self.frame.size
    }
}
