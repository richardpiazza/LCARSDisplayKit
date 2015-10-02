/*
*  LDKCrescentButton.swift
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

@IBDesignable public class LDKCrescentButton: UIButton, LDKTappable {
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.neonCarrot()
    @IBInspectable public var innerRadius: CGFloat = CGFloat(0)
    @IBInspectable public var outerRadius: CGFloat = CGFloat(0)
    @IBInspectable public var startDegree: CGFloat = CGFloat(0)
    @IBInspectable public var endDegree: CGFloat = CGFloat(0)
    
    convenience init(innerRadius: CGFloat, outerRadius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, axisOrigin: LDKAxisOrigin) {
        let innerArc = LDKArc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = LDKArc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        var points = [LDKAxisPoint]()
        points.appendContentsOf(innerArc.points())
        points.appendContentsOf(outerArc.points())
        let axisFrame = LDKAxisFrame.axisFrameForPoints(points, radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        let frame = axisFrame.viewFrameForAxisOrigin(axisOrigin)
        self.init(frame: frame)
        self.innerRadius = innerRadius
        self.outerRadius = outerRadius
        self.startDegree = startDegree
        self.endDegree = endDegree
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
        let innerArc = LDKArc(radius: self.innerRadius, startDegree: self.startDegree, endDegree: self.endDegree)
        let outerArc = LDKArc(radius: self.outerRadius, startDegree: self.startDegree, endDegree: self.endDegree)
        return self.dynamicType.cresentPathWithArcs(innerArc, outerArc: outerArc)
    }
    
    public func backgroundImage(context: CGContextRef?, size: CGSize) -> UIImage? {
        let path = self.backgroundImagePath(size)
        return UIImage.imageWithPath(path, size: size, color: self.backgroundImageColor, context: context)
    }
    
    //MARK: - Path -
    public static func cresentPathWithArcs(innerArc: LDKArc, outerArc: LDKArc) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        var points = [LDKAxisPoint]()
        points.appendContentsOf(innerArc.points())
        points.appendContentsOf(outerArc.points())
        
        let axisFrame = LDKAxisFrame.axisFrameForPoints(points, radius: outerArc.radius, startDegree: outerArc.startDegree, endDegree: outerArc.endDegree)
        let axisOrigin = axisFrame.axisOrigin()
        let outerEnd = axisFrame.viewPointForAxisPoint(outerArc.endPoint())
        
        CGPathAddArc(path, nil, axisOrigin.x, axisOrigin.y, innerArc.radius, innerArc.startDegree.toRadians(), innerArc.endDegree.toRadians(), false)
        CGPathAddLineToPoint(path, nil, outerEnd.x, outerEnd.y)
        CGPathAddArc(path, nil, axisOrigin.x, axisOrigin.y, outerArc.radius, outerArc.endDegree.toRadians(), outerArc.startDegree.toRadians(), true)
        CGPathCloseSubpath(path)
        
        return path
    }
}
