//
//  LDKDPadView.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

import UIKit

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
    
    /// X and Y valuses to offset the center of the dpad from the center of the frame
    func originOffset() -> CGPoint {
        return CGPointMake(0, 0)
    }
    
    func graphOrigin(rect: CGRect) -> GraphOrigin {
        let x = rect.size.width / 2 + self.originOffset().x
        let y = rect.size.height / 2 + self.originOffset().y
        return GraphOrigin(x: x, y: y)
    }
    
    func cruxInteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.size.width / 2) * 0.3125)
    }
    
    func cruxExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat(rect.size.width / 2)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let graphOrigin = self.graphOrigin(self.frame)
        let axisX = graphOrigin.x
        let axisY = graphOrigin.y
        let cruxInteriorRadius = self.cruxInteriorRadius(self.frame)
        let cruxExteriorRadius = self.cruxExteriorRadius(self.frame)
        
        var width = cruxInteriorRadius
        var height = cruxInteriorRadius
        var x = axisX - cruxInteriorRadius / 2
        var y = axisY - cruxInteriorRadius / 2
        
        var frame = CGRectMake(x, y, width, height)
        
        self.crux.frame = frame
        self.crux.setTitle("NIL", forState: .Normal)
        if !self.subviews.contains(self.crux) {
            self.addSubview(self.crux)
        }
        
        height = cruxExteriorRadius - 8 - cruxInteriorRadius / 2
        y = axisY - cruxExteriorRadius
        frame = CGRectMake(x, y, width, height)
        
        self.up.frame = frame
        self.up.radius = cruxExteriorRadius
        self.up.startDegree = LDKDirectionButtonUp.startDegree
        self.up.endDegree = LDKDirectionButtonUp.endDegree
        self.up.cardinalDegree = CGFloat(270)
        self.up.setTitle("Up", forState: .Normal)
        if !self.subviews.contains(self.up) {
            self.addSubview(self.up)
        }
        
        y = axisY + cruxInteriorRadius / 2 + 8
        frame = CGRectMake(x, y, width, height)
        
        self.down.frame = frame
        self.down.radius = cruxExteriorRadius
        self.down.startDegree = LDKDirectionButtonDown.startDegree
        self.down.endDegree = LDKDirectionButtonDown.endDegree
        self.down.cardinalDegree = CGFloat(90)
        self.down.setTitle("Down", forState: .Normal)
        if !self.subviews.contains(self.down) {
            self.addSubview(self.down)
        }
        
        height = cruxInteriorRadius
        width = cruxExteriorRadius - 8 - cruxInteriorRadius / 2
        x = axisX - cruxInteriorRadius / 2 - width - 8
        y = axisY - cruxInteriorRadius / 2
        frame = CGRectMake(x, y, width, height)
        
        self.left.frame = frame
        self.left.radius = cruxExteriorRadius
        self.left.startDegree = LDKDirectionButtonLeft.startDegree
        self.left.endDegree = LDKDirectionButtonLeft.endDegree
        self.left.cardinalDegree = CGFloat(180)
        self.left.setTitle("Left", forState: .Normal)
        if !self.subviews.contains(self.left) {
            self.addSubview(self.left)
        }
        
        x = axisX + cruxInteriorRadius / 2 + 8
        frame = CGRectMake(x, y, width, height)
        
        self.right.frame = frame
        self.right.radius = cruxExteriorRadius
        self.right.startDegree = LDKDirectionButtonRight.startDegree
        self.right.endDegree = LDKDirectionButtonRight.endDegree
        self.right.cardinalDegree = CGFloat(0)
        self.right.setTitle("Right", forState: .Normal)
        if !self.subviews.contains(self.right) {
            self.addSubview(self.right)
        }
        
        var arc = Arc(radius: cruxExteriorRadius, startDegree: LDKSectorButton01.startDegree, endDegree: LDKSectorButton01.endDegree)
        frame = GraphFrame.frameFor(arc: arc).rectFor(graphOrigin)
        
        self.sector01.frame = frame
        self.sector01.setArc(arc)
        self.sector01.setTitle("S01", forState: .Normal)
        self.sector01.contentVerticalAlignment = .Top
        self.sector01.contentHorizontalAlignment = .Right
        if !self.subviews.contains(self.sector01) {
            self.addSubview(self.sector01)
        }
        
        arc = Arc(radius: cruxExteriorRadius, startDegree: LDKSectorButton02.startDegree, endDegree: LDKSectorButton02.endDegree)
        frame = GraphFrame.frameFor(arc: arc).rectFor(graphOrigin)
        
        self.sector02.frame = frame
        self.sector02.setArc(arc)
        self.sector02.setTitle("S02", forState: .Normal)
        self.sector02.contentVerticalAlignment = .Top
        self.sector02.contentHorizontalAlignment = .Left
        if !self.subviews.contains(self.sector02) {
            self.addSubview(self.sector02)
        }
        
        arc = Arc(radius: cruxExteriorRadius, startDegree: LDKSectorButton03.startDegree, endDegree: LDKSectorButton03.endDegree)
        frame = GraphFrame.frameFor(arc: arc).rectFor(graphOrigin)
        
        self.sector03.frame = frame
        self.sector03.setArc(arc)
        self.sector03.setTitle("S03", forState: .Normal)
        self.sector03.contentVerticalAlignment = .Bottom
        self.sector03.contentHorizontalAlignment = .Left
        if !self.subviews.contains(self.sector03) {
            self.addSubview(self.sector03)
        }
        
        arc = Arc(radius: cruxExteriorRadius, startDegree: LDKSectorButton04.startDegree, endDegree: LDKSectorButton04.endDegree)
        frame = GraphFrame.frameFor(arc: arc).rectFor(graphOrigin)
        
        self.sector04.frame = frame
        self.sector04.setArc(arc)
        self.sector04.setTitle("S04", forState: .Normal)
        self.sector04.contentVerticalAlignment = .Bottom
        self.sector04.contentHorizontalAlignment = .Right
        if !self.subviews.contains(self.sector04) {
            self.addSubview(self.sector04)
        }
    }
}

// MARK: - Scalable
extension LDKDPadView: Scalable {
    public class func defaultSize() -> CGSize {
        return CGSizeMake(384, 384)
    }
}
