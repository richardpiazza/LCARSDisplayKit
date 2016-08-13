//===----------------------------------------------------------------------===//
//
// LDKDPadView.swift
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

public typealias LDKDegreeRange = (startDegree: CGFloat, endDegree: CGFloat)

public let LDKDirectionButtonUp: LDKDegreeRange = (CGFloat(260.5), CGFloat(279.5))
public let LDKDirectionButtonDown: LDKDegreeRange = (CGFloat(80.5), CGFloat(99.5))
public let LDKDirectionButtonLeft: LDKDegreeRange = (CGFloat(170.5), CGFloat(189.5))
public let LDKDirectionButtonRight: LDKDegreeRange = (CGFloat(350.5), CGFloat(9.5))
public let LDKSectorButton01: LDKDegreeRange = (CGFloat(11), CGFloat(79))
public let LDKSectorButton02: LDKDegreeRange = (CGFloat(101), CGFloat(169))
public let LDKSectorButton03: LDKDegreeRange = (CGFloat(191), CGFloat(259))
public let LDKSectorButton04: LDKDegreeRange = (CGFloat(281), CGFloat(349))
public let LDKRingSector01: LDKDegreeRange = (CGFloat(10.5), CGFloat(79.5))
public let LDKRingSector02: LDKDegreeRange = (CGFloat(99.5), CGFloat(169.5))
public let LDKRingSector03: LDKDegreeRange = (CGFloat(189.5), CGFloat(259.5))
public let LDKRingSector04: LDKDegreeRange = (CGFloat(280.5), CGFloat(350.5))
public let LDKRingArc01: LDKDegreeRange = (CGFloat(9.5), CGFloat(25.5))
public let LDKRingArc02: LDKDegreeRange = (CGFloat(27.5), CGFloat(43.5))
public let LDKRingArc03: LDKDegreeRange = (CGFloat(45.5), CGFloat(61.5))
public let LDKRingArc04: LDKDegreeRange = (CGFloat(63.5), CGFloat(79.5))
public let LDKRingArc05: LDKDegreeRange = (CGFloat(81.5), CGFloat(97.5))
public let LDKRingArc06: LDKDegreeRange = (CGFloat(99.5), CGFloat(115.5))
public let LDKRingArc07: LDKDegreeRange = (CGFloat(117.5), CGFloat(133.5))
public let LDKRingArc08: LDKDegreeRange = (CGFloat(135.5), CGFloat(151.5))
public let LDKRingArc09: LDKDegreeRange = (CGFloat(153.5), CGFloat(169.5))
public let LDKRingArc10: LDKDegreeRange = (CGFloat(171.5), CGFloat(187.5))
public let LDKRingArc11: LDKDegreeRange = (CGFloat(189.5), CGFloat(205.5))
public let LDKRingArc12: LDKDegreeRange = (CGFloat(207.5), CGFloat(223.5))
public let LDKRingArc13: LDKDegreeRange = (CGFloat(225.5), CGFloat(241.5))
public let LDKRingArc14: LDKDegreeRange = (CGFloat(243.5), CGFloat(259.5))
public let LDKRingArc15: LDKDegreeRange = (CGFloat(261.5), CGFloat(278.5))
public let LDKRingArc16: LDKDegreeRange = (CGFloat(280.5), CGFloat(296.5))
public let LDKRingArc17: LDKDegreeRange = (CGFloat(298.5), CGFloat(314.5))
public let LDKRingArc18: LDKDegreeRange = (CGFloat(316.5), CGFloat(332.5))
public let LDKRingArc19: LDKDegreeRange = (CGFloat(334.5), CGFloat(350.5))
public let LDKRingArc20: LDKDegreeRange = (CGFloat(352.5), CGFloat(8.5))

/// Represents the percent difference in both X (width) and Y (height) from a
/// default size.
public typealias GraphMultiplier = CGSize

@IBDesignable public class LDKDPadView: UIView {
    public var crux: LDKButton = LDKButton()
    public var up: LDKDirectionButton = LDKDirectionButton()
    public var down: LDKDirectionButton = LDKDirectionButton()
    public var left: LDKDirectionButton = LDKDirectionButton()
    public var right: LDKDirectionButton = LDKDirectionButton()
    public var sector01: LDKSectorButton = LDKSectorButton()
    public var sector02: LDKSectorButton = LDKSectorButton()
    public var sector03: LDKSectorButton = LDKSectorButton()
    public var sector04: LDKSectorButton = LDKSectorButton()
    
    func defaultSize() -> CGSize {
        return CGSizeMake(384, 384)
    }
    
    func graphOriginOffset() -> GraphOriginOffset {
        return GraphOriginOffset(x: 0, y: 0)
    }
    
    func scaleOfDefaultSize(actualSize: CGSize) -> GraphMultiplier {
        return GraphMultiplier(width: CGFloat(actualSize.width / defaultSize().width), height: CGFloat(actualSize.height / defaultSize().height))
    }
    
    func cruxInteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.size.width / 2) * 0.3125)
    }
    
    func cruxExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat(rect.size.width / 2)
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let graphOrigin = GraphOrigin(x: rect.graphOrigin.x + graphOriginOffset().x, y: rect.graphOrigin.y + graphOriginOffset().y)
        
        let cir = cruxInteriorRadius(rect)
        let cer = cruxExteriorRadius(rect)
        
        var width = cir
        var height = cir
        var x = graphOrigin.x - (width / 2)
        var y = graphOrigin.y - (height / 2)
        
        var frame = CGRect(x: x, y: y, width: width, height: height)
        
        crux.frame = frame
        
        height = cer - 8 - cir / 2
        y = graphOrigin.y - cer
        frame = CGRectMake(x, y, width, height)
        
        up.frame = frame
        up.radius = cer
        up.startDegree = LDKDirectionButtonUp.startDegree
        up.endDegree = LDKDirectionButtonUp.endDegree
        up.cardinalDegree = CGFloat(270)
        
        y = graphOrigin.y + cir / 2 + 8
        frame = CGRectMake(x, y, width, height)
        
        down.frame = frame
        down.radius = cer
        down.startDegree = LDKDirectionButtonDown.startDegree
        down.endDegree = LDKDirectionButtonDown.endDegree
        down.cardinalDegree = CGFloat(90)
        
        height = cir
        width = cer - 8 - cir / 2
        x = graphOrigin.x - cir / 2 - width - 8
        y = graphOrigin.y - cir / 2
        frame = CGRectMake(x, y, width, height)
        
        left.frame = frame
        left.radius = cer
        left.startDegree = LDKDirectionButtonLeft.startDegree
        left.endDegree = LDKDirectionButtonLeft.endDegree
        left.cardinalDegree = CGFloat(180)
        
        x = graphOrigin.x + cir / 2 + 8
        frame = CGRectMake(x, y, width, height)
        
        right.frame = frame
        right.radius = cer
        right.startDegree = LDKDirectionButtonRight.startDegree
        right.endDegree = LDKDirectionButtonRight.endDegree
        right.cardinalDegree = CGFloat(0)
        
        var arc = Arc(radius: cer, startDegree: LDKSectorButton01.startDegree, endDegree: LDKSectorButton01.endDegree)
        sector01.setArc(arc, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        arc = Arc(radius: cer, startDegree: LDKSectorButton02.startDegree, endDegree: LDKSectorButton02.endDegree)
        sector02.setArc(arc, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        arc = Arc(radius: cer, startDegree: LDKSectorButton03.startDegree, endDegree: LDKSectorButton03.endDegree)
        sector03.setArc(arc, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        arc = Arc(radius: cer, startDegree: LDKSectorButton04.startDegree, endDegree: LDKSectorButton04.endDegree)
        sector04.setArc(arc, inRect: rect, withGraphOriginOffset: graphOriginOffset())
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        crux.setTitle("NIL", forState: .Normal)
        if !self.subviews.contains(crux) {
            self.addSubview(crux)
        }
        
        up.setTitle("Up", forState: .Normal)
        if !self.subviews.contains(up) {
            self.addSubview(up)
        }
        
        down.setTitle("Down", forState: .Normal)
        if !self.subviews.contains(down) {
            self.addSubview(down)
        }
        
        left.setTitle("Left", forState: .Normal)
        if !self.subviews.contains(left) {
            self.addSubview(left)
        }
        
        right.setTitle("Right", forState: .Normal)
        if !self.subviews.contains(right) {
            self.addSubview(right)
        }
        
        sector01.setTitle("S01", forState: .Normal)
        sector01.contentVerticalAlignment = .Top
        sector01.contentHorizontalAlignment = .Right
        if !self.subviews.contains(sector01) {
            self.addSubview(sector01)
        }
        
        sector02.setTitle("S02", forState: .Normal)
        sector02.contentVerticalAlignment = .Top
        sector02.contentHorizontalAlignment = .Left
        if !self.subviews.contains(sector02) {
            self.addSubview(sector02)
        }
        
        sector03.setTitle("S03", forState: .Normal)
        sector03.contentVerticalAlignment = .Bottom
        sector03.contentHorizontalAlignment = .Left
        if !self.subviews.contains(sector03) {
            self.addSubview(sector03)
        }
        
        sector04.setTitle("S04", forState: .Normal)
        sector04.contentVerticalAlignment = .Bottom
        sector04.contentHorizontalAlignment = .Right
        if !self.subviews.contains(sector04) {
            self.addSubview(sector04)
        }
    }
}