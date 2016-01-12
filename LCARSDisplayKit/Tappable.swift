//===----------------------------------------------------------------------===//
//
// Tappable.swift
//
// Copyright (c) 2016 Richard Piazza
// https://github.com/richardpiazza/CodeQuickKit
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
//===----------------------------------------------------------------------===//

import UIKit

/// Protocol defining methods of an interactive item with single color and path.
public protocol Tappable {
    var backgroundImageColor: UIColor { get set }
    /// Path representing the background image, also used to determine if a touch falls inside a button.
    func backgroundImagePath(size: CGSize) -> CGMutablePathRef
    /// Construct an image using the `backgroundImagePath`
    func backgroundImage(context: CGContextRef?, size: CGSize) -> UIImage?
}

public extension Tappable {
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        return CGPathCreateMutable()
    }
    
    public func backgroundImage(context: CGContextRef?, size: CGSize) -> UIImage? {
        return UIImage.imageWithPath(backgroundImagePath(size), size: size, color: backgroundImageColor, context: context)
    }
}

/// An interactive item with multipls colors and paths.
public protocol Tappables: Tappable {
    func backgroundImageColors() -> [UIColor]
    func backgroundImageSubpaths(size: CGSize) -> [CGMutablePathRef]
}

public extension Tappables {
    public func backgroundImageColors() -> [UIColor] {
        var colors: [UIColor] = [UIColor]()
        colors.append(UIColor.neonCarrot())
        colors.append(UIColor.paleCanary())
        return colors
    }
    
    public func backgroundImage(context: CGContextRef?, size: CGSize) -> UIImage? {
        let paths = self.backgroundImageSubpaths(size)
        return UIImage.imageWithSubpaths(paths, colors: self.backgroundImageColors(), size: size, context: context)
    }
}
