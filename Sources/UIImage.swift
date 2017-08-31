//===----------------------------------------------------------------------===//
//
// UIImage.swift
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

public extension UIImage {
    /// Creates a UIImage from a path, filled with the specified color
    static func image(with path: CGMutablePath, fillColor color: UIColor, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil

        guard context != nil else {
            return image
        }

        context?.setLineWidth(0)
        context?.setFillColor(color.cgColor)
        context?.addPath(path)
        context?.fillPath()

        image = UIGraphicsGetImageFromCurrentImageContext()

        return image
    }
    
    /// Creates a UIImage from a path, stroked with the specified color
    static func image(with path: CGMutablePath, strokeColor color: UIColor, strokeWidth: CGFloat, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil
        
        guard context != nil else {
            return image
        }
        
        context?.setLineWidth(strokeWidth)
        context?.setStrokeColor(color.cgColor)
        context?.addPath(path)
        context?.strokePath()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    /// Creates a `UIImage` by filling the provided path.
    static func image(with path: CGMutablePath, size: CGSize, color: UIColor, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil
        
        if size.width == 0 || size.height == 0 {
            return image
        }
        
        if context == nil {
            return image
        }
        
        context?.setLineWidth(0)
        context?.setFillColor(color.cgColor)
        context?.addPath(path)
        context?.fillPath()
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    /// Creates a `UIImage` by filling the provided paths with the provided colors.
    static func image(with subpaths: [CGMutablePath], colors: [UIColor], size: CGSize, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil
        
        guard subpaths.count != 0, subpaths.count == colors.count else {
            return image
        }
        
        guard size.width != 0 && size.height != 0 else {
            return image
        }
        
        guard let ctx = context else {
            return image
        }
        
        ctx.setLineWidth(0)
        
        for i in 0..<subpaths.count {
            ctx.setFillColor(colors[i].cgColor)
            ctx.addPath(subpaths[i])
            ctx.fillPath()
        }
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
}
