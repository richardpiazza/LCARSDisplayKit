//===----------------------------------------------------------------------===//
//
// DirectionButton.swift
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

/// A button soley used in a 'DPad' to represent cardinal directions
open class DirectionButton: Button {
    
    open var direction: Direction = Direction()
    open override var graphable: Graphable {
        get {
            return direction
        }
        set {
            if let type = newValue as? Direction {
                direction = type
            }
        }
    }
    
    convenience init(with frame: CGRect, direction: Direction) {
        self.init(frame: frame)
        self.direction = direction
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
