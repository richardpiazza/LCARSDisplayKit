//===----------------------------------------------------------------------===//
//
// LDKDPadView.swift
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

public typealias LDKDegreeRange = (startDegree: CGFloat, endDegree: CGFloat)

//public let LDKRingArc01: LDKDegreeRange = (CGFloat(9.5), CGFloat(25.5))
//public let LDKRingArc02: LDKDegreeRange = (CGFloat(27.5), CGFloat(43.5))
//public let LDKRingArc03: LDKDegreeRange = (CGFloat(45.5), CGFloat(61.5))
//public let LDKRingArc04: LDKDegreeRange = (CGFloat(63.5), CGFloat(79.5))
//public let LDKRingArc05: LDKDegreeRange = (CGFloat(81.5), CGFloat(97.5))
//public let LDKRingArc06: LDKDegreeRange = (CGFloat(99.5), CGFloat(115.5))
//public let LDKRingArc07: LDKDegreeRange = (CGFloat(117.5), CGFloat(133.5))
//public let LDKRingArc08: LDKDegreeRange = (CGFloat(135.5), CGFloat(151.5))
//public let LDKRingArc09: LDKDegreeRange = (CGFloat(153.5), CGFloat(169.5))
//public let LDKRingArc10: LDKDegreeRange = (CGFloat(171.5), CGFloat(187.5))
//public let LDKRingArc11: LDKDegreeRange = (CGFloat(189.5), CGFloat(205.5))
//public let LDKRingArc12: LDKDegreeRange = (CGFloat(207.5), CGFloat(223.5))
//public let LDKRingArc13: LDKDegreeRange = (CGFloat(225.5), CGFloat(241.5))
//public let LDKRingArc14: LDKDegreeRange = (CGFloat(243.5), CGFloat(259.5))
//public let LDKRingArc15: LDKDegreeRange = (CGFloat(261.5), CGFloat(278.5))
//public let LDKRingArc16: LDKDegreeRange = (CGFloat(280.5), CGFloat(296.5))
//public let LDKRingArc17: LDKDegreeRange = (CGFloat(298.5), CGFloat(314.5))
//public let LDKRingArc18: LDKDegreeRange = (CGFloat(316.5), CGFloat(332.5))
//public let LDKRingArc19: LDKDegreeRange = (CGFloat(334.5), CGFloat(350.5))
//public let LDKRingArc20: LDKDegreeRange = (CGFloat(352.5), CGFloat(8.5))

@IBDesignable open class LDKDPadView: UIView {
    
    open var crux: LDKButton = LDKButton()
    open var up: LDKDirectionButton = LDKDirectionButton()
    open var down: LDKDirectionButton = LDKDirectionButton()
    open var left: LDKDirectionButton = LDKDirectionButton()
    open var right: LDKDirectionButton = LDKDirectionButton()
    open var sector01: LDKSectorButton = LDKSectorButton()
    open var sector02: LDKSectorButton = LDKSectorButton()
    open var sector03: LDKSectorButton = LDKSectorButton()
    open var sector04: LDKSectorButton = LDKSectorButton()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 384, height: 384)
    }
    
    open var intrinsicRatio: CGFloat{
        if intrinsicContentSize.width >= intrinsicContentSize.height {
            return intrinsicContentSize.width / intrinsicContentSize.height
        } else {
            return intrinsicContentSize.height / intrinsicContentSize.width
        }
    }
    
    open var scaledContentSize: CGSize {
        if intrinsicContentSize.width >= intrinsicContentSize.height {
            if self.bounds.size.width >= self.bounds.size.height {
                return CGSize(width: self.bounds.height * intrinsicRatio, height: self.bounds.height)
            } else {
                return CGSize(width: self.bounds.width, height: self.bounds.height / intrinsicRatio)
            }
        } else {
            if self.bounds.size.height >= self.bounds.size.width {
                return CGSize(width: self.bounds.width, height: self.bounds.width * intrinsicRatio)
            } else {
                return CGSize(width: self.bounds.height / intrinsicRatio, height: self.bounds.width)
            }
        }
    }
    
    open var scaleMultiplier: CGSize {
        return CGSize(width: scaledContentSize.width / intrinsicContentSize.width, height: scaledContentSize.height / intrinsicContentSize.height)
    }
    
    open var offset: GraphOriginOffset {
        return GraphOriginOffset(x: 0, y: 0)
    }

    open var cruxInteriorRadius: CGFloat {
        return CGFloat((scaledContentSize.width / 2) * 0.3125)
    }
    
    open var cruxExteriorRadius: CGFloat {
        return CGFloat(scaledContentSize.width / 2)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let graphOrigin = GraphOrigin(x: rect.graphOrigin.x + offset.x, y: rect.graphOrigin.y + offset.y)
        
        let cir = cruxInteriorRadius
        let cer = cruxExteriorRadius
        
        var width = cir
        var height = cir
        var x = graphOrigin.x - (width / 2)
        var y = graphOrigin.y - (height / 2)
        
        var frame = CGRect(x: x, y: y, width: width, height: height)
        
        crux.rectangle = RoundedRectangle(size: frame.size, leftRounded: false, rightRounded: false, cornersOnly: false)
        crux.frame = frame
        
        height = cer - 8 - cir / 2
        y = graphOrigin.y - cer
        frame = CGRect(x: x, y: y, width: width, height: height)
        
        up.frame = frame
        up.direction.size = frame.size
        up.radius = cer
        up.startDegree = DPad.Crux.up.start
        up.endDegree = DPad.Crux.up.end
        up.cardinalDegree = Direction.Cardinal.up.degree
        
        y = graphOrigin.y + cir / 2 + 8
        frame = CGRect(x: x, y: y, width: width, height: height)
        
        down.frame = frame
        down.direction.size = frame.size
        down.radius = cer
        down.startDegree = DPad.Crux.down.start
        down.endDegree = DPad.Crux.down.end
        down.cardinalDegree = Direction.Cardinal.down.degree
        
        height = cir
        width = cer - 8 - cir / 2
        x = graphOrigin.x - cir / 2 - width - 8
        y = graphOrigin.y - cir / 2
        frame = CGRect(x: x, y: y, width: width, height: height)
        
        left.frame = frame
        left.direction.size = frame.size
        left.radius = cer
        left.startDegree = DPad.Crux.left.start
        left.endDegree = DPad.Crux.left.end
        left.cardinalDegree = Direction.Cardinal.left.degree
        
        x = graphOrigin.x + cir / 2 + 8
        frame = CGRect(x: x, y: y, width: width, height: height)
        
        right.frame = frame
        right.direction.size = frame.size
        right.radius = cer
        right.startDegree = DPad.Crux.right.start
        right.endDegree = DPad.Crux.right.end
        right.cardinalDegree = Direction.Cardinal.right.degree
        
        var arc = Arc(radius: cer, startDegree: DPad.Crux.sector01.start, endDegree: DPad.Crux.sector01.end)
        sector01.setArc(arc, rect: rect, offset: offset)
        
        arc = Arc(radius: cer, startDegree: DPad.Crux.sector02.start, endDegree: DPad.Crux.sector02.end)
        sector02.setArc(arc, rect: rect, offset: offset)
        
        arc = Arc(radius: cer, startDegree: DPad.Crux.sector03.start, endDegree: DPad.Crux.sector03.end)
        sector03.setArc(arc, rect: rect, offset: offset)
        
        arc = Arc(radius: cer, startDegree: DPad.Crux.sector04.start, endDegree: DPad.Crux.sector04.end)
        sector04.setArc(arc, rect: rect, offset: offset)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if !self.subviews.contains(crux) {
            crux.color = Interface.theme.primaryDark
            crux.setTitle("", for: UIControlState())
            self.addSubview(crux)
        }
        
        if !self.subviews.contains(up) {
            up.setTitle("", for: UIControlState())
            self.addSubview(up)
        }
        
        if !self.subviews.contains(down) {
            down.setTitle("", for: UIControlState())
            self.addSubview(down)
        }
        
        if !self.subviews.contains(left) {
            left.setTitle("", for: UIControlState())
            self.addSubview(left)
        }
        
        if !self.subviews.contains(right) {
            right.setTitle("", for: UIControlState())
            self.addSubview(right)
        }
        
        if !self.subviews.contains(sector01) {
            sector01.setTitle("", for: UIControlState())
            sector01.color = Interface.theme.primaryMedium
            self.addSubview(sector01)
        }
        
        if !self.subviews.contains(sector02) {
            sector02.setTitle("", for: UIControlState())
            sector02.color = Interface.theme.primaryMedium
            self.addSubview(sector02)
        }
        
        if !self.subviews.contains(sector03) {
            sector03.setTitle("", for: UIControlState())
            sector03.color = Interface.theme.primaryMedium
            self.addSubview(sector03)
        }
        
        if !self.subviews.contains(sector04) {
            sector04.setTitle("", for: UIControlState())
            sector04.color = Interface.theme.primaryMedium
            self.addSubview(sector04)
        }
        
        self.setNeedsDisplay()
    }
}
