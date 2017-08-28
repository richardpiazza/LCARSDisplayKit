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

/// Protocol defining methods of an interactive item with single color and path.
public protocol Tappable {
    /// The base Graphable type
    var graphable: Graphable { get set }
    /// The color of the element
    var color: UIColor { get set }
    /// A color used during active touching
    var touchedColor: UIColor { get set }
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
