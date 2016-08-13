//===----------------------------------------------------------------------===//
//
// LDKDirectionButton.swift
//
// Copyright (c) 2015 Richard Piazza
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
import GraphPoint

@IBDesignable public class LDKDirectionButton: UIButton, Tappables {
    @IBInspectable public var backgroundImageColor: UIColor = Interface.theme.primaryDark
    @IBInspectable public var radius: CGFloat = CGFloat(0)
    @IBInspectable public var startDegree: CGFloat = CGFloat(0)
    @IBInspectable public var endDegree: CGFloat = CGFloat(0)
    @IBInspectable public var cardinalDegree: CGFloat = CGFloat(0)
    
    convenience init(inRect rect: CGRect, radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, cardinalDegree: CGFloat) {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        let graphFrame = GraphFrame.graphFrame(forGraphPoints: arc.graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
        let frame = graphFrame.frame(forGraphFrame: graphFrame, graphOriginOffset: graphFrame.graphOriginOffset)
        self.init(frame: frame)
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
        self.cardinalDegree = cardinalDegree
    }
    
    // MARK: - Tappables
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        return self.dynamicType.directionPathWithArc(arc, cardinalDegree: cardinalDegree, size: size)
    }
    
    public func backgroundImageSubpaths(size: CGSize) -> [CGMutablePathRef] {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        return self.dynamicType.directionSubpathsWithArc(arc, cardinalDegree: cardinalDegree, size: size)
    }
    
    // MARK: - CG Paths
    public static func directionPathWithArc(arc: Arc, cardinalDegree: CGFloat, size: CGSize) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        let paths = self.directionSubpathsWithArc(arc, cardinalDegree: cardinalDegree, size: size)
        for p in paths {
            CGPathAddPath(path, nil, p)
        }
        
        return path
    }
    
    public static func directionSubpathsWithArc(arc: Arc, cardinalDegree: CGFloat, size: CGSize) -> [CGMutablePathRef] {
        var paths: [CGMutablePathRef] = [CGMutablePathRef]()
        
        guard cardinalDegree == 0 || cardinalDegree == 90 || cardinalDegree == 180 || cardinalDegree == 270 else {
            return paths
        }
        
        let graphFrame = GraphFrame.graphFrame(forGraphPoints: arc.graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
        let offset = graphFrame.graphOriginOffset
        let unit = min(size.width, size.height) / 2
        
        if cardinalDegree == 0 {
            // Right
            let arrowPath: CGMutablePathRef = CGPathCreateMutable()
            let arcX = size.width + offset.x - graphFrame.width
            CGPathAddArc(arrowPath, nil, arcX, offset.y, arc.radius, arc.startDegree.radians, arc.endDegree.radians, false)
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
            CGPathAddArc(arrowPath, nil, offset.x, size.height + offset.y - graphFrame.height, arc.radius, arc.startDegree.radians, arc.endDegree.radians, false)
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
            CGPathAddArc(arrowPath, nil, offset.x, offset.y, arc.radius, arc.startDegree.radians, arc.endDegree.radians, false)
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
            CGPathAddArc(arrowPath, nil, offset.x, offset.y, arc.radius, arc.startDegree.radians, arc.endDegree.radians, false)
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
