//
//  LDKDPadExpandedView.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

import UIKit

public class LDKDPadExpandedView: LDKDPadView {
    // Labeled for Sector or Arc Degree
    public var innerRingSector01: LDKCrescentButton = LDKCrescentButton()
    public var innerRingSector04: LDKCrescentButton = LDKCrescentButton()
    public var innerRing05: LDKCrescentButton = LDKCrescentButton()
    public var innerRing10: LDKCrescentButton = LDKCrescentButton()
    public var innerRing11: LDKCrescentButton = LDKCrescentButton()
    public var innerRing12: LDKCrescentButton = LDKCrescentButton()
    public var innerRing13: LDKCrescentButton = LDKCrescentButton()
    public var innerRing14: LDKCrescentButton = LDKCrescentButton()
    public var innerRing15: LDKCrescentButton = LDKCrescentButton()
    public var innerRing20: LDKCrescentButton = LDKCrescentButton()
    public var outerRing10: LDKCrescentButton = LDKCrescentButton()
    public var outerRing11: LDKCrescentButton = LDKCrescentButton()
    public var outerRing12: LDKCrescentButton = LDKCrescentButton()
    public var outerRing13: LDKCrescentButton = LDKCrescentButton()
    public var outerRing14: LDKCrescentButton = LDKCrescentButton()
    public var outerRing16: LDKCrescentButton = LDKCrescentButton()
    public var outerRing17: LDKCrescentButton = LDKCrescentButton()
    public var outerRing20: LDKCrescentButton = LDKCrescentButton()
    public var outerRingExtended18: LDKCrescentButton = LDKCrescentButton()
    public var outerRingExtended19: LDKCrescentButton = LDKCrescentButton()
    
    // Labeled numerically from zero degrees
    public var edge01: LDKEdgedCrescentButton?
    public var edge02: LDKEdgedCrescentButton?
    public var edge03: LDKEdgedCrescentButton?
    public var edge04: LDKEdgedCrescentButton?
    public var edge05: LDKEdgedCrescentButton?
    
    // Labeled just because
    public var top00: LDKButton = LDKButton()
    
    override public class func defaultSize() -> CGSize {
        return CGSizeMake(794, 660)
    }
    
    override func originOffset() -> CGPoint {
        return CGPointMake(0, self.dynamicType.defaultSize().height * 0.068)
    }
    
    override func cruxInteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.14143577)
    }
    
    override func cruxExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.4836272)
    }
    
    func firstRingInteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.50761421)
    }
    
    func firstRingExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.7106599)
    }
    
    func secondRingInteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.73096447)
    }
    
    func secondRingExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.85786802)
    }
    
    func secondRingExtendedExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2))
    }
    
    func secondRingEdgeExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.94962217)
    }
    
    func thirdRingInteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.87657431)
    }
    
    func thirdRingExteriorRadius(rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 1.07052897)
    }
    
    func edge01ExteriorRadius(rect: CGRect) -> CGFloat {
        return self.firstRingExteriorRadius(rect)
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let graphOrigin = self.graphOrigin(rect)
        let frir = self.firstRingInteriorRadius(rect)
        let frer = self.firstRingExteriorRadius(rect)
        let srir = self.secondRingInteriorRadius(rect)
        let srer = self.secondRingExteriorRadius(rect)
        let sreer = self.secondRingEdgeExteriorRadius(rect)
        let srerExtended = self.secondRingExtendedExteriorRadius(rect)
        let trir = self.thirdRingInteriorRadius(rect)
        let trer = self.thirdRingExteriorRadius(rect)
        
        self.innerRingSector01.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingSector01.startDegree, endDegree: LDKRingSector01.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRingSector01) {
            self.addSubview(innerRingSector01)
        }
        
        self.innerRingSector04.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingSector04.startDegree, endDegree: LDKRingSector04.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRingSector04) {
            self.addSubview(innerRingSector04)
        }
        
        self.innerRing05.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc05.startDegree, endDegree: LDKRingArc05.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing05) {
            self.addSubview(innerRing05)
        }
        
        self.innerRing10.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc10.startDegree, endDegree: LDKRingArc10.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing10) {
            self.addSubview(innerRing10)
        }
        
        self.innerRing11.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc11.startDegree, endDegree: LDKRingArc11.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing11) {
            self.addSubview(innerRing11)
        }
        
        self.innerRing12.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc12.startDegree, endDegree: LDKRingArc12.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing12) {
            self.addSubview(innerRing12)
        }
        
        self.innerRing13.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing13) {
            self.addSubview(innerRing13)
        }
        
        self.innerRing14.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc14.startDegree, endDegree: LDKRingArc14.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing14) {
            self.addSubview(innerRing14)
        }
        
        self.innerRing15.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing15) {
            self.addSubview(innerRing15)
        }
        
        self.innerRing20.setAttributes(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc20.startDegree, endDegree: LDKRingArc20.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(innerRing20) {
            self.addSubview(innerRing20)
        }
        
        self.outerRing10.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc10.startDegree, endDegree: LDKRingArc10.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing10) {
            self.addSubview(outerRing10)
        }
        
        self.outerRing11.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc11.startDegree, endDegree: LDKRingArc11.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing11) {
            self.addSubview(outerRing11)
        }
        
        self.outerRing12.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc12.startDegree, endDegree: LDKRingArc12.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing12) {
            self.addSubview(outerRing12)
        }
        
        self.outerRing13.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing13) {
            self.addSubview(outerRing13)
        }
        
        self.outerRing14.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc14.startDegree, endDegree: LDKRingArc14.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing14) {
            self.addSubview(outerRing14)
        }
        
        self.outerRing16.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc16.startDegree, endDegree: LDKRingArc16.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing16) {
            self.addSubview(outerRing16)
        }
        
        self.outerRing17.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc17.startDegree, endDegree: LDKRingArc17.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing17) {
            self.addSubview(outerRing17)
        }
        
        self.outerRing20.setAttributes(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc20.startDegree, endDegree: LDKRingArc20.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRing20) {
            self.addSubview(outerRing20)
        }
        
        self.outerRingExtended18.setAttributes(innerRadius: srir, outerRadius: srerExtended, startDegree: LDKRingArc18.startDegree, endDegree: LDKRingArc18.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRingExtended18) {
            self.addSubview(outerRingExtended18)
        }
        
        self.outerRingExtended19.setAttributes(innerRadius: srir, outerRadius: srerExtended, startDegree: LDKRingArc19.startDegree, endDegree: LDKRingArc19.endDegree, graphOrigin: graphOrigin)
        if !self.subviews.contains(outerRingExtended19) {
            self.addSubview(outerRingExtended19)
        }
        
        let edge01InteriorArc = Arc(radius: frir, startDegree: LDKRingArc06.startDegree, endDegree: LDKRingArc06.endDegree)
        let edge01ExteriorArc = Arc(radius: self.edge01ExteriorRadius(rect), startDegree: LDKRingArc06.startDegree, endDegree: LDKRingArc06.endDegree)
        let edge02InteriorArc = Arc(radius: self.firstRingInteriorRadius(rect), startDegree: LDKRingArc07.startDegree, endDegree: LDKRingArc08.endDegree)
        let edge03InteriorArc = Arc(radius: frir, startDegree: LDKRingArc09.startDegree, endDegree: LDKRingArc09.endDegree)
        let edge03ExteriorArc = Arc(radius: srerExtended, startDegree: LDKRingArc09.startDegree, endDegree: LDKRingArc09.endDegree)
        let edge04InteriorArc = Arc(radius: trir, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree)
        let edge04ExteriorArc = Arc(radius: trer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree)
        let edge05ExteriorArc = Arc(radius: sreer, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree)
        
        let edge01EndInteriorAngle = edge01InteriorArc.endDegree - 90
        let edge01EndExteriorAngle = 180 - 90 - edge01EndInteriorAngle
        let edge01EndExteriorLength = (edge01ExteriorArc.startPoint.y / sin(edge01EndExteriorAngle.toRadians())) * sin(edge01EndInteriorAngle.toRadians())
        
        let edge01Point01 = CGPointMake(edge01ExteriorArc.startPoint.x, edge01ExteriorArc.startPoint.y)
        let edge01Point02 = CGPointMake(edge01EndExteriorLength, edge01ExteriorArc.startPoint.y)
        
        let edge02StartInteriorAngle = edge02InteriorArc.startDegree - 90
        let edge02StartExteriorAngle = 180 - 90 - edge02StartInteriorAngle
        let edge02StartExteriorLength = (edge01ExteriorArc.startPoint.y / sin(edge02StartExteriorAngle.toRadians())) * sin(edge02StartInteriorAngle.toRadians())
        let edge02EndInteriorAngle = 180 - edge02InteriorArc.endDegree
        let edge02EndExteriorAngle = 180 - 90 - edge02EndInteriorAngle
        let edge02EndExteriorLength = (edge03ExteriorArc.endPoint.x / sin(edge02EndExteriorAngle.toRadians())) * sin(edge02EndInteriorAngle.toRadians())
        
        let edge02Point01 = CGPointMake(edge02StartExteriorLength, edge01ExteriorArc.startPoint.y)
        let edge02Point02 = CGPointMake(edge03ExteriorArc.endPoint.x, edge01ExteriorArc.startPoint.y)
        let edge02Point03 = CGPointMake(edge03ExteriorArc.endPoint.x, edge02EndExteriorLength)
        
        let edge03StartInteriorAngle = 180 - edge03InteriorArc.startDegree
        let edge03StartExteriorAngle = 180 - 90 - edge03StartInteriorAngle
        let edge03StartExteriorLength = (edge03ExteriorArc.endPoint.x / sin(edge03StartExteriorAngle.toRadians())) * sin(edge03StartInteriorAngle.toRadians())
        
        let edge03Point01 = CGPointMake(edge03ExteriorArc.endPoint.x, edge03StartExteriorLength)
        let edge03Point02 = CGPointMake(edge03ExteriorArc.endPoint.x, edge03ExteriorArc.endPoint.y)
        
        let edge04StartInteriorAngle = 270 - edge04InteriorArc.startDegree
        let edge04StartExteriorAngle = 180 - 90 - edge04StartInteriorAngle
        let edge04StartExteriorLength = (edge04ExteriorArc.endPoint.y / sin(edge04StartExteriorAngle.toRadians())) * sin(edge04StartInteriorAngle.toRadians())
        
        let edge04Point01 = CGPointMake(-edge04StartExteriorLength, edge04ExteriorArc.endPoint.y)
        let edge04Point02 = CGPointMake(edge04ExteriorArc.endPoint.x, edge04ExteriorArc.endPoint.y)
        
        let edge05Point01 = edge05ExteriorArc.startPoint
        let edge05Point02 = edge05ExteriorArc.endPoint
        
        self.edge01 = LDKEdgedCrescentButton(radius: frir, startDegree: LDKRingArc06.startDegree, endDegree: LDKRingArc06.endDegree, edgePoint1: edge01Point01, edgePoint2: edge01Point02, edgePoint3: nil, graphOrigin: graphOrigin)
        if let button = self.edge01 {
            self.addSubview(button)
        }
        
        self.edge02 = LDKEdgedCrescentButton(radius: frir, startDegree: LDKRingArc07.startDegree, endDegree: LDKRingArc08.endDegree, edgePoint1: edge02Point01, edgePoint2: edge02Point02, edgePoint3: edge02Point03, graphOrigin: graphOrigin)
        if let button = self.edge02 {
            self.addSubview(button)
        }
        
        self.edge03 = LDKEdgedCrescentButton(radius: frir, startDegree: LDKRingArc09.startDegree, endDegree: LDKRingArc09.endDegree, edgePoint1: edge03Point01, edgePoint2: edge03Point02, edgePoint3: nil, graphOrigin: graphOrigin)
        if let button = self.edge03 {
            self.addSubview(button)
        }
        
        self.edge04 = LDKEdgedCrescentButton(radius: trir, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree, edgePoint1: edge04Point01, edgePoint2: edge04Point02, edgePoint3: nil, graphOrigin: graphOrigin)
        if let button = self.edge04 {
            self.addSubview(button)
        }
        
        self.edge05 = LDKEdgedCrescentButton(radius: srir, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree, edgePoint1: edge05Point01, edgePoint2: edge05Point02, edgePoint3: nil, graphOrigin: graphOrigin)
        if let button = self.edge05 {
            self.addSubview(button)
        }
        
        let scale = self.dynamicType.scaleOfDefaultSize(rect.size)
        var frame = CGRectMake(0, 0, LDKButton.defaultSize().width * scale.width, LDKButton.defaultSize().height * scale.height)
        if let edge = self.edge04 {
            frame.origin.y = edge.frame.origin.y
            frame.origin.x = rect.size.width - frame.size.width - edge.frame.origin.x
        }
        
        top00.setAttributes(frame: frame, roundLeft: true, roundRight: true, isFrame: false)
        if !self.subviews.contains(top00) {
            self.addSubview(top00)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        innerRingSector01.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        innerRingSector01.setTitle("IRS01", forState: .Normal)
        self.bringSubviewToFront(innerRingSector01)
        
        innerRingSector04.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        innerRingSector04.setTitle("IRS04", forState: .Normal)
        
        innerRing05.backgroundImageColor = UIColor.paleCanary()
        innerRing05.setTitle("IR05", forState: .Normal)
        innerRing05.contentVerticalAlignment = .Top
        
        innerRing10.backgroundImageColor = UIColor.paleCanary()
        innerRing10.setTitle("IR10", forState: .Normal)
        
        innerRing11.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        innerRing11.setTitle("IR11", forState: .Normal)
        
        innerRing12.backgroundImageColor = UIColor.neonCarrot()
        innerRing12.setTitle("IR12", forState: .Normal)
        
        innerRing13.backgroundImageColor = UIColor.marinerLCARS()
        innerRing13.setTitle("IR13", forState: .Normal)
        
        innerRing14.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        innerRing14.setTitle("IR14", forState: .Normal)
        
        innerRing15.backgroundImageColor = UIColor.paleCanary()
        innerRing15.setTitle("IR15", forState: .Normal)
        
        innerRing20.backgroundImageColor = UIColor.paleCanary()
        innerRing20.setTitle("IR20", forState: .Normal)
        
        outerRing10.backgroundImageColor = UIColor.neonCarrot()
        outerRing10.setTitle("OR10", forState: .Normal)
        
        outerRing10.backgroundImageColor = UIColor.neonCarrot()
        outerRing10.setTitle("OR10", forState: .Normal)
        
        outerRing11.backgroundImageColor = UIColor.marinerLCARS()
        outerRing11.setTitle("OR11", forState: .Normal)
        
        outerRing12.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        outerRing12.setTitle("OR12", forState: .Normal)
        
        outerRing13.backgroundImageColor = UIColor.paleCanary()
        outerRing13.setTitle("OR13", forState: .Normal)
        
        outerRing14.backgroundImageColor = UIColor.neonCarrot()
        outerRing14.setTitle("OR14", forState: .Normal)
        
        outerRing16.backgroundImageColor = UIColor.marinerLCARS()
        outerRing16.setTitle("OR16", forState: .Normal)
        
        outerRing17.backgroundImageColor = UIColor.paleCanary()
        outerRing17.setTitle("OR17", forState: .Normal)
        
        outerRingExtended18.backgroundImageColor = UIColor.neonCarrot()
        outerRingExtended18.setTitle("ORE18", forState: .Normal)
        
        outerRingExtended19.backgroundImageColor = UIColor.marinerLCARS()
        outerRingExtended19.setTitle("ORE19", forState: .Normal)
        
        outerRing20.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        outerRing20.setTitle("OR20", forState: .Normal)
        
        if let button = self.edge01 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("E01", forState: .Normal)
        }
        
        if let button = self.edge02 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("Mode Select", forState: .Normal)
        }
        
        if let button = self.edge03 {
            button.backgroundImageColor = UIColor.marinerLCARS()
            button.setTitle("E03", forState: .Normal)
        }
        
        if let button = self.edge04 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("E04", forState: .Normal)
        }
        
        if let button = self.edge05 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("E05", forState: .Normal)
        }
        
        top00.backgroundImageColor = UIColor.babyBlueEyesLCARS()
        top00.setTitle("T00", forState: .Normal)
        
        self.bringSubviewToFront(self.sector01)
        self.bringSubviewToFront(self.sector04)
    }
}
