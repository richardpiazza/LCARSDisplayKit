//===----------------------------------------------------------------------===//
//
// LDKSectorButton.swift
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

@IBDesignable public class LDKSectorButton: UIButton {
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.goldenTainoiLCARS()
    @IBInspectable public var radius: CGFloat = CGFloat(0)
    @IBInspectable public var startDegree: CGFloat = CGFloat(0)
    @IBInspectable public var endDegree: CGFloat = CGFloat(0)
    
    convenience init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, graphOrigin: GraphOrigin) {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        let frame = GraphFrame.frameFor(arc: arc).rectFor(graphOrigin)
        self.init(frame: frame)
        self.radius = arc.radius
        self.startDegree = arc.startDegree
        self.endDegree = arc.endDegree
    }
    
    public func setArc(arc: Arc) {
        self.radius = arc.radius
        self.startDegree = arc.startDegree
        self.endDegree = arc.endDegree
    }
}

// MARK: - Tappable
extension LDKSectorButton: Tappable {
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        let arc = Arc(radius: radius, startDegree: startDegree, endDegree: endDegree)
        return self.dynamicType.sectorPathWithArc(arc)
    }
}

// MARK: - CG Paths
extension LDKSectorButton {
    public static func sectorPathWithArc(arc: Arc) -> CGMutablePathRef {
        let path: CGMutablePathRef = CGPathCreateMutable()
        
        let graphFrame = GraphFrame.frameFor(arc: arc)
        let graphOrigin = graphFrame.graphOrigin
        let pivot = graphFrame.pivotFor(arc)
        
        CGPathAddArc(path, nil, graphOrigin.x, graphOrigin.y, arc.radius, arc.startDegree.toRadians(), arc.endDegree.toRadians(), false)
        CGPathAddLineToPoint(path, nil, pivot.x, pivot.y)
        CGPathCloseSubpath(path)
        
        return path
    }
}
