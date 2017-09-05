//===----------------------------------------------------------------------===//
//
// DirectionGroupingView01.swift
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

@IBDesignable open class DirectionGroupingView01: DirectionGroupingView {
    open lazy var innerRing01: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc01.start, endDegree: DPad.Ring.arc04.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR01", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing05: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc05.start, endDegree: DPad.Ring.arc05.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR05", for: UIControlState())
        button.color = Interface.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing10: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc10.start, endDegree: DPad.Ring.arc10.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR10", for: UIControlState())
        button.color = Interface.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing11: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc11.start, endDegree: DPad.Ring.arc11.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR11", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing12: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc12.start, endDegree: DPad.Ring.arc12.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR12", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing13: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR13", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing14: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc14.start, endDegree: DPad.Ring.arc14.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR14", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing15: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc15.start, endDegree: DPad.Ring.arc15.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR15", for: UIControlState())
        button.color = Interface.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing16: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc16.start, endDegree: DPad.Ring.arc19.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR16", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing20: CrescentButton = {
        let crescent = Crescent(innerRadius: self.firstRingInteriorRadius, outerRadius: self.firstRingExteriorRadius, startDegree: DPad.Ring.arc20.start, endDegree: DPad.Ring.arc20.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("IR20", for: UIControlState())
        button.color = Interface.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing10: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc10.start, endDegree: DPad.Ring.arc10.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR10", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing11: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc11.start, endDegree: DPad.Ring.arc11.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR11", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing12: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc12.start, endDegree: DPad.Ring.arc12.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR12", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing13: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR13", for: UIControlState())
        button.color = Interface.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing14: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc14.start, endDegree: DPad.Ring.arc14.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR14", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing16: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc16.start, endDegree: DPad.Ring.arc16.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR16", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing17: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc17.start, endDegree: DPad.Ring.arc17.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR17", for: UIControlState())
        button.color = Interface.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing18: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExtendedExteriorRadius, startDegree: DPad.Ring.arc18.start, endDegree: DPad.Ring.arc18.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR18", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing19: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExtendedExteriorRadius, startDegree: DPad.Ring.arc19.start, endDegree: DPad.Ring.arc19.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR19", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing20: CrescentButton = {
        let crescent = Crescent(innerRadius: self.secondRingInteriorRadius, outerRadius: self.secondRingExteriorRadius, startDegree: DPad.Ring.arc20.start, endDegree: DPad.Ring.arc20.end)
        let button = CrescentButton(with: crescent, rect: self.bounds, offset: self.offset)
        button.setTitle("OR20", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var edge06: EdgedCrescentButton = {
        let interiorArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.Ring.arc06.start, endDegree: DPad.Ring.arc06.end)
        let exteriorArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.Ring.arc06.start, endDegree: DPad.Ring.arc06.end)
        
        let interiorAngleEnd = interiorArc.endDegree - 90
        let exteriorAngleEnd = 90 - interiorAngleEnd
        let endX = (exteriorArc.startPoint.y / sin(exteriorAngleEnd.radians)) * sin(interiorAngleEnd.radians)
        
        let edgePointStart = GraphPoint(x: exteriorArc.startPoint.x, y: exteriorArc.startPoint.y)
        let edgePointEnd = GraphPoint(x: endX, y: exteriorArc.startPoint.y)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: bounds, offset: offset)
        button.setTitle("－", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        button.titleLabel?.font = Interface.theme.subtitle
        self.addSubview(button)
        return button
    }()
    open lazy var edge07: EdgedCrescentButton = {
        let edge06ExteriorArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.Ring.arc06.start, endDegree: DPad.Ring.arc06.end)
        let edge09ExteriorArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        
        let interiorArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.Ring.arc07.start, endDegree: DPad.Ring.arc08.end)
        let interiorAngleStart = interiorArc.startDegree - 90
        let exteriorAngleStart = 90 - interiorAngleStart
        let startX = (edge06ExteriorArc.startPoint.y / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let interiorAngleEnd = 180 - interiorArc.endDegree
        let exteriorAngleEnd = 90 - interiorAngleEnd
        let endY = (edge09ExteriorArc.endPoint.x / sin(exteriorAngleEnd.radians)) * sin(interiorAngleEnd.radians)
        
        let edgePointStart = GraphPoint(x: startX, y: edge06ExteriorArc.startPoint.y)
        let edgePointMiddle = GraphPoint(x: edge09ExteriorArc.endPoint.x, y: edge06ExteriorArc.startPoint.y)
        let edgePointEnd = GraphPoint(x: edge09ExteriorArc.endPoint.x, y: endY)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointMiddle, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: bounds, offset: offset)
        button.setTitle("MODE SELECT", for: UIControlState())
        button.color = Interface.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var edge09: EdgedCrescentButton = {
        let interiorArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        let exteriorArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.Ring.arc09.start, endDegree: DPad.Ring.arc09.end)
        
        let interiorAngleStart = 180 - interiorArc.startDegree
        let exteriorAngleStart = 90 - interiorAngleStart
        let startY = (exteriorArc.endPoint.x / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let edgePointStart = GraphPoint(x: exteriorArc.endPoint.x, y: startY)
        let edgePointEnd = GraphPoint(x: exteriorArc.endPoint.x, y: exteriorArc.endPoint.y)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: bounds, offset: offset)
        button.setTitle("+", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        button.titleLabel?.font = Interface.theme.subtitle
        self.addSubview(button)
        return button
    }()
    open lazy var edge13: EdgedCrescentButton = {
        let interiorArc = Arc(radius: thirdRingInteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        let exteriorArc = Arc(radius: thirdRingExteriorRadius, startDegree: DPad.Ring.arc13.start, endDegree: DPad.Ring.arc13.end)
        
        let interiorAngleStart = 270 - interiorArc.startDegree
        let exteriorAngleStart = 90 - interiorAngleStart
        let startX = (exteriorArc.endPoint.y / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let edgePointStart = GraphPoint(x: -startX, y: exteriorArc.endPoint.y)
        let edgePointEnd = GraphPoint(x: exteriorArc.endPoint.x, y: exteriorArc.endPoint.y)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: bounds, offset: offset)
        button.setTitle("E13", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var edge15: EdgedCrescentButton = {
        let interiorArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.Ring.arc15.start, endDegree: DPad.Ring.arc15.end)
        let exteriorArc = Arc(radius: secondRingEdgeExteriorRadius, startDegree: DPad.Ring.arc15.start, endDegree: DPad.Ring.arc15.end)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [exteriorArc.startPoint, exteriorArc.endPoint])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: bounds, offset: offset)
        button.setTitle("E15", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var top00: RoundedRectangleButton = {
        let edge15Origin = edge15.frame.origin
        
        let width = RoundedRectangleButton.defaultSize.width * scaleMultiplier.width
        let height = RoundedRectangleButton.defaultSize.height * scaleMultiplier.width
        let x = bounds.size.width + width - edge15Origin.x
        let y = edge15Origin.y
        
        let roundedRectangle = RoundedRectangle(size: CGSize(width: width, height: height), leftRounded: true, rightRounded: true, cornersOnly: false)
        
        let button = RoundedRectangleButton(with: roundedRectangle, frame: CGRect(x: x, y: y, width: width, height: height))
        button.setTitle("T00", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 800, height: 660)
    }
    
    // {-27.0, 79.0}
    open override var offset: GraphOriginOffset {
        return GraphOriginOffset(x: 0.0, y: (scaledContentSize.height * 0.075))
    }
    
    override open var secondRingEdgeExteriorRadius: CGFloat {
        return secondRingExteriorRadius + (cruxDiameter * 0.69)
    }
    
    override open var thirdRingExteriorRadius: CGFloat {
        return thirdRingInteriorRadius + (cruxDiameter * 1.2)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        innerRing01.layoutIfNeeded()
        innerRing05.layoutIfNeeded()
        innerRing10.layoutIfNeeded()
        innerRing11.layoutIfNeeded()
        innerRing12.layoutIfNeeded()
        innerRing13.layoutIfNeeded()
        innerRing14.layoutIfNeeded()
        innerRing15.layoutIfNeeded()
        innerRing16.layoutIfNeeded()
        innerRing20.layoutIfNeeded()
        outerRing10.layoutIfNeeded()
        outerRing11.layoutIfNeeded()
        outerRing12.layoutIfNeeded()
        outerRing13.layoutIfNeeded()
        outerRing14.layoutIfNeeded()
        outerRing16.layoutIfNeeded()
        outerRing17.layoutIfNeeded()
        outerRing18.layoutIfNeeded()
        outerRing19.layoutIfNeeded()
        outerRing20.layoutIfNeeded()
        edge06.layoutIfNeeded()
        edge07.layoutIfNeeded()
        edge09.layoutIfNeeded()
        edge13.layoutIfNeeded()
        edge15.layoutIfNeeded()
        top00.layoutIfNeeded()
    }
}
