//===----------------------------------------------------------------------===//
//
// UIImage.swift
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
// Star Trek and related marks are registered trademarks of CBS® / PARAMOUNT®
// PLC. Original LCARS design credit: Mike Okuda.
//
//===----------------------------------------------------------------------===//

import UIKit

public extension UIImage {
    /// Creates a UIImage from a path, filled with the specified color
    static func imageWithPath(path: CGMutablePathRef, fillColor color: UIColor, context: CGContextRef?) -> UIImage? {
        var image: UIImage? = nil
        
        guard context != nil else {
            return image
        }
        
        CGContextSetLineWidth(context, 0)
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextAddPath(context, path)
        CGContextFillPath(context)
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    /// Creates a UIImage from a path, stroked with the specified color
    static func imageWithPath(path: CGMutablePathRef, strokeColor color: UIColor, strokeWidth: CGFloat, context: CGContextRef?) -> UIImage? {
        var image: UIImage? = nil
        
        guard context != nil else {
            return image
        }
        
        CGContextSetLineWidth(context, strokeWidth)
        CGContextSetStrokeColorWithColor(context, color.CGColor)
        CGContextAddPath(context, path)
        CGContextStrokePath(context)
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    /// Creates a `UIImage` by filling the provided path.
    static func imageWithPath(path: CGMutablePathRef, size: CGSize, color: UIColor, context: CGContextRef?) -> UIImage? {
        var image: UIImage? = nil
        
        if size.width == 0 || size.height == 0 {
            return image
        }
        
        if context == nil {
            return image
        }
        
        CGContextSetLineWidth(context, 0)
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextAddPath(context, path)
        CGContextFillPath(context)
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    /// Creates a `UIImage` by filling the provided paths with the provided colors.
    static func imageWithSubpaths(subpaths: [CGMutablePathRef], colors: [UIColor], size: CGSize, context: CGContextRef?) -> UIImage? {
        var image: UIImage? = nil
        
        guard size.width != 0 && size.height != 0 else {
            return image
        }
        
        guard let ctx = context else {
            return image
        }
        
        CGContextSetLineWidth(ctx, 0)
        
        for var i = 0; i < subpaths.count; i++ {
            if colors.count < i {
                CGContextSetFillColorWithColor(ctx, UIColor.neonCarrot().CGColor)
            } else {
                CGContextSetFillColorWithColor(ctx, colors[i].CGColor)
            }
            CGContextAddPath(ctx, subpaths[i])
            CGContextFillPath(ctx)
        }
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
}
