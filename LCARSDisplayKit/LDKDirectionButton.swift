/*
*  LDKDirectionButton.swift
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

@IBDesignable public class LDKDirectionButton: UIButton, LDKTappables {
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.neonCarrot()
    @IBInspectable public var radius: CGFloat = CGFloat(0)
    @IBInspectable public var startDegree: CGFloat = CGFloat(0)
    @IBInspectable public var endDegree: CGFloat = CGFloat(0)
    @IBInspectable public var cardinalDegree: CGFloat = CGFloat(0)
    
    convenience init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, cardinalDegree: CGFloat) {
        let arc = LDKArc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        let axisFrame = LDKAxisFrame.axisFrameForPoints(arc.points(), radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
        let frame = axisFrame.viewFrameForAxisOrigin(axisFrame.axisOrigin())
        self.init(frame: frame)
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
        self.cardinalDegree = cardinalDegree
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.backgroundImage(context, size: rect.size), forState: .Normal)
    }
    
    public override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        let path = self.backgroundImagePath(self.bounds.size)
        return CGPathContainsPoint(path, nil, point, false)
    }
    
    //MARK: - LDKTappable -
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        let arc = LDKArc(radius: self.radius, startDegree: self.startDegree, endDegree: self.endDegree)
        return self.dynamicType.directionPathWithArc(arc, cardinalDegree: self.cardinalDegree, size: size)
    }
    
    //MARK: - LDKTappables -
    public func backgroundImageSubpaths(size: CGSize) -> [CGMutablePathRef] {
        let arc = LDKArc(radius: self.radius, startDegree: self.startDegree, endDegree: self.endDegree)
        return self.dynamicType.directionSubpathsWithArc(arc, cardinalDegree: self.cardinalDegree, size: size)
    }
    
    //MARK: - Path -
    public static func directionPathWithArc(arc: LDKArc, cardinalDegree: CGFloat, size: CGSize) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        let paths = self.directionSubpathsWithArc(arc, cardinalDegree: cardinalDegree, size: size)
        for p in paths {
            CGPathAddPath(path, nil, p)
        }
        
        return path
    }
    
    public static func directionSubpathsWithArc(arc: LDKArc, cardinalDegree: CGFloat, size: CGSize) -> [CGMutablePathRef] {
        var paths: [CGMutablePathRef] = [CGMutablePathRef]()
        
        guard cardinalDegree == 0 || cardinalDegree == 90 || cardinalDegree == 180 || cardinalDegree == 270 else {
            return paths
        }
        
        let axisFrame = LDKAxisFrame.axisFrameForPoints(arc.points(), radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
        let axisOrigin = axisFrame.axisOrigin()
        let unit = min(size.width, size.height) / 2
        
        if cardinalDegree == 0 {
            // Right
            let arrowPath: CGMutablePathRef = CGPathCreateMutable()
            let arcX = size.width + axisOrigin.x - axisFrame.width
            CGPathAddArc(arrowPath, nil, arcX, axisOrigin.y, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
            CGPathAddLineToPoint(arrowPath, nil, size.width - unit, size.height)
            CGPathAddLineToPoint(arrowPath, nil, size.width - unit, 0)
            CGPathCloseSubpath(arrowPath)
            
            CGPathMoveToPoint(arrowPath, nil, size.width - (unit * 1.25), unit)
            CGPathAddLineToPoint(arrowPath, nil, size.width - (unit * 1.75), size.height * 0.1)
            CGPathAddLineToPoint(arrowPath, nil, size.width - (unit * 1.75), size.height * 0.9)
            CGPathCloseSubpath(arrowPath)
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePathRef = CGPathCreateMutable()
            CGPathAddRect(remainingPath, nil, CGRectMake(0, 0, size.width - (unit * 2.0), size.height))
            paths.append(remainingPath)
        } else if cardinalDegree == 90 {
            // Down
            let arrowPath: CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(arrowPath, nil, axisOrigin.x, size.height + axisOrigin.y - axisFrame.height, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
            CGPathAddLineToPoint(arrowPath, nil, 0, size.height - unit)
            CGPathAddLineToPoint(arrowPath, nil, size.width, size.height - unit)
            CGPathCloseSubpath(arrowPath)
            
            CGPathMoveToPoint(arrowPath, nil, unit, size.height - (unit * 1.25))
            CGPathAddLineToPoint(arrowPath, nil, size.width * 0.1, size.height - (unit * 1.75))
            CGPathAddLineToPoint(arrowPath, nil, size.width * 0.9, size.height - (unit * 1.75))
            CGPathCloseSubpath(arrowPath)
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePathRef = CGPathCreateMutable()
            CGPathAddRect(remainingPath, nil, CGRectMake(0, 0, size.width, size.height - (unit * 2)))
            paths.append(remainingPath)
        } else if cardinalDegree == 180 {
            // Left
            let arrowPath: CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(arrowPath, nil, axisOrigin.x, axisOrigin.y, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
            CGPathAddLineToPoint(arrowPath, nil, unit, 0)
            CGPathAddLineToPoint(arrowPath, nil, unit, size.height)
            CGPathCloseSubpath(arrowPath)
            
            CGPathMoveToPoint(arrowPath, nil, (unit * 1.25), unit)
            CGPathAddLineToPoint(arrowPath, nil, (unit * 1.75), size.height * 0.1)
            CGPathAddLineToPoint(arrowPath, nil, (unit * 1.75), size.height * 0.9)
            CGPathCloseSubpath(arrowPath)
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePathRef = CGPathCreateMutable()
            CGPathAddRect(remainingPath, nil, CGRectMake((unit * 2), 0, size.width - (unit * 2.0), size.height))
            paths.append(remainingPath)
        } else if cardinalDegree == 270 {
            // Up
            let arrowPath: CGMutablePathRef = CGPathCreateMutable()
            CGPathAddArc(arrowPath, nil, axisOrigin.x, axisOrigin.y, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
            CGPathAddLineToPoint(arrowPath, nil, size.width, unit)
            CGPathAddLineToPoint(arrowPath, nil, 0, unit)
            CGPathCloseSubpath(arrowPath)
            
            CGPathMoveToPoint(arrowPath, nil, unit, (unit * 1.25))
            CGPathAddLineToPoint(arrowPath, nil, size.width * 0.1, (unit * 1.75))
            CGPathAddLineToPoint(arrowPath, nil, size.width * 0.9, (unit * 1.75))
            CGPathCloseSubpath(arrowPath)
            
            CGPathAddRect(arrowPath, nil, CGRectMake(0, (unit * 2.0), size.width, (unit * 0.5)))
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePathRef = CGPathCreateMutable()
            CGPathAddRect(remainingPath, nil, CGRectMake(0, (unit * 2.75), size.width, unit))
            CGPathAddRect(remainingPath, nil, CGRectMake(0, (unit * 4.0), size.width, size.height - (unit * 4.0)))
            paths.append(remainingPath)
        }
        
        return paths
    }
}
