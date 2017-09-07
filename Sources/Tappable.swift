//===----------------------------------------------------------------------===//
//
// Tappable.swift
//
// Copyright (c) 2016 Richard Piazza
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

/// Protocol defining methods of an interactive item backed by a `Graphable` element.
public protocol Tappable {
    /// The base Graphable type
    var graphable: Graphable { get set }
    /// The color of the element
    var color: UIColor { get set }
    /// A color used during active touching
    var touchedColor: UIColor { get }
    /// Path representing the image.
    /// Also used to determine if a touch falls within a path (not just within the frame).
    var path: CGMutablePath { get }
    /// An image generated using the `path`
    func image(_ context: CGContext?) -> UIImage?
    /// An image generated using the `path` and substituting the `touchedColor`.
    func touchedImage(_ context: CGContext?) -> UIImage?
    
    /// A collection of paths that make up the `path`
    var subpaths: [CGMutablePath]? { get }
    /// Colors that are used for each of the `subpaths`
    var colors: [UIColor]? { get }
    /// Colors used for each `subpath` used during active touching
    var touchedColors: [UIColor]? { get }
}

public extension Tappable {
    var touchedColor: UIColor {
        return self.color.adaptingSaturation(by: 0.8)
    }
    
    var path: CGMutablePath {
        return graphable.path
    }

    func image(_ context: CGContext?) -> UIImage? {
        if let paths = self.subpaths, let colors = self.colors {
            return UIImage.image(with: paths, colors: colors, size: graphable.size, context: context)
        }

        return UIImage.image(with: self.path, fillColor: self.color, context: context)
    }

    func touchedImage(_ context: CGContext?) -> UIImage? {
        if let paths = self.subpaths, let colors = self.touchedColors {
            return UIImage.image(with: paths, colors: colors, size: graphable.size, context: context)
        }

        return UIImage.image(with: self.path, fillColor: self.touchedColor, context: context)
    }

    var subpaths: [CGMutablePath]? {
        return graphable.subpaths
    }

//    var colors: [UIColor]? {
//        return nil
//    }
//
//    var touchedColors: [UIColor]? {
//        return nil
//    }
}

