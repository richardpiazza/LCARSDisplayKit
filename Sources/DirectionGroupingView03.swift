//===----------------------------------------------------------------------===//
//
// DirectionGroupingView03.swift
//
// Copyright (c) 2017 Richard Piazza
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

/// An expansion of the `DirectionGroupingView` with surrounding buttons.
/// This particular layout comes from the small Tactical station behind the command
/// chairs on the USS Voyager.
@IBDesignable open class DirectionGroupingView03: DirectionGroupingView {
    
    open lazy var innerRing01: CrescentButton = {
        var half = DPad.Ring.arc02.start + ((DPad.Ring.arc02.end - DPad.Ring.arc02.start) / 2)
        var crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc01.start + 1.5, endDegree: half)
        crescent.outerArc.startDegree = DPad.Ring.arc01.start - 2.0
        crescent.boundStart = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("454", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing08: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc08.start, endDegree: DPad.Ring.arc08.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("81", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing09: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("77", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing10: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc10.start, endDegree: DPad.Ring.arc10.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("378", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing11: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc11.start, endDegree: DPad.Ring.arc11.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("42", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing13: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("25", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing14: CrescentButton = {
        var crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc14.start, endDegree: DPad.Ring.arc14.end)
        crescent.outerArc.endDegree = DPad.Ring.arc14.end + 2.0
        crescent.boundEnd = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("12", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing15: CrescentButton = {
        var crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc15.start - 0.5, endDegree: DPad.Ring.arc15.end + 0.5)
        crescent.boundStart = true
        crescent.boundEnd = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("858", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing16: CrescentButton = {
        let half = DPad.Ring.arc17.start + ((DPad.Ring.arc17.end - DPad.Ring.arc17.start) / 2)
        var crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc16.start, endDegree: half)
        crescent.outerArc.startDegree = DPad.Ring.arc16.start - 3.0
        crescent.boundStart = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("453", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing17: CrescentButton = {
        let half = DPad.Ring.arc17.start + ((DPad.Ring.arc17.end - DPad.Ring.arc17.start) / 2) + 2.0
        var crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: half, endDegree: DPad.Ring.arc19.end - 1.5)
        crescent.outerArc.endDegree = DPad.Ring.arc19.end + 2.0
        crescent.boundEnd = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("2852", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing20: CrescentButton = {
        var crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc20.start - 1.0, endDegree: DPad.Ring.arc20.end)
        crescent.boundStart = true
        crescent.boundEnd = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR20", for: UIControlState())
        button.color = Interface.theme.inactive
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing09: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("16", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing10: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc10.start, endDegree: DPad.Ring.arc10.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("51", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing11: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc11.start, endDegree: DPad.Ring.arc11.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("23", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing12: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc12.start, endDegree: DPad.Ring.arc12.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("38", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing13: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("23", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing18Extended: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExtendedExteriorRadius, startDegree: DPad.Ring.arc18.start, endDegree: DPad.Ring.arc18.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("ORE18", for: UIControlState())
        button.color = Interface.theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing19Extended: CrescentButton = {
        var crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExtendedExteriorRadius, startDegree: DPad.Ring.arc19.start, endDegree: DPad.Ring.arc19.end + 2.0)
        crescent.boundEnd = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("ORE19", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        button.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing20Extended: CrescentButton = {
        var startDegree = GraphPoint.degree(graphPoint: innerRing20.crescent.outerArc.startPoint) + 0.25
        var endDegree = GraphPoint.degree(graphPoint: innerRing20.crescent.outerArc.endPoint) - 0.25
        var crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExtendedExteriorRadius, startDegree: startDegree, endDegree: endDegree)
        crescent.boundStart = true
        crescent.boundEnd = true
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR20", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var edge04: EdgedCrescentButton = {
        let interiorArc = Arc(radius: self.thirdRingInteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let exteriorArc = Arc(radius: self.thirdRingExteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let interiorAngleStart = 270 - interiorArc.startDegree
        let exteriorAngleStart = 180 - 90 - interiorAngleStart
        let edgeLength = (exteriorArc.endPoint.y / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let point01 = CGPoint(x: -edgeLength, y: exteriorArc.endPoint.y)
        let point02 = CGPoint(x: exteriorArc.endPoint.x, y: exteriorArc.endPoint.y)
        
        var arc = Arc(radius: self.thirdRingInteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        var edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [point01, point02])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: self.bounds, offset: self.offset)
        button.setTitle("Mark", for: UIControlState())
        button.color = Interface.theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 40.0, bottom: 20.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var edge05: EdgedCrescentButton = {
        let startDegree = GraphPoint.degree(graphPoint: innerRing15.crescent.outerArc.startPoint) + 0.25
        let endDegree = GraphPoint.degree(graphPoint: innerRing15.crescent.outerArc.endPoint) - 0.25
        let interiorArc = Arc(radius: self.secondRingInteriorRadius, startDegree: startDegree, endDegree: endDegree)
        var exteriorArc = Arc(radius: self.secondRingEdgeExteriorRadius, startDegree: startDegree, endDegree: endDegree)
        exteriorArc.boundedStart = interiorArc.startPoint
        exteriorArc.boundedEnd = interiorArc.endPoint
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [exteriorArc.startPoint, exteriorArc.endPoint])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: self.bounds, offset: self.offset)
        button.setTitle("E05", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var top00: RoundedRectangleButton = {
        var frame = CGRect(x: 0, y: 0, width: 0, height: self.cruxDiameter)
        if scaledContentSize.width >= scaledContentSize.height {
            frame.size.width = RoundedRectangleButton.defaultSize.width * scaleMultiplier.width
        } else {
            frame.size.width = RoundedRectangleButton.defaultSize.width * scaleMultiplier.height
        }
        frame.origin.y = edge05.frame.origin.y
        frame.origin.x = innerRing17.frame.origin.x
        
        let button = RoundedRectangleButton(frame: frame)
        button.roundRight = true
        button.setTitle("T00", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 737, height: 538)
    }
    
    // {-27.0, 79.0}
    open override var offset: GraphOriginOffset {
        return GraphOriginOffset(x: -(scaledContentSize.width * 0.0366), y: (scaledContentSize.height * 0.1468))
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        crux.color = Interface.theme.tertiaryLight
        sector01.color = Interface.theme.inactive
        sector02.color = Interface.theme.inactive
        sector03.color = Interface.theme.inactive
        sector04.color = Interface.theme.inactive
        
        innerRing01.layoutIfNeeded()
        innerRing08.layoutIfNeeded()
        innerRing09.layoutIfNeeded()
        innerRing10.layoutIfNeeded()
        innerRing11.layoutIfNeeded()
        innerRing13.layoutIfNeeded()
        innerRing14.layoutIfNeeded()
        innerRing15.layoutIfNeeded()
        innerRing16.layoutIfNeeded()
        innerRing17.layoutIfNeeded()
        innerRing20.layoutIfNeeded()
        outerRing09.layoutIfNeeded()
        outerRing10.layoutIfNeeded()
        outerRing11.layoutIfNeeded()
        outerRing12.layoutIfNeeded()
        outerRing13.layoutIfNeeded()
        outerRing18Extended.layoutIfNeeded()
        outerRing19Extended.layoutIfNeeded()
        outerRing20Extended.layoutIfNeeded()
        edge04.layoutIfNeeded()
        edge05.layoutIfNeeded()
        top00.layoutIfNeeded()
    }
}

