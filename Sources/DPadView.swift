//===----------------------------------------------------------------------===//
//
// DPadView.swift
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

/// A standard circular direction pad
@IBDesignable open class DPadView: UIView {
    
    open var crux: RoundedRectangleButton = RoundedRectangleButton()
    open var up: DirectionButton = DirectionButton()
    open var down: DirectionButton = DirectionButton()
    open var left: DirectionButton = DirectionButton()
    open var right: DirectionButton = DirectionButton()
    open var sector01: ArcButton = ArcButton()
    open var sector02: ArcButton = ArcButton()
    open var sector03: ArcButton = ArcButton()
    open var sector04: ArcButton = ArcButton()
    
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
