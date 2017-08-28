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
//===----------------------------------------------------------------------===//

import UIKit

/// Protocol defining methods of an interactive item with single color and path.
public protocol Tappable {
    var backgroundImageColor: UIColor { get set }
    /// Path representing the background image, also used to determine if a touch falls inside a button.
    func backgroundImagePath(_ size: CGSize) -> CGMutablePath
    /// Construct an image using the `backgroundImagePath`
    func backgroundImage(_ context: CGContext?, size: CGSize) -> UIImage?
    /// An adapted color signifying activation
    func touchColor() -> UIColor
    /// An image using the 'backgroundImagePath' with an adapted color signifying activation
    func touchImage(_ context: CGContext?, size: CGSize) -> UIImage?
}

public extension Tappable {
    public func backgroundImagePath(_ size: CGSize) -> CGMutablePath {
        return CGMutablePath()
    }
    
    public func backgroundImage(_ context: CGContext?, size: CGSize) -> UIImage? {
        return UIImage.imageWithPath(backgroundImagePath(size), size: size, color: backgroundImageColor, context: context)
    }
    
    public func touchColor() -> UIColor {
        return backgroundImageColor.adaptingSaturation(by: 0.8)
    }
    
    public func touchImage(_ context: CGContext?, size: CGSize) -> UIImage? {
        return UIImage.imageWithPath(backgroundImagePath(size), size: size, color: self.touchColor(), context: context)
    }
}

/// An interactive item with multipls colors and paths.
public protocol Tappables: Tappable {
    func backgroundImageColors() -> [UIColor]
    func backgroundImageSubpaths(_ size: CGSize) -> [CGMutablePath]
    func touchColors() -> [UIColor]
}

public extension Tappables {
    public func backgroundImageColors() -> [UIColor] {
        var colors: [UIColor] = [UIColor]()
        colors.append(Interface.theme.primaryDark)
        colors.append(Interface.theme.primaryLight)
        return colors
    }
    
    public func backgroundImage(_ context: CGContext?, size: CGSize) -> UIImage? {
        let paths = self.backgroundImageSubpaths(size)
        return UIImage.imageWithSubpaths(paths, colors: self.backgroundImageColors(), size: size, context: context)
    }
    
    public func touchColors() -> [UIColor] {
        var colors = backgroundImageColors()
        for (index, color) in colors.enumerated() {
            colors[index] = color.adaptingSaturation(by: 0.8)
        }
        return colors
    }
    
    public func touchImage(_ context: CGContext?, size: CGSize) -> UIImage? {
        let paths = self.backgroundImageSubpaths(size)
        return UIImage.imageWithSubpaths(paths, colors: self.touchColors(), size: size, context: context)
    }
}
