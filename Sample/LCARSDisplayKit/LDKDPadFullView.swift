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
    public var outerRing05: LDKCrescentButton?
    public var outerRingSector01: LDKCrescentButton?
    
    // Labeled numerically from zero degrees
    public var top01: LDKButton?
    public var top02: LDKButton?
    public var top03: LDKButton?
    public var top04: LDKButton?
    public var top05: LDKButton?
    
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
        
        self.outerRingSector01 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingSector01.startDegree, endDegree: LDKRingSector01.endDegree, graphOrigin: graphOrigin)
        if let button = self.outerRingSector01 {
            self.addSubview(button)
        }
        
        self.outerRing05 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc05.startDegree, endDegree: LDKRingArc05.endDegree, graphOrigin: graphOrigin)
        if let button = self.outerRing05 {
            self.addSubview(button)
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
        
        self.top01 = LDKButton(frame: frame, roundLeft: false, roundRight: false, isFrame: false)
        if let button = self.top01 {
            self.addSubview(button)
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
        
        self.top03 = LDKButton(frame: frame, roundLeft: false, roundRight: false, isFrame: false)
        if let button = self.top03 {
            self.addSubview(button)
        }
        
        if let button = self.top03 {
            frame.size.width = 80
            frame.origin.x = button.frame.origin.x - 88
        }
        
        self.top02 = LDKButton(frame: frame, roundLeft: true, roundRight: false, isFrame: false)
        if let button = self.top02 {
            self.addSubview(button)
        }
        
        if let button = self.top03 {
            frame.origin.x = button.frame.origin.x + button.frame.size.width + 8
        }
        
        self.top04 = LDKButton(frame: frame, roundLeft: false, roundRight: true, isFrame: false)
        if let button = self.top04 {
            self.addSubview(button)
        }
        
        if let button = self.top00 {
            frame.origin.x = button.frame.origin.x
            frame.size.width = button.frame.size.width
        }
        
        self.top05 = LDKButton(frame: frame, roundLeft: true, roundRight: true, isFrame: false)
        if let button = self.top05 {
            self.addSubview(button)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if let button = self.outerRingSector01 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("ORS01", forState: .Normal)
        }
        
        if let button = self.outerRing05 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("OR05", forState: .Normal)
        }
        
        if let button = self.top01 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("Calibrate", forState: .Normal)
        }
        
        if let button = self.top02 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("T02", forState: .Normal)
        }
        
        if let button = self.top03 {
            button.backgroundImageColor = UIColor.marinerLCARS()
            button.setTitle("T03", forState: .Normal)
        }
        
        if let button = self.top04 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("T04", forState: .Normal)
        }
        
        if let button = self.top05 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("T05", forState: .Normal)
        }
        
    }
}
