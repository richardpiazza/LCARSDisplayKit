//===----------------------------------------------------------------------===//
//
// LDKElbowButton.swift
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

@IBDesignable open class LDKElbowButton: LDKButton {
    
    open var elbow: Elbow = Elbow()
    open override var graphable: Graphable {
        get {
            return elbow
        }
        set {}
    }
    
    @IBInspectable open var top: Bool {
        get {
            return elbow.top
        }
        set {
            elbow.top = newValue
        }
    }
    @IBInspectable open var left: Bool {
        get {
            return elbow.left
        }
        set {
            elbow.left = newValue
        }
    }
    @IBInspectable open var rounded: Bool {
        get {
            return elbow.rounded
        }
        set {
            elbow.rounded = newValue
        }
    }
    @IBInspectable open var horizontalHeight: CGFloat {
        get {
            return elbow.horizontalHeight
        }
        set {
            elbow.horizontalHeight = newValue
        }
    }
    @IBInspectable open var verticalWidth: CGFloat {
        get {
            return elbow.verticalWidth
        }
        set {
            elbow.verticalWidth = newValue
        }
    }
    @IBInspectable open var closedHeight: CGFloat {
        get {
            return elbow.closedHeight
        }
        set {
            elbow.closedHeight = newValue
        }
    }
    @IBInspectable open var matchRadius: Bool {
        get {
            return elbow.shouldMatchRadius
        }
        set {
            elbow.shouldMatchRadius = newValue
        }
    }
    
    convenience init(frame: CGRect, top: Bool, left: Bool, rounded: Bool, horizontalHeight: CGFloat, verticalWidth: CGFloat, closedHeight: CGFloat) {
        self.init(frame: frame)
        self.top = top
        self.left = left
        self.rounded = rounded
        self.horizontalHeight = horizontalHeight
        self.verticalWidth = verticalWidth
        self.closedHeight = closedHeight
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        self.elbow.size = self.bounds.size
    }
}
