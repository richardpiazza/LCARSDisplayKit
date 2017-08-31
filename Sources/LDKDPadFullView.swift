//===----------------------------------------------------------------------===//
//
// LDKDPadFullView.swift
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

open class LDKDPadFullView: LDKDPadExpandedView {
    // Labeled for Sector or Arc Degree
    open var outerRing05: LDKCrescentButton = LDKCrescentButton()
    open var outerRingSector01: LDKCrescentButton = LDKCrescentButton()
    
    // Labeled numerically from zero degrees
    open var top01: LDKButton = LDKButton()
    open var top02: LDKButton = LDKButton()
    open var top03: LDKButton = LDKButton()
    open var top04: LDKButton = LDKButton()
    open var top05: LDKButton = LDKButton()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 794, height: 794)
    }
    
    override open var offset: GraphOriginOffset {
        return GraphOriginOffset(x: 0.0, y: intrinsicContentSize.height * 0.0625)
    }
    
    override open var edge01ExteriorRadius: CGFloat {
        return self.secondRingExteriorRadius
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let srir = self.secondRingInteriorRadius
        let srer = self.secondRingExteriorRadius
        
        var crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingSector01.startDegree, endDegree: LDKRingSector01.endDegree)
        outerRingSector01.setCrescent(crescent, rect: rect, offset: offset)
        
        crescent = Crescent(innerRadius: srir, outerRadius: srer, startDegree: LDKRingArc05.startDegree, endDegree: LDKRingArc05.endDegree)
        outerRing05.setCrescent(crescent, rect: rect, offset: offset)
        
        var frame = CGRect.zero
        if !edge04.edgePoint1.equalTo(CGPoint.zero) {
            if !edge04.edgePoint2.equalTo(CGPoint.zero) {
                frame.size.width = edge04.edgePoint2.x - edge04.edgePoint1.x
            }
        }
        
        var ldkButtonFrame = CGRect(x: 0, y: 0, width: LDKButton.defaultSize.width / graphMultiplier.width, height: LDKButton.defaultSize.height / graphMultiplier.height)
        
        frame.origin.x = edge04.frame.origin.x
        frame.origin.y = edge04.frame.origin.y - (ldkButtonFrame.height + 8)
        frame.size.height = ldkButtonFrame.height
        
        var roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: false, rightRounded: false, cornersOnly: false)
        top01.rectangle = roundedRectangle
        top01.frame = frame
        
        if !edge05.edgePoint1.equalTo(CGPoint.zero) {
            if !edge05.edgePoint2.equalTo(CGPoint.zero) {
                frame.size.width = edge05.edgePoint2.x - edge05.edgePoint1.x
            }
        }
        
        frame.origin.x = edge05.frame.origin.x
        frame.origin.y = edge05.frame.origin.y - (ldkButtonFrame.height + 8)
        frame.size.height = ldkButtonFrame.height
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: false, rightRounded: false, cornersOnly: false)
        top03.rectangle = roundedRectangle
        top03.frame = frame
        
        frame.size.width = 80
        frame.origin.x = top03.frame.origin.x - 88
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: true, rightRounded: false, cornersOnly: false)
        top02.rectangle = roundedRectangle
        top02.frame = frame
        
        frame.origin.x = top03.frame.origin.x + top03.frame.size.width + 8
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: false, rightRounded: true, cornersOnly: false)
        top04.rectangle = roundedRectangle
        top04.frame = frame
        
        frame.origin.x = top00.frame.origin.x
        frame.size.width = top00.frame.size.width
        
        roundedRectangle = RoundedRectangle(size: frame.size, leftRounded: true, rightRounded: true, cornersOnly: false)
        top05.rectangle = roundedRectangle
        top05.frame = frame
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if !self.subviews.contains(outerRingSector01) {
            outerRingSector01.color = Interface.theme.primaryDark
            outerRingSector01.setTitle("ORS01", for: UIControlState())
            outerRingSector01.contentEdgeInsets = UIEdgeInsets(top: 30.0, left: 60.0, bottom: 0.0, right: 0.0)
            self.addSubview(outerRingSector01)
        }
        
        if !self.subviews.contains(outerRing05) {
            outerRing05.color = Interface.theme.primaryDark
            outerRing05.setTitle("OR05", for: UIControlState())
            self.addSubview(outerRing05)
        }
        
        if !self.subviews.contains(top01) {
            top01.color = Interface.theme.tertiaryLight
            top01.setTitle("Calibrate", for: UIControlState())
            self.addSubview(top01)
        }
        
        if !self.subviews.contains(top02) {
            top02.color = Interface.theme.primaryLight
            top02.setTitle("T02", for: UIControlState())
            self.addSubview(top02)
        }
        
        if !self.subviews.contains(top03) {
            top03.color = Interface.theme.tertiaryDark
            top03.setTitle("T03", for: UIControlState())
            self.addSubview(top03)
        }
        
        if !self.subviews.contains(top04) {
            top04.color = Interface.theme.primaryDark
            top04.setTitle("T04", for: UIControlState())
            self.addSubview(top04)
        }
        
        if !self.subviews.contains(top05) {
            top05.color = Interface.theme.primaryDark
            top05.setTitle("T05", for: UIControlState())
            self.addSubview(top05)
        }
    }
}