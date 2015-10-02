/*
*  LDKExtensions.swift
*
*  Copyright (c) 2015 Richard Piazza
*
*  Permission is hereby granted, free of charge, to any person obtaining a copy
*  of this software and associated documentation files (the "Software"), to deal
*  in the Software without restriction, including without limitation the rights
*  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*  copies of the Software, and to permit persons to whom the Software is
*  furnished to do so, subject to the following conditions:
*
*  The above copyright notice and this permission notice shall be included in all
*  copies or substantial portions of the Software.
*
*  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
*  SOFTWARE.
*
*  Star Trek and related marks are registered trademarks of CBS® / PARAMOUNT® PLC.
*  Original LCARS design credit: Mike Okuda.
*/

import UIKit

/// An X,Y pair indicating where an Axis graph 0,0 is located relative to view.
public typealias LDKAxisOrigin = CGPoint

/// An X,Y pair representing any point on an Axis graph
public typealias LDKAxisPoint = CGPoint

/// Used when scaling objects to non-default sizes
public typealias LDKAxisMultiplier = CGSize

/// A frame with it's origin relative to an Axis graph 0,0
public typealias LDKAxisFrame = CGRect
public extension LDKAxisFrame {
    func description() -> String {
        let origin = "{ \(self.origin.x), \(self.origin.y) }"
        let size = "{ \(self.size.width), \(self.size.height) }"
        return "Frame: \(origin) \(size)"
    }
    
    /// Calculates the correct view frame for this `Axis Frame`.
    func viewFrameForAxisOrigin(origin: LDKAxisOrigin) -> CGRect {
        return CGRectMake(origin.x + self.origin.x, origin.y - self.origin.y, self.width, self.height)
    }
    
    /// Translates an axis frame point to a view frame point
    func viewPointForAxisPoint(axisPoint: LDKAxisPoint) -> CGPoint {
        let x = abs(self.origin.x - axisPoint.x)
        let y = abs(self.origin.y - axisPoint.y)
        return CGPointMake(x, y)
    }
    
    /// Calculates the axis origin from the axis frame offset
    func axisOrigin() -> LDKAxisOrigin {
        var axisOrigin = CGPointZero
        
        if self.origin.x < 0 {
            axisOrigin = CGPointMake(abs(self.origin.x), self.origin.y)
        } else {
            axisOrigin = CGPointMake(-(self.origin.x), self.origin.y)
        }
        
        return axisOrigin
    }
    
    /// Determines a frame that encompases all points provided
    static func axisFrameForPoints(points: [LDKAxisPoint]) -> LDKAxisFrame {
        var minXMaxY: CGPoint = CGPointZero
        var maxXMinY: CGPoint = CGPointZero
        
        for point in points {
            if (point.x < minXMaxY.x || minXMaxY.x == 0) {
                minXMaxY.x = point.x
            }
            if (point.y > minXMaxY.y || minXMaxY.y == 0) {
                minXMaxY.y = point.y
            }
            if (point.x > maxXMinY.x || maxXMinY.x == 0) {
                maxXMinY.x = point.x
            }
            if (point.y < maxXMinY.y || maxXMinY.y == 0) {
                maxXMinY.y = point.y
            }
        }
        
        return CGRectMake(minXMaxY.x, minXMaxY.y, abs(maxXMinY.x - minXMaxY.x), abs(maxXMinY.y - minXMaxY.y))
    }
    
    /// Determines a frame that encompases all points as well as any expansion needed for crossing a axis
    static func axisFrameForPoints(points: [LDKAxisPoint], radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) -> LDKAxisFrame {
        var axisFrame = self.axisFrameForPoints(points)
        
        if (startDegree >= 270) {
            if (endDegree <= 90) {
                if (abs(axisFrame.origin.x + axisFrame.width) < radius) {
                    let expanded = radius - abs(axisFrame.origin.x + axisFrame.width)
                    axisFrame.size.width = axisFrame.size.width + expanded
                }
            }
        } else if (startDegree >= 180) {
            if (endDegree > 270) {
                if (abs(axisFrame.origin.y) < radius) {
                    let expanded = radius - abs(axisFrame.origin.y)
                    axisFrame.origin.y = axisFrame.origin.y + expanded
                    axisFrame.size.height = axisFrame.size.height + expanded
                }
            }
        } else if (startDegree >= 90) {
            if (endDegree > 180) {
                if (abs(axisFrame.origin.x) < radius) {
                    let expanded = radius - abs(axisFrame.origin.x)
                    axisFrame.origin.x = axisFrame.origin.x - expanded
                    axisFrame.size.width = axisFrame.size.width + expanded
                }
            }
        } else if (startDegree >= 0) {
            if (endDegree > 90) {
                if (abs(axisFrame.origin.y + axisFrame.height) < radius) {
                    let expanded = radius - abs(axisFrame.origin.y + axisFrame.height)
                    axisFrame.size.height = axisFrame.size.height + expanded
                }
            }
        }
        
        return axisFrame
    }
}

public extension CGFloat {
    /// Converts a float value representing a angular degree to radians
    func toRadians() -> CGFloat {
        return CGFloat(Double(self) * (M_PI / 180))
    }
    
    /// Converts a float value representing a radian value to angular degree
    func toDegress() -> CGFloat {
        return CGFloat(Double(self) * (180 / M_PI))
    }
}

public extension UIColor {
    /// A pale-yellow color; Hex #FFFF99
    static func paleCanary() -> UIColor {
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha: 1.0)
    }
    
    /// A medium-yellow color; Hex #FFCC5C
    static func goldenTainoi() -> UIColor {
        return UIColor(red: 255/255.0, green: 202/255.0, blue: 92/255.0, alpha: 1.0)
    }
    
    /// A medium-yellow color; Hex #FFCC66; Closer non-named LCARS variant
    static func goldenTainoiLCARS() -> UIColor {
        return UIColor(red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A dense-orange color; Hex #FF9933
    static func neonCarrot() -> UIColor {
        return UIColor(red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha: 1.0)
    }
    
    /// A pale-purple color; Hex #664466
    static func cosmic() -> UIColor {
        return UIColor(red: 118/255.0, green: 57/255.0, blue: 93/255.0, alpha: 1.0)
    }
    
    /// A pale-purple color; Hex #664466; Closer non-named LCARS variant
    static func cosmicLCARS() -> UIColor {
        return UIColor(red: 102/255.0, green: 68/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A medium-purple color; Hex #CB99C9
    static func pastelViolet() -> UIColor {
        return UIColor(red: 203/255.0, green: 153/255.0, blue: 201/255.0, alpha: 1.0)
    }
    
    /// A medium-purple color; Hex #CC99CC; Closer non-named LCARS variant
    static func pastelVioletLCARS() -> UIColor {
        return UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A pale-blue color; Hex #A1CAF1
    static func babyBlueEyes() -> UIColor {
        return UIColor(red: 161/255.0, green: 202/255.0, blue: 241/255.0, alpha: 1.0)
    }
    
    /// A pale-blue color; Hex #99CCFF; Closer non-named LCARS variant
    static func babyBlueEyesLCARS() -> UIColor {
        return UIColor(red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
    }
    
    /// A medium-blue color; Hex #286ACD
    static func mariner() -> UIColor {
        return UIColor(red: 40/255.0, green: 106/255.0, blue: 205/255.0, alpha: 1.0)
    }
    
    /// A medium-blue color; Hex #3366CC; Closer non-named LCARS variant
    static func marinerLCARS() -> UIColor {
        return UIColor(red: 51/255.0, green: 102/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A rich blue color; Hex #026395
    static func bahamaBlue() -> UIColor {
        return UIColor(red: 2/255.0, green: 99/255.0, blue: 149/255.0, alpha: 1.0)
    }
    
    /// A rich blue color; Hex #006699; Close non-named LCARS variant
    static func bahamaBlueLCARS() -> UIColor {
        return UIColor(red: 0/255.0, green: 102/255.0, blue: 153/255.0, alpha: 1.0)
    }
    
    /// A flat gray color; Hex #6D6C6C
    static func doveGray() -> UIColor {
        return UIColor(red: 109/255.0, green: 108/255.0, blue: 108/255.0, alpha: 1.0)
    }
    
    /// A flat gray color; Hex #6E6E6E; Close non-named LCARS variant
    static func doveGrayLCARS() -> UIColor {
        return UIColor(red: 110/255.0, green: 110/255.0, blue: 110/255.0, alpha: 1.0)
    }
}

public extension UIImage {
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
