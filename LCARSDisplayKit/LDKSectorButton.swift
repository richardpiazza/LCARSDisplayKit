/*
*  LDKSectorButton.swift
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

@IBDesignable public class LDKSectorButton: UIButton, LDKTappable {
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.goldenTainoiLCARS()
    @IBInspectable public var radius: CGFloat = CGFloat(0)
    @IBInspectable public var startDegree: CGFloat = CGFloat(0)
    @IBInspectable public var endDegree: CGFloat = CGFloat(0)
    
    convenience init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, axisOrigin: LDKAxisOrigin) {
        let arc = LDKArc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        let frame = arc.axisFrame().viewFrameForAxisOrigin(axisOrigin)
        self.init(frame: frame)
        self.radius = arc.radius
        self.startDegree = arc.startDegree
        self.endDegree = arc.endDegree
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
    
    public func setArc(arc: LDKArc) {
        self.radius = arc.radius
        self.startDegree = arc.startDegree
        self.endDegree = arc.endDegree
    }
    
    //MARK: - LDKTappable -
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        let arc = LDKArc(radius: self.radius, startDegree: self.startDegree, endDegree: self.endDegree)
        return self.dynamicType.sectorPathWithArc(arc)
    }
    
    // Mark: - Path -
    public static func sectorPathWithArc(arc: LDKArc) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        let axisFrame = arc.axisFrame()
        let axisOrigin = axisFrame.axisOrigin()
        let pivot = arc.rightAnglePivot(axisFrame)
        
        CGPathAddArc(path, nil, axisOrigin.x, axisOrigin.y, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
        CGPathAddLineToPoint(path, nil, pivot.x, pivot.y)
        CGPathCloseSubpath(path)
        
        return path
    }
}
