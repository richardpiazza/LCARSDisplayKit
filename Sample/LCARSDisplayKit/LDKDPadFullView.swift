//
//  LDKDPadFullView.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

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
    
    override public class func defaultSize() -> CGSize {
        return CGSizeMake(794, 794)
    }
    
    override func originOffset() -> CGPoint {
        return CGPointMake(0, self.center.y * 0.125)
    }
    
    override func edge01ExteriorRadius(rect: CGRect) -> CGFloat {
        return self.secondRingExteriorRadius(rect)
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let graphOrigin = self.graphOrigin(rect)
        let srir = self.secondRingInteriorRadius(rect)
        let srer = self.secondRingExteriorRadius(rect)
        
        outerRingSector01.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingSector01.startDegree, endDegree: LDKRingSector01.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRingSector01) {
            self.addSubview(outerRingSector01)
        }
        
        outerRing05.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc05.startDegree, endDegree: LDKRingArc05.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing05) {
            self.addSubview(outerRing05)
        }
        
        var frame = CGRectZero
        if let edge = self.edge04 {
            if !CGPointEqualToPoint(edge.edgePoint1, CGPointZero) {
                if !CGPointEqualToPoint(edge.edgePoint2, CGPointZero) {
                    frame.size.width = edge.edgePoint2.x - edge.edgePoint1.x
                }
            }
            
            frame.origin.x = edge.frame.origin.x
            frame.origin.y = edge.frame.origin.y - 68
            frame.size.height = 60
        }
        
        top01.setAttributes(frame: frame, roundLeft: false, roundRight: false, isFrame: false)
        if !self.subviews.contains(top01) {
            self.addSubview(top01)
        }
        
        if let edge = self.edge05 {
            if !CGPointEqualToPoint(edge.edgePoint1, CGPointZero) {
                if !CGPointEqualToPoint(edge.edgePoint2, CGPointZero) {
                    frame.size.width = edge.edgePoint2.x - edge.edgePoint1.x
                }
            }
            
            frame.origin.x = edge.frame.origin.x
            frame.origin.y = edge.frame.origin.y - 68
            frame.size.height = 60
        }
        
        top03.setAttributes(frame: frame, roundLeft: false, roundRight: false, isFrame: false)
        if !self.subviews.contains(top03) {
            self.addSubview(top03)
        }
        
        frame.size.width = 80
        frame.origin.x = top03.frame.origin.x - 88
        
        top02.setAttributes(frame: frame, roundLeft: true, roundRight: false, isFrame: false)
        if !self.subviews.contains(top02) {
            self.addSubview(top02)
        }
        
        frame.origin.x = top03.frame.origin.x + top03.frame.size.width + 8
        
        top04.setAttributes(frame: frame, roundLeft: false, roundRight: true, isFrame: false)
        if !self.subviews.contains(top04) {
            self.addSubview(top04)
        }
        
        frame.origin.x = top00.frame.origin.x
        frame.size.width = top00.frame.size.width
        
        top05.setAttributes(frame: frame, roundLeft: true, roundRight: true, isFrame: false)
        if !self.subviews.contains(top05) {
            self.addSubview(top05)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        outerRingSector01.backgroundImageColor = UIColor.neonCarrot()
        outerRingSector01.setTitle("ORS01", forState: .Normal)
        
        outerRing05.backgroundImageColor = UIColor.neonCarrot()
        outerRing05.setTitle("OR05", forState: .Normal)
        
        top01.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        top01.setTitle("Calibrate", forState: .Normal)
        
        top02.backgroundImageColor = UIColor.paleCanary()
        top02.setTitle("T02", forState: .Normal)
        
        top03.backgroundImageColor = UIColor.marinerLCARS()
        top03.setTitle("T03", forState: .Normal)
        
        top04.backgroundImageColor = UIColor.neonCarrot()
        top04.setTitle("T04", forState: .Normal)
        
        top05.backgroundImageColor = UIColor.neonCarrot()
        top05.setTitle("T05", forState: .Normal)
    }
}
