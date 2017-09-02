//===----------------------------------------------------------------------===//
//
// DPadViewVariation1.swift
//
// Copyright (c) 2015 Richard Piazza
// https://github.com/richardpiazza/LCARSDisplayKit
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

/// An expansion of the `DPadView` with surrounding buttons.
open class DPadViewVariation1: DPadView {
    // Labeled for Sector or Arc Degree
    open var innerRingSector01: CrescentButton = CrescentButton()
    open var innerRingSector04: CrescentButton = CrescentButton()
    open var innerRing05: CrescentButton = CrescentButton()
    open var innerRing10: CrescentButton = CrescentButton()
    open var innerRing11: CrescentButton = CrescentButton()
    open var innerRing12: CrescentButton = CrescentButton()
    open var innerRing13: CrescentButton = CrescentButton()
    open var innerRing14: CrescentButton = CrescentButton()
    open var innerRing15: CrescentButton = CrescentButton()
    open var innerRing20: CrescentButton = CrescentButton()
    open var outerRing10: CrescentButton = CrescentButton()
    open var outerRing11: CrescentButton = CrescentButton()
    open var outerRing12: CrescentButton = CrescentButton()
    open var outerRing13: CrescentButton = CrescentButton()
    open var outerRing14: CrescentButton = CrescentButton()
    open var outerRing16: CrescentButton = CrescentButton()
    open var outerRing17: CrescentButton = CrescentButton()
    open var outerRing20: CrescentButton = CrescentButton()
    open var outerRingExtended18: CrescentButton = CrescentButton()
    open var outerRingExtended19: CrescentButton = CrescentButton()
    
    // Labeled numerically from zero degrees
    open var edge01: EdgedCrescentButton = EdgedCrescentButton()
    open var edge02: EdgedCrescentButton = EdgedCrescentButton()
    open var edge03: EdgedCrescentButton = EdgedCrescentButton()
    open var edge04: EdgedCrescentButton = EdgedCrescentButton()
    open var edge05: EdgedCrescentButton = EdgedCrescentButton()
    
    // Labeled just because
    open var top00: RoundedRectangleButton = RoundedRectangleButton()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 794, height: 660)
    }
    
    open override var offset: GraphOriginOffset {
        return GraphOriginOffset(x: 0.0, y: intrinsicContentSize.height * 0.068)
    }
    
    override open var cruxInteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.14143577)
    }
    
    open override var cruxExteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.4836272)
    }
    
    open var firstRingInteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.50761421)
    }
    
    open var firstRingExteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.7106599)
    }
    
    open var secondRingInteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.73096447)
    }
    
    open var secondRingExteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.85786802)
    }
    
    open var secondRingExtendedExteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2))
    }
    
    open var secondRingEdgeExteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.94962217)
    }
    
    open var thirdRingInteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.87657431)
    }
    
    open var thirdRingExteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 1.07052897)
    }
    
    open var edge01ExteriorRadius: CGFloat {
        return self.firstRingExteriorRadius
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let frir = self.firstRingInteriorRadius
        let frer = self.firstRingExteriorRadius
        let srir = self.secondRingInteriorRadius
        let srer = self.secondRingExteriorRadius
        let sreer = self.secondRingEdgeExteriorRadius
        let srerExtended = self.secondRingExtendedExteriorRadius
        let trir = self.thirdRingInteriorRadius
        let trer = self.thirdRingExteriorRadius
        
        var crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.sector01.start, endDegree: DPad.Ring.sector01.end)
        innerRingSector01.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.sector04.start, endDegree: DPad.Ring.sector04.end)
        innerRingSector04.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc05.start, endDegree: DPad.Ring.arc05.end)
        innerRing05.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc10.start, endDegree: DPad.Ring.arc10.end)
        innerRing10.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc11.start, endDegree: DPad.Ring.arc11.end)
        innerRing11.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc12.start, endDegree: DPad.Ring.arc12.end)
        innerRing12.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        innerRing13.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc14.start, endDegree: DPad.Ring.arc14.end)
        innerRing14.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc15.start, endDegree: DPad.Ring.arc15.end)
        innerRing15.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: frir, outerRadius: frer, startDegree: DPad.Ring.arc20.start, endDegree: DPad.Ring.arc20.end)
        innerRing20.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc10.start, endDegree: DPad.Ring.arc10.end)
        outerRing10.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc11.start, endDegree: DPad.Ring.arc11.end)
        outerRing11.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc12.start, endDegree: DPad.Ring.arc12.end)
        outerRing12.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        outerRing13.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc14.start, endDegree: DPad.Ring.arc14.end)
        outerRing14.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc16.start, endDegree: DPad.Ring.arc16.end)
        outerRing16.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc17.start, endDegree: DPad.Ring.arc17.end)
        outerRing17.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: DPad.Ring.arc20.start, endDegree: DPad.Ring.arc20.end)
        outerRing20.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srerExtended, startDegree: DPad.Ring.arc18.start, endDegree: DPad.Ring.arc18.end)
        outerRingExtended18.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srerExtended, startDegree: DPad.Ring.arc19.start, endDegree: DPad.Ring.arc19.end)
        outerRingExtended19.setCrescent(crescent, rect: rect, offset: offset)
        
        let edge01InteriorArc = Arc(radius: frir, startDegree: DPad.Ring.arc06.start, endDegree: DPad.Ring.arc06.end)
        let edge01ExteriorArc = Arc(radius: self.edge01ExteriorRadius, startDegree: DPad.Ring.arc06.start, endDegree: DPad.Ring.arc06.end)
        let edge02InteriorArc = Arc(radius: self.firstRingInteriorRadius, startDegree: DPad.Ring.arc07.start, endDegree: DPad.Ring.arc08.end)
        let edge03InteriorArc = Arc(radius: frir, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        let edge03ExteriorArc = Arc(radius: srerExtended, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        let edge04InteriorArc = Arc(radius: trir, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let edge04ExteriorArc = Arc(radius: trer, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let edge05ExteriorArc = Arc(radius: sreer, startDegree: DPad.Ring.arc15.start, endDegree: DPad.Ring.arc15.end)
        
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
        
        var arc = Arc(radius: frir, startDegree: DPad.Ring.arc06.start, endDegree: DPad.Ring.arc06.end)
        var edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge01Point01, edge01Point02])
        edge01.setEdgedCrescent(edgedCrescent, rect: rect, offset: offset)
        
        arc = Arc(radius: frir, startDegree: DPad.Ring.arc07.start, endDegree: DPad.Ring.arc08.end)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge02Point01, edge02Point02, edge02Point03])
        edge02.setEdgedCrescent(edgedCrescent, rect: rect, offset: offset)
        
        arc = Arc(radius: frir, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge03Point01, edge03Point02])
        edge03.setEdgedCrescent(edgedCrescent, rect: rect, offset: offset)
        
        arc = Arc(radius: trir, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge04Point01, edge04Point02])
        edge04.setEdgedCrescent(edgedCrescent, rect: rect, offset: offset)
        
        arc = Arc(radius: srir, startDegree: DPad.Ring.arc15.start, endDegree: DPad.Ring.arc15.end)
        edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [edge05Point01, edge05Point02])
        edge05.setEdgedCrescent(edgedCrescent, rect: rect, offset: offset)
        
        var frame = CGRect(x: 0, y: 0, width: RoundedRectangleButton.defaultSize.width * scaleMultiplier.width, height: RoundedRectangleButton.defaultSize.height * scaleMultiplier.width)
        frame.origin.y = edge04.frame.origin.y
        frame.origin.x = rect.size.width - frame.size.width - edge04.frame.origin.x
        
        let roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: true, rightRounded: true, cornersOnly: false)
        
        top00.rectangle = roundedRectangle
        top00.frame = frame
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if !self.subviews.contains(innerRingSector01) {
            innerRingSector01.setTitle("IRS01", for: UIControlState())
            innerRingSector01.color = Interface.theme.tertiaryLight
            innerRingSector01.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 30.0, bottom: 0.0, right: 0.0)
            self.addSubview(innerRingSector01)
        }
        
        if !self.subviews.contains(innerRingSector04) {
            innerRingSector04.setTitle("IRS04", for: UIControlState())
            innerRingSector04.color = Interface.theme.tertiaryLight
            innerRingSector04.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 30.0, bottom: 20.0, right: 0.0)
            self.addSubview(innerRingSector04)
        }
        
        if !self.subviews.contains(innerRing05) {
            innerRing05.setTitle("IR05", for: UIControlState())
            innerRing05.color = Interface.theme.primaryLight
            self.addSubview(innerRing05)
        }
        
        if !self.subviews.contains(innerRing10) {
            innerRing10.setTitle("6", for: UIControlState())
            innerRing10.color = Interface.theme.primaryLight
            self.addSubview(innerRing10)
        }
        
        if !self.subviews.contains(innerRing11) {
            innerRing11.setTitle("7", for: UIControlState())
            innerRing11.color = Interface.theme.tertiaryLight
            self.addSubview(innerRing11)
        }
        
        if !self.subviews.contains(innerRing12) {
            innerRing12.setTitle("8", for: UIControlState())
            innerRing12.color = Interface.theme.primaryDark
            self.addSubview(innerRing12)
        }
        
        if !self.subviews.contains(innerRing13) {
            innerRing13.setTitle("9", for: UIControlState())
            innerRing13.color = Interface.theme.tertiaryDark
            self.addSubview(innerRing13)
        }
        
        if !self.subviews.contains(innerRing14) {
            innerRing14.setTitle("0", for: UIControlState())
            innerRing14.color = Interface.theme.tertiaryLight
            self.addSubview(innerRing14)
        }
        
        if !self.subviews.contains(innerRing15) {
            innerRing15.setTitle("IR15", for: UIControlState())
            innerRing15.color = Interface.theme.primaryLight
            self.addSubview(innerRing15)
        }
        
        if !self.subviews.contains(innerRing20) {
            innerRing20.setTitle("IR20", for: UIControlState())
            innerRing20.color = Interface.theme.primaryLight
            self.addSubview(innerRing20)
        }
        
        if !self.subviews.contains(outerRing10) {
            outerRing10.setTitle("1", for: UIControlState())
            outerRing10.color = Interface.theme.primaryDark
            self.addSubview(outerRing10)
        }
        
        if !self.subviews.contains(outerRing11) {
            outerRing11.setTitle("2", for: UIControlState())
            outerRing11.color = Interface.theme.tertiaryDark
            self.addSubview(outerRing11)
        }
        
        if !self.subviews.contains(outerRing12) {
            outerRing12.setTitle("3", for: UIControlState())
            outerRing12.color = Interface.theme.tertiaryLight
            self.addSubview(outerRing12)
        }
        
        if !self.subviews.contains(outerRing13) {
            outerRing13.setTitle("4", for: UIControlState())
            outerRing13.color = Interface.theme.primaryLight
            self.addSubview(outerRing13)
        }
        
        if !self.subviews.contains(outerRing14) {
            outerRing14.setTitle("5", for: UIControlState())
            outerRing14.color = Interface.theme.primaryDark
            self.addSubview(outerRing14)
        }
        
        if !self.subviews.contains(outerRing16) {
            outerRing16.setTitle("OR16", for: UIControlState())
            outerRing16.color = Interface.theme.tertiaryDark
            self.addSubview(outerRing16)
        }
        
        if !self.subviews.contains(outerRing17) {
            outerRing17.setTitle("OR17", for: UIControlState())
            outerRing17.color = Interface.theme.primaryLight
            self.addSubview(outerRing17)
        }
        
        if !self.subviews.contains(outerRingExtended18) {
            outerRingExtended18.setTitle("ORE18", for: UIControlState())
            outerRingExtended18.color = Interface.theme.primaryDark
            outerRingExtended18.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0)
            self.addSubview(outerRingExtended18)
        }
        
        if !self.subviews.contains(outerRingExtended19) {
            outerRingExtended19.setTitle("ORE19", for: UIControlState())
            outerRingExtended19.color = Interface.theme.tertiaryDark
            outerRingExtended19.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
            self.addSubview(outerRingExtended19)
        }
        
        if !self.subviews.contains(outerRing20) {
            outerRing20.setTitle("OR20", for: UIControlState())
            outerRing20.color = Interface.theme.tertiaryLight
            self.addSubview(outerRing20)
        }
        
        if !self.subviews.contains(edge01) {
            edge01.setTitle("－", for: UIControlState())
            edge01.color = Interface.theme.tertiaryLight
            edge01.titleLabel?.font = Interface.theme.subtitle
            edge01.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 0.0, right: 0.0)
            self.addSubview(edge01)
        }
        
        if !self.subviews.contains(edge02) {
            edge02.setTitle("MODE SELECT", for: UIControlState())
            edge02.color = Interface.theme.primaryLight
            edge02.contentEdgeInsets = UIEdgeInsets(top: 30.0, left: 60.0, bottom: 0.0, right: 0.0)
            self.addSubview(edge02)
        }
        
        if !self.subviews.contains(edge03) {
            edge03.setTitle("+", for: UIControlState())
            edge03.color = Interface.theme.tertiaryDark
            edge03.titleLabel?.font = Interface.theme.subtitle
            edge03.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 40.0, right: 0.0)
            self.addSubview(edge03)
        }
        
        if !self.subviews.contains(edge04) {
            edge04.setTitle("MARK", for: UIControlState())
            edge04.color = Interface.theme.primaryDark
            edge04.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 40.0, bottom: 20.0, right: 0.0)
            self.addSubview(edge04)
        }
        
        if !self.subviews.contains(edge05) {
            edge05.setTitle("E05", for: UIControlState())
            edge05.color = Interface.theme.tertiaryLight
            self.addSubview(edge05)
        }
        
        if !self.subviews.contains(top00) {
            top00.setTitle("T00", for: UIControlState())
            top00.color = Interface.theme.tertiaryLight
            self.addSubview(top00)
        }
    }
}
