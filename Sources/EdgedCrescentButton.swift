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

/// Button that has an interior matching an arc, and a flat exterior.
open class EdgedCrescentButton: Button {
    
    open var edgedCrescent: EdgedCrescent = EdgedCrescent()
    open override var graphable: Graphable {
        get {
            return edgedCrescent
        }
        set {
            if let type = newValue as? EdgedCrescent {
                edgedCrescent = type
            }
        }
    }
    
    convenience init(with edgedCrescent: EdgedCrescent, rect: CGRect, offset: GraphOriginOffset) {
        let frame = rect.frame(graphFrame: edgedCrescent.graphFrame, offset: offset)
        self.init(frame: frame)
        self.edgedCrescent = edgedCrescent
    }
}
