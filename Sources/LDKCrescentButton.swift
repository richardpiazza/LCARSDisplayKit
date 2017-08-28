//===----------------------------------------------------------------------===//
//
// LDKCrescentButton.swift
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

@IBDesignable open class LDKCrescentButton: LDKButton {
    
    open var crescent: Crescent = Crescent()
    open override var graphable: Graphable {
        get {
            return crescent
        }
        set {}
    }
    
    @IBInspectable open var innerRadius: CGFloat {
        get {
            return crescent.innerArc.radius
        }
        set {
            crescent.innerArc.radius = newValue
        }
    }
    @IBInspectable open var outerRadius: CGFloat {
        get {
            return crescent.outerArc.radius
        }
        set {
            crescent.outerArc.radius = newValue
        }
    }
    @IBInspectable open var startDegree: CGFloat {
        get {
            return crescent.startDegree
        }
        set {
            crescent.innerArc.startDegree = newValue
            crescent.outerArc.startDegree = newValue
        }
    }
    @IBInspectable open var endDegree: CGFloat {
        get {
            return crescent.endDegree
        }
        set {
            crescent.innerArc.endDegree = newValue
            crescent.outerArc.endDegree = newValue
        }
    }
    
    convenience init(withCrescent crescent: Crescent, inRect rect: CGRect, withGraphOriginOffset offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: crescent.graphFrame, offset: offset)
        self.init(frame: frame)
        self.crescent = crescent
    }
    
    func setCrescent(_ crescent: Crescent, inRect rect: CGRect, withGraphOriginOffset offset: GraphOriginOffset) {
        self.crescent = crescent
        self.frame = rect.frame(graphFrame: crescent.graphFrame, offset: offset)
    }
}
