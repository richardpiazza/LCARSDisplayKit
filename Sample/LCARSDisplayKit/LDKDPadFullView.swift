//===----------------------------------------------------------------------===//
//
// LDKDPadFullView.swift
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

public class LDKDPadFullView: LDKDPadExpandedView {
    // Labeled for Sector or Arc Degree
    public var outerRing05: LDKCrescentButton = LDKCrescentButton()
    public var outerRingSector01: LDKCrescentButton = LDKCrescentButton()
    
    // Labeled numerically from zero degrees
    public var top01: LDKButton = LDKButton()
    public var top02: LDKButton = LDKButton()
    public var top03: LDKButton = LDKButton()
    public var top04: LDKButton = LDKButton()
    public var top05: LDKButton = LDKButton()
    
    override func defaultSize() -> CGSize {
        return CGSizeMake(794, 794)
    }
    
    override func graphOriginOffset() -> GraphOriginOffset {
        return GraphOriginOffset(x: 0.0, y: defaultSize().height * 0.0625)
    }
    
    override func edge01ExteriorRadius(rect: CGRect) -> CGFloat {
        return self.secondRingExteriorRadius(rect)
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let srir = self.secondRingInteriorRadius(rect)
        let srer = self.secondRingExteriorRadius(rect)
        
        var crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingSector01.startDegree, endDegree: LDKRingSector01.endDegree)
        outerRingSector01.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc05.startDegree, endDegree: LDKRingArc05.endDegree)
        outerRing05.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        var frame = CGRectZero
        if !CGPointEqualToPoint(edge04.edgePoint1, CGPointZero) {
            if !CGPointEqualToPoint(edge04.edgePoint2, CGPointZero) {
                frame.size.width = edge04.edgePoint2.x - edge04.edgePoint1.x
            }
        }
        
        frame.origin.x = edge04.frame.origin.x
        frame.origin.y = edge04.frame.origin.y - 68
        frame.size.height = 60
        
        var roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: false, rightRounded: false, cornersOnly: false)
        top01.setRoundedRectangle(roundedRectangle, withFrame: frame)
        
        
        if !CGPointEqualToPoint(edge05.edgePoint1, CGPointZero) {
            if !CGPointEqualToPoint(edge05.edgePoint2, CGPointZero) {
                frame.size.width = edge05.edgePoint2.x - edge05.edgePoint1.x
            }
        }
        
        frame.origin.x = edge05.frame.origin.x
        frame.origin.y = edge05.frame.origin.y - 68
        frame.size.height = 60
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: false, rightRounded: false, cornersOnly: false)
        top03.setRoundedRectangle(roundedRectangle, withFrame: frame)
        
        frame.size.width = 80
        frame.origin.x = top03.frame.origin.x - 88
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: true, rightRounded: false, cornersOnly: false)
        top02.setRoundedRectangle(roundedRectangle, withFrame: frame)
        
        frame.origin.x = top03.frame.origin.x + top03.frame.size.width + 8
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: false, rightRounded: true, cornersOnly: false)
        top04.setRoundedRectangle(roundedRectangle, withFrame: frame)
        
        frame.origin.x = top00.frame.origin.x
        frame.size.width = top00.frame.size.width
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: true, rightRounded: true, cornersOnly: false)
        top05.setRoundedRectangle(roundedRectangle, withFrame: frame)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        outerRingSector01.backgroundImageColor = UIColor.neonCarrot()
        outerRingSector01.setTitle("ORS01", forState: .Normal)
        if !self.subviews.contains(outerRingSector01) {
            self.addSubview(outerRingSector01)
        }
        
        outerRing05.backgroundImageColor = UIColor.neonCarrot()
        outerRing05.setTitle("OR05", forState: .Normal)
        if !self.subviews.contains(outerRing05) {
            self.addSubview(outerRing05)
        }
        
        top01.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        top01.setTitle("Calibrate", forState: .Normal)
        if !self.subviews.contains(top01) {
            self.addSubview(top01)
        }
        
        top02.backgroundImageColor = UIColor.paleCanary()
        top02.setTitle("T02", forState: .Normal)
        if !self.subviews.contains(top02) {
            self.addSubview(top02)
        }
        
        top03.backgroundImageColor = UIColor.marinerLCARS()
        top03.setTitle("T03", forState: .Normal)
        if !self.subviews.contains(top03) {
            self.addSubview(top03)
        }
        
        top04.backgroundImageColor = UIColor.neonCarrot()
        top04.setTitle("T04", forState: .Normal)
        if !self.subviews.contains(top04) {
            self.addSubview(top04)
        }
        
        top05.backgroundImageColor = UIColor.neonCarrot()
        top05.setTitle("T05", forState: .Normal)
        if !self.subviews.contains(top05) {
            self.addSubview(top05)
        }
    }
}
