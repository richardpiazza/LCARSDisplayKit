//===----------------------------------------------------------------------===//
//
// LDKDPadExpandedView.swift
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

open class LDKDPadExpandedView: LDKDPadView {
    // Labeled for Sector or Arc Degree
    open var innerRingSector01: LDKCrescentButton = LDKCrescentButton()
    open var innerRingSector04: LDKCrescentButton = LDKCrescentButton()
    open var innerRing05: LDKCrescentButton = LDKCrescentButton()
    open var innerRing10: LDKCrescentButton = LDKCrescentButton()
    open var innerRing11: LDKCrescentButton = LDKCrescentButton()
    open var innerRing12: LDKCrescentButton = LDKCrescentButton()
    open var innerRing13: LDKCrescentButton = LDKCrescentButton()
    open var innerRing14: LDKCrescentButton = LDKCrescentButton()
    open var innerRing15: LDKCrescentButton = LDKCrescentButton()
    open var innerRing20: LDKCrescentButton = LDKCrescentButton()
    open var outerRing10: LDKCrescentButton = LDKCrescentButton()
    open var outerRing11: LDKCrescentButton = LDKCrescentButton()
    open var outerRing12: LDKCrescentButton = LDKCrescentButton()
    open var outerRing13: LDKCrescentButton = LDKCrescentButton()
    open var outerRing14: LDKCrescentButton = LDKCrescentButton()
    open var outerRing16: LDKCrescentButton = LDKCrescentButton()
    open var outerRing17: LDKCrescentButton = LDKCrescentButton()
    open var outerRing20: LDKCrescentButton = LDKCrescentButton()
    open var outerRingExtended18: LDKCrescentButton = LDKCrescentButton()
    open var outerRingExtended19: LDKCrescentButton = LDKCrescentButton()
    
    // Labeled numerically from zero degrees
    open var edge01: LDKEdgedCrescentButton = LDKEdgedCrescentButton()
    open var edge02: LDKEdgedCrescentButton = LDKEdgedCrescentButton()
    open var edge03: LDKEdgedCrescentButton = LDKEdgedCrescentButton()
    open var edge04: LDKEdgedCrescentButton = LDKEdgedCrescentButton()
    open var edge05: LDKEdgedCrescentButton = LDKEdgedCrescentButton()
    
    // Labeled just because
    open var top00: LDKButton = LDKButton()
    
    override func defaultSize() -> CGSize {
        return CGSize(width: 794, height: 660)
    }
    
    override func graphOriginOffset() -> GraphOriginOffset {
        return GraphOriginOffset(x: 0.0, y: defaultSize().height * 0.068)
    }
    
    override func cruxInteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.14143577)
    }
    
    override func cruxExteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.4836272)
    }
    
    func firstRingInteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.50761421)
    }
    
    func firstRingExteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.7106599)
    }
    
    func secondRingInteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.73096447)
    }
    
    func secondRingExteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.85786802)
    }
    
    func secondRingExtendedExteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2))
    }
    
    func secondRingEdgeExteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.94962217)
    }
    
    func thirdRingInteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 0.87657431)
    }
    
    func thirdRingExteriorRadius(_ rect: CGRect) -> CGFloat {
        return CGFloat((rect.width / 2) * 1.07052897)
    }
    
    func edge01ExteriorRadius(_ rect: CGRect) -> CGFloat {
        return self.firstRingExteriorRadius(rect)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frir = self.firstRingInteriorRadius(rect)
        let frer = self.firstRingExteriorRadius(rect)
        let srir = self.secondRingInteriorRadius(rect)
        let srer = self.secondRingExteriorRadius(rect)
        let sreer = self.secondRingEdgeExteriorRadius(rect)
        let srerExtended = self.secondRingExtendedExteriorRadius(rect)
        let trir = self.thirdRingInteriorRadius(rect)
        let trer = self.thirdRingExteriorRadius(rect)
        
        var crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingSector01.startDegree, endDegree: LDKRingSector01.endDegree)
        innerRingSector01.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingSector04.startDegree, endDegree: LDKRingSector04.endDegree)
        innerRingSector04.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc05.startDegree, endDegree: LDKRingArc05.endDegree)
        innerRing05.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc10.startDegree, endDegree: LDKRingArc10.endDegree)
        innerRing10.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc11.startDegree, endDegree: LDKRingArc11.endDegree)
        innerRing11.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc12.startDegree, endDegree: LDKRingArc12.endDegree)
        innerRing12.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree)
        innerRing13.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc14.startDegree, endDegree: LDKRingArc14.endDegree)
        innerRing14.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree)
        innerRing15.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: LDKRingArc20.startDegree, endDegree: LDKRingArc20.endDegree)
        innerRing20.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc10.startDegree, endDegree: LDKRingArc10.endDegree)
        outerRing10.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc11.startDegree, endDegree: LDKRingArc11.endDegree)
        outerRing11.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc12.startDegree, endDegree: LDKRingArc12.endDegree)
        outerRing12.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree)
        outerRing13.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc14.startDegree, endDegree: LDKRingArc14.endDegree)
        outerRing14.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc16.startDegree, endDegree: LDKRingArc16.endDegree)
        outerRing16.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc17.startDegree, endDegree: LDKRingArc17.endDegree)
        outerRing17.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc20.startDegree, endDegree: LDKRingArc20.endDegree)
        outerRing20.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srerExtended, startDegree: LDKRingArc18.startDegree, endDegree: LDKRingArc18.endDegree)
        outerRingExtended18.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        crescent = Crescent(innerRadius: srir, outerRadius: srerExtended, startDegree: LDKRingArc19.startDegree, endDegree: LDKRingArc19.endDegree)
        outerRingExtended19.setCrescent(crescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
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
        let edge01EndExteriorLength = (edge01ExteriorArc.startPoint.y / sin(edge01EndExteriorAngle.radians)) * sin(edge01EndInteriorAngle.radians)
        
        let edge01Point01 = CGPoint(x: edge01ExteriorArc.startPoint.x, y: edge01ExteriorArc.startPoint.y)
        let edge01Point02 = CGPoint(x: edge01EndExteriorLength, y: edge01ExteriorArc.startPoint.y)
        
        let edge02StartInteriorAngle = edge02InteriorArc.startDegree - 90
        let edge02StartExteriorAngle = 180 - 90 - edge02StartInteriorAngle
        let edge02StartExteriorLength = (edge01ExteriorArc.startPoint.y / sin(edge02StartExteriorAngle.radians)) * sin(edge02StartInteriorAngle.radians)
        let edge02EndInteriorAngle = 180 - edge02InteriorArc.endDegree
        let edge02EndExteriorAngle = 180 - 90 - edge02EndInteriorAngle
        let edge02EndExteriorLength = (edge03ExteriorArc.endPoint.x / sin(edge02EndExteriorAngle.radians)) * sin(edge02EndInteriorAngle.radians)
        
        let edge02Point01 = CGPoint(x: edge02StartExteriorLength, y: edge01ExteriorArc.startPoint.y)
        let edge02Point02 = CGPoint(x: edge03ExteriorArc.endPoint.x, y: edge01ExteriorArc.startPoint.y)
        let edge02Point03 = CGPoint(x: edge03ExteriorArc.endPoint.x, y: edge02EndExteriorLength)
        
        let edge03StartInteriorAngle = 180 - edge03InteriorArc.startDegree
        let edge03StartExteriorAngle = 180 - 90 - edge03StartInteriorAngle
        let edge03StartExteriorLength = (edge03ExteriorArc.endPoint.x / sin(edge03StartExteriorAngle.radians)) * sin(edge03StartInteriorAngle.radians)
        
        let edge03Point01 = CGPoint(x: edge03ExteriorArc.endPoint.x, y: edge03StartExteriorLength)
        let edge03Point02 = CGPoint(x: edge03ExteriorArc.endPoint.x, y: edge03ExteriorArc.endPoint.y)
        
        let edge04StartInteriorAngle = 270 - edge04InteriorArc.startDegree
        let edge04StartExteriorAngle = 180 - 90 - edge04StartInteriorAngle
        let edge04StartExteriorLength = (edge04ExteriorArc.endPoint.y / sin(edge04StartExteriorAngle.radians)) * sin(edge04StartInteriorAngle.radians)
        
        let edge04Point01 = CGPoint(x: -edge04StartExteriorLength, y: edge04ExteriorArc.endPoint.y)
        let edge04Point02 = CGPoint(x: edge04ExteriorArc.endPoint.x, y: edge04ExteriorArc.endPoint.y)
        
        let edge05Point01 = edge05ExteriorArc.startPoint
        let edge05Point02 = edge05ExteriorArc.endPoint
        
        var arc = Arc(radius: frir, startDegree: LDKRingArc06.startDegree, endDegree: LDKRingArc06.endDegree)
        var edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge01Point01, edge01Point02])
        edge01.setEdgedCrescent(edgedCrescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        arc = Arc(radius: frir, startDegree: LDKRingArc07.startDegree, endDegree: LDKRingArc08.endDegree)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge02Point01, edge02Point02, edge02Point03])
        edge02.setEdgedCrescent(edgedCrescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        arc = Arc(radius: frir, startDegree: LDKRingArc09.startDegree, endDegree: LDKRingArc09.endDegree)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge03Point01, edge03Point02])
        edge03.setEdgedCrescent(edgedCrescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        arc = Arc(radius: trir, startDegree: LDKRingArc13.startDegree, endDegree: LDKRingArc13.endDegree)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge04Point01, edge04Point02])
        edge04.setEdgedCrescent(edgedCrescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        arc = Arc(radius: srir, startDegree: LDKRingArc15.startDegree, endDegree: LDKRingArc15.endDegree)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge05Point01, edge05Point02])
        edge05.setEdgedCrescent(edgedCrescent, inRect: rect, withGraphOriginOffset: graphOriginOffset())
        
        let scale = self.scaleOfDefaultSize(rect.size)
        var frame = CGRect(x: 0, y: 0, width: LDKButton.defaultSize.width * scale.width, height: LDKButton.defaultSize.height * scale.height)
        frame.origin.y = edge04.frame.origin.y
        frame.origin.x = rect.size.width - frame.size.width - edge04.frame.origin.x
        
        let roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: true, rightRounded: true, cornersOnly: false)
        
        top00.setRoundedRectangle(roundedRectangle, withFrame: frame)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        innerRingSector01.backgroundImageColor = Interface.theme.tertiaryLight
        innerRingSector01.setTitle("IRS01", for: UIControlState())
        if !self.subviews.contains(innerRingSector01) {
            self.addSubview(innerRingSector01)
        }
        self.bringSubview(toFront: innerRingSector01)
        
        innerRingSector04.backgroundImageColor = Interface.theme.tertiaryLight
        innerRingSector04.setTitle("IRS04", for: UIControlState())
        if !self.subviews.contains(innerRingSector04) {
            self.addSubview(innerRingSector04)
        }
        
        innerRing05.backgroundImageColor = Interface.theme.primaryLight
        innerRing05.setTitle("IR05", for: UIControlState())
        innerRing05.contentVerticalAlignment = .top
        if !self.subviews.contains(innerRing05) {
            self.addSubview(innerRing05)
        }
        
        innerRing10.backgroundImageColor = Interface.theme.primaryLight
        innerRing10.setTitle("IR10", for: UIControlState())
        if !self.subviews.contains(innerRing10) {
            self.addSubview(innerRing10)
        }
        
        innerRing11.backgroundImageColor = Interface.theme.tertiaryLight
        innerRing11.setTitle("IR11", for: UIControlState())
        if !self.subviews.contains(innerRing11) {
            self.addSubview(innerRing11)
        }
        
        innerRing12.backgroundImageColor = Interface.theme.primaryDark
        innerRing12.setTitle("IR12", for: UIControlState())
        if !self.subviews.contains(innerRing12) {
            self.addSubview(innerRing12)
        }
        
        innerRing13.backgroundImageColor = Interface.theme.tertiaryDark
        innerRing13.setTitle("IR13", for: UIControlState())
        if !self.subviews.contains(innerRing13) {
            self.addSubview(innerRing13)
        }
        
        innerRing14.backgroundImageColor = Interface.theme.tertiaryLight
        innerRing14.setTitle("IR14", for: UIControlState())
        if !self.subviews.contains(innerRing14) {
            self.addSubview(innerRing14)
        }
        
        innerRing15.backgroundImageColor = Interface.theme.primaryLight
        innerRing15.setTitle("IR15", for: UIControlState())
        if !self.subviews.contains(innerRing15) {
            self.addSubview(innerRing15)
        }
        
        innerRing20.backgroundImageColor = Interface.theme.primaryLight
        innerRing20.setTitle("IR20", for: UIControlState())
        if !self.subviews.contains(innerRing20) {
            self.addSubview(innerRing20)
        }
        
        outerRing10.backgroundImageColor = Interface.theme.primaryDark
        outerRing10.setTitle("OR10", for: UIControlState())
        if !self.subviews.contains(outerRing10) {
            self.addSubview(outerRing10)
        }
        
        outerRing11.backgroundImageColor = Interface.theme.tertiaryDark
        outerRing11.setTitle("OR11", for: UIControlState())
        if !self.subviews.contains(outerRing11) {
            self.addSubview(outerRing11)
        }
        
        outerRing12.backgroundImageColor = Interface.theme.tertiaryLight
        outerRing12.setTitle("OR12", for: UIControlState())
        if !self.subviews.contains(outerRing12) {
            self.addSubview(outerRing12)
        }
        
        outerRing13.backgroundImageColor = Interface.theme.primaryLight
        outerRing13.setTitle("OR13", for: UIControlState())
        if !self.subviews.contains(outerRing13) {
            self.addSubview(outerRing13)
        }
        
        outerRing14.backgroundImageColor = Interface.theme.primaryDark
        outerRing14.setTitle("OR14", for: UIControlState())
        if !self.subviews.contains(outerRing14) {
            self.addSubview(outerRing14)
        }
        
        outerRing16.backgroundImageColor = Interface.theme.tertiaryDark
        outerRing16.setTitle("OR16", for: UIControlState())
        if !self.subviews.contains(outerRing16) {
            self.addSubview(outerRing16)
        }
        
        outerRing17.backgroundImageColor = Interface.theme.primaryLight
        outerRing17.setTitle("OR17", for: UIControlState())
        if !self.subviews.contains(outerRing17) {
            self.addSubview(outerRing17)
        }
        
        outerRingExtended18.backgroundImageColor = Interface.theme.primaryDark
        outerRingExtended18.setTitle("ORE18", for: UIControlState())
        if !self.subviews.contains(outerRingExtended18) {
            self.addSubview(outerRingExtended18)
        }
        
        outerRingExtended19.backgroundImageColor = Interface.theme.tertiaryDark
        outerRingExtended19.setTitle("ORE19", for: UIControlState())
        if !self.subviews.contains(outerRingExtended19) {
            self.addSubview(outerRingExtended19)
        }
        
        outerRing20.backgroundImageColor = Interface.theme.tertiaryLight
        outerRing20.setTitle("OR20", for: UIControlState())
        if !self.subviews.contains(outerRing20) {
            self.addSubview(outerRing20)
        }
        
        edge01.backgroundImageColor = Interface.theme.tertiaryLight
        edge01.setTitle("E01", for: UIControlState())
        if !self.subviews.contains(edge01) {
            self.addSubview(edge01)
        }
        
        edge02.backgroundImageColor = Interface.theme.primaryLight
        edge02.setTitle("Mode Select", for: UIControlState())
        if !self.subviews.contains(edge02) {
            self.addSubview(edge02)
        }
        
        edge03.backgroundImageColor = Interface.theme.tertiaryDark
        edge03.setTitle("E03", for: UIControlState())
        if !self.subviews.contains(edge03) {
            self.addSubview(edge03)
        }
        
        edge04.backgroundImageColor = Interface.theme.primaryDark
        edge04.setTitle("E04", for: UIControlState())
        if !self.subviews.contains(edge04) {
            self.addSubview(edge04)
        }
        
        edge05.backgroundImageColor = Interface.theme.tertiaryLight
        edge05.setTitle("E05", for: UIControlState())
        if !self.subviews.contains(edge05) {
            self.addSubview(edge05)
        }
        
        top00.backgroundImageColor = Interface.theme.tertiaryLight
        top00.setTitle("T00", for: UIControlState())
        if !self.subviews.contains(top00) {
            self.addSubview(top00)
        }
        
        self.bringSubview(toFront: self.sector01)
        self.bringSubview(toFront: self.sector04)
    }
}
