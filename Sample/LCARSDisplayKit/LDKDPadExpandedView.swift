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
    public var innerRingSector01: LDKCrescentButton?
    public var innerRingSector04: LDKCrescentButton?
    public var innerRing05: LDKCrescentButton?
    public var innerRing10: LDKCrescentButton?
    public var innerRing11: LDKCrescentButton?
    public var innerRing12: LDKCrescentButton?
    public var innerRing13: LDKCrescentButton?
    public var innerRing14: LDKCrescentButton?
    public var innerRing15: LDKCrescentButton?
    public var innerRing20: LDKCrescentButton?
    public var outerRing10: LDKCrescentButton?
    public var outerRing11: LDKCrescentButton?
    public var outerRing12: LDKCrescentButton?
    public var outerRing13: LDKCrescentButton?
    public var outerRing14: LDKCrescentButton?
    public var outerRing16: LDKCrescentButton?
    public var outerRing17: LDKCrescentButton?
    public var outerRing20: LDKCrescentButton?
    public var outerRingExtended18: LDKCrescentButton?
    public var outerRingExtended19: LDKCrescentButton?
    
    // Labeled numerically from zero degrees
    public var edge01: LDKEdgedCrescentButton?
    public var edge02: LDKEdgedCrescentButton?
    public var edge03: LDKEdgedCrescentButton?
    public var edge04: LDKEdgedCrescentButton?
    public var edge05: LDKEdgedCrescentButton?
    
    // Labeled just because
    public var top00: LDKButton?
    
    override public class func defaultSize() -> CGSize {
        return CGSizeMake(794, 660)
    }
    
    override func axisOffset() -> CGPoint {
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
        
        let axisOrigin = self.axisOrigin(rect)
        let frir = self.firstRingInteriorRadius(rect)
        let frer = self.firstRingExteriorRadius(rect)
        let srir = self.secondRingInteriorRadius(rect)
        let srer = self.secondRingExteriorRadius(rect)
        let srerExtended = self.secondRingExtendedExteriorRadius(rect)
        let trir = self.thirdRingInteriorRadius(rect)
        let trer = self.thirdRingExteriorRadius(rect)
        
        self.innerRingSector01 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingSector01.startDegree, endDegree: LDKRingSector01.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRingSector01 {
            self.addSubview(button)
        }
        
        self.innerRingSector04 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingSector04.startDegree, endDegree: LDKRingSector04.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRingSector04 {
            self.addSubview(button)
        }
        
        self.innerRing05 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc05.startDegree, endDegree: LDKRingArc05.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing05 {
            self.addSubview(button)
        }
        
        self.innerRing10 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc10.startDegree, endDegree: LDKRingArc10.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing10 {
            self.addSubview(button)
        }
        
        self.innerRing11 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc11.startDegree, endDegree: LDKRingArc11.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing11 {
            self.addSubview(button)
        }
        
        self.innerRing12 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc12.startDegree, endDegree: LDKRingArc12.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing12 {
            self.addSubview(button)
        }
        
        self.innerRing13 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing13 {
            self.addSubview(button)
        }
        
        self.innerRing14 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc14.startDegree, endDegree: LDKRingArc14.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing14 {
            self.addSubview(button)
        }
        
        self.innerRing15 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing15 {
            self.addSubview(button)
        }
        
        self.innerRing20 = LDKCrescentButton(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc20.startDegree, endDegree: LDKRingArc20.endDegree, axisOrigin: axisOrigin)
        if let button = self.innerRing20 {
            self.addSubview(button)
        }
        
        self.outerRing10 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc10.startDegree, endDegree: LDKRingArc10.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing10 {
            self.addSubview(button)
        }
        
        self.outerRing11 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc11.startDegree, endDegree: LDKRingArc11.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing11 {
            self.addSubview(button)
        }
        
        self.outerRing12 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc12.startDegree, endDegree: LDKRingArc12.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing12 {
            self.addSubview(button)
        }
        
        self.outerRing13 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing13 {
            self.addSubview(button)
        }
        
        self.outerRing14 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc14.startDegree, endDegree: LDKRingArc14.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing14 {
            self.addSubview(button)
        }
        
        self.outerRing16 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc16.startDegree, endDegree: LDKRingArc16.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing16 {
            self.addSubview(button)
        }
        
        self.outerRing17 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc17.startDegree, endDegree: LDKRingArc17.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing17 {
            self.addSubview(button)
        }
        
        self.outerRing20 = LDKCrescentButton(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc20.startDegree, endDegree: LDKRingArc20.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRing20 {
            self.addSubview(button)
        }
        
        self.outerRingExtended18 = LDKCrescentButton(innerRadius: srir, outerRadius: srerExtended, startDegree: LDKRingArc18.startDegree, endDegree: LDKRingArc18.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRingExtended18 {
            self.addSubview(button)
        }
        
        self.outerRingExtended19 = LDKCrescentButton(innerRadius: srir, outerRadius: srerExtended, startDegree: LDKRingArc19.startDegree, endDegree: LDKRingArc19.endDegree, axisOrigin: axisOrigin)
        if let button = self.outerRingExtended19 {
            self.addSubview(button)
        }
        
        let edge01InteriorArc = LDKArc(radius: frir, startDegree: LDKRingArc06.startDegree, endDegree: LDKRingArc06.endDegree)
        let edge01ExteriorArc = LDKArc(radius: self.edge01ExteriorRadius(rect), startDegree: LDKRingArc06.startDegree, endDegree: LDKRingArc06.endDegree)
        let edge02InteriorArc = LDKArc(radius: self.firstRingInteriorRadius(rect), startDegree: LDKRingArc07.startDegree, endDegree: LDKRingArc08.endDegree)
        let edge03InteriorArc = LDKArc(radius: frir, startDegree: LDKRingArc09.startDegree, endDegree: LDKRingArc09.endDegree)
        let edge03ExteriorArc = LDKArc(radius: srerExtended, startDegree: LDKRingArc09.startDegree, endDegree: LDKRingArc09.endDegree)
        let edge04InteriorArc = LDKArc(radius: trir, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree)
        let edge04ExteriorArc = LDKArc(radius: trer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree)
//        let edge05InteriorArc = LDKArc(radius: srir, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree)
        let edge05ExteriorArc = LDKArc(radius: srerExtended, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree)
        
        let edge01EndInteriorAngle = edge01InteriorArc.endDegree - 90
        let edge01EndExteriorAngle = 180 - 90 - edge01EndInteriorAngle
        let edge01EndExteriorLength = (edge01ExteriorArc.startPoint().y / sin(edge01EndExteriorAngle.toRadians())) * sin(edge01EndInteriorAngle.toRadians())
        
        let edge01Point01 = CGPointMake(edge01ExteriorArc.startPoint().x, edge01ExteriorArc.startPoint().y)
        let edge01Point02 = CGPointMake(edge01EndExteriorLength, edge01ExteriorArc.startPoint().y)
        
        let edge02StartInteriorAngle = edge02InteriorArc.startDegree - 90
        let edge02StartExteriorAngle = 180 - 90 - edge02StartInteriorAngle
        let edge02StartExteriorLength = (edge01ExteriorArc.startPoint().y / sin(edge02StartExteriorAngle.toRadians())) * sin(edge02StartInteriorAngle.toRadians())
        let edge02EndInteriorAngle = 180 - edge02InteriorArc.endDegree
        let edge02EndExteriorAngle = 180 - 90 - edge02EndInteriorAngle
        let edge02EndExteriorLength = (edge03ExteriorArc.endPoint().x / sin(edge02EndExteriorAngle.toRadians())) * sin(edge02EndInteriorAngle.toRadians())
        
        let edge02Point01 = CGPointMake(edge02StartExteriorLength, edge01ExteriorArc.startPoint().y)
        let edge02Point02 = CGPointMake(edge03ExteriorArc.endPoint().x, edge01ExteriorArc.startPoint().y)
        let edge02Point03 = CGPointMake(edge03ExteriorArc.endPoint().x, edge02EndExteriorLength)
        
        let edge03StartInteriorAngle = 180 - edge03InteriorArc.startDegree
        let edge03StartExteriorAngle = 180 - 90 - edge03StartInteriorAngle
        let edge03StartExteriorLength = (edge03ExteriorArc.endPoint().x / sin(edge03StartExteriorAngle.toRadians())) * sin(edge03StartInteriorAngle.toRadians())
        
        let edge03Point01 = CGPointMake(edge03ExteriorArc.endPoint().x, edge03StartExteriorLength)
        let edge03Point02 = CGPointMake(edge03ExteriorArc.endPoint().x, edge03ExteriorArc.endPoint().y)
        
        let edge04StartInteriorAngle = 270 - edge04InteriorArc.startDegree
        let edge04StartExteriorAngle = 180 - 90 - edge04StartInteriorAngle
        let edge04StartExteriorLength = (edge04ExteriorArc.endPoint().y / sin(edge04StartExteriorAngle.toRadians())) * sin(edge04StartInteriorAngle.toRadians())
        
        let edge04Point01 = CGPointMake(-edge04StartExteriorLength, edge04ExteriorArc.endPoint().y)
        let edge04Point02 = CGPointMake(edge04ExteriorArc.endPoint().x, edge04ExteriorArc.endPoint().y)
        
        let edge05Point01 = edge05ExteriorArc.startPoint()
        let edge05Point02 = edge05ExteriorArc.endPoint()
        
        self.edge01 = LDKEdgedCrescentButton(radius: frir, startDegree: LDKRingArc06.startDegree, endDegree: LDKRingArc06.endDegree, edgePoint1: edge01Point01, edgePoint2: edge01Point02, edgePoint3: nil, axisOrigin: axisOrigin)
        if let button = self.edge01 {
            self.addSubview(button)
        }
        
        self.edge02 = LDKEdgedCrescentButton(radius: frir, startDegree: LDKRingArc07.startDegree, endDegree: LDKRingArc08.endDegree, edgePoint1: edge02Point01, edgePoint2: edge02Point02, edgePoint3: edge02Point03, axisOrigin: axisOrigin)
        if let button = self.edge02 {
            self.addSubview(button)
        }
        
        self.edge03 = LDKEdgedCrescentButton(radius: frir, startDegree: LDKRingArc09.startDegree, endDegree: LDKRingArc09.endDegree, edgePoint1: edge03Point01, edgePoint2: edge03Point02, edgePoint3: nil, axisOrigin: axisOrigin)
        if let button = self.edge03 {
            self.addSubview(button)
        }
        
        self.edge04 = LDKEdgedCrescentButton(radius: trir, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree, edgePoint1: edge04Point01, edgePoint2: edge04Point02, edgePoint3: nil, axisOrigin: axisOrigin)
        if let button = self.edge04 {
            self.addSubview(button)
        }
        
        self.edge05 = LDKEdgedCrescentButton(radius: srir, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree, edgePoint1: edge05Point01, edgePoint2: edge05Point02, edgePoint3: nil, axisOrigin: axisOrigin)
        if let button = self.edge05 {
            self.addSubview(button)
        }
        
        let scale = self.dynamicType.scaleOfDefaultSize(rect.size)
        var frame = CGRectMake(0, 0, LDKButton.defaultSize().width * scale.width, LDKButton.defaultSize().height * scale.height)
        if let edge = self.edge04 {
            frame.origin.y = edge.frame.origin.y
            frame.origin.x = rect.size.width - frame.size.width - edge.frame.origin.x
        }
        
        self.top00 = LDKButton(frame: frame)
        if let button = self.top00 {
            self.addSubview(button)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if let button = self.innerRingSector01 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("IRS01", forState: .Normal)
            self.bringSubviewToFront(button)
        }
        
        if let button = self.innerRingSector04 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("IRS04", forState: .Normal)
        }
        
        if let button = self.innerRing05 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("IR05", forState: .Normal)
            button.contentVerticalAlignment = .Top
        }
        
        if let button = self.innerRing10 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("IR10", forState: .Normal)
        }
        
        if let button = self.innerRing11 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("IR11", forState: .Normal)
        }
        
        if let button = self.innerRing12 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("IR12", forState: .Normal)
        }
        
        if let button = self.innerRing13 {
            button.backgroundImageColor = UIColor.marinerLCARS()
            button.setTitle("IR13", forState: .Normal)
        }
        
        if let button = self.innerRing14 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("IR14", forState: .Normal)
        }
        
        if let button = self.innerRing15 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("IR15", forState: .Normal)
        }
        
        if let button = self.innerRing20 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("IR20", forState: .Normal)
        }
        
        if let button = self.outerRing10 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("OR10", forState: .Normal)
        }
        
        if let button = self.outerRing10 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("OR10", forState: .Normal)
        }
        
        if let button = self.outerRing11 {
            button.backgroundImageColor = UIColor.marinerLCARS()
            button.setTitle("OR11", forState: .Normal)
        }
        
        if let button = self.outerRing12 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("OR12", forState: .Normal)
        }
        
        if let button = self.outerRing13 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("OR13", forState: .Normal)
        }
        
        if let button = self.outerRing14 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("OR14", forState: .Normal)
        }
        
        if let button = self.outerRing16 {
            button.backgroundImageColor = UIColor.marinerLCARS()
            button.setTitle("OR16", forState: .Normal)
        }
        
        if let button = self.outerRing17 {
            button.backgroundImageColor = UIColor.paleCanary()
            button.setTitle("OR17", forState: .Normal)
        }
        
        if let button = self.outerRingExtended18 {
            button.backgroundImageColor = UIColor.neonCarrot()
            button.setTitle("ORE18", forState: .Normal)
        }
        
        if let button = self.outerRingExtended19 {
            button.backgroundImageColor = UIColor.marinerLCARS()
            button.setTitle("ORE19", forState: .Normal)
        }
        
        if let button = self.outerRing20 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("OR20", forState: .Normal)
        }
        
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
        
        if let button = self.top00 {
            button.backgroundImageColor = UIColor.babyBlueEyesLCARS()
            button.setTitle("T00", forState: .Normal)
            button.roundLeft = true
            button.roundRight = true
        }
        
        self.bringSubviewToFront(self.sector01)
        self.bringSubviewToFront(self.sector04)
    }
}
