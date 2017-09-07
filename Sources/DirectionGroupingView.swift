//===----------------------------------------------------------------------===//
//
// DirectionGroupingView.swift
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

/// The standard circular Direction-Pad found in many LCARS layouts.
@IBDesignable open class DirectionGroupingView: UIView {
    
    open static var defaultCruxDiameter: CGFloat = CGFloat(60)
    
    open lazy var crux: RoundedRectangleButton = {
        let frame = CGRect(x: graphOrigin.x - (cruxDiameter / 2), y: graphOrigin.y - (cruxDiameter / 2), width: cruxDiameter, height: cruxDiameter)
        let button = RoundedRectangleButton(frame: frame)
        button.color = Interface.theme.primaryDark
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var up: DirectionButton = {
        let frame = self.frame(for: .up)
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.up.start, endDegree: DPad.Crux.up.end + 0.5)
        let direction = Direction(with: arc, cardinal: .up)
        let button = DirectionButton(with: frame, direction: direction)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var down: DirectionButton = {
        let frame = self.frame(for: .down)
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.down.start - 0.5, endDegree: DPad.Crux.down.end)
        let direction = Direction(with: arc, cardinal: .down)
        let button = DirectionButton(with: frame, direction: direction)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var left: DirectionButton = {
        let frame = self.frame(for: .left)
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.left.start - 0.5, endDegree: DPad.Crux.left.end)
        let direction = Direction(with: arc, cardinal: .left)
        let button = DirectionButton(with: frame, direction: direction)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var right: DirectionButton = {
        let frame = self.frame(for: .right)
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.right.start, endDegree: DPad.Crux.right.end + 0.5)
        let direction = Direction(with: arc, cardinal: .right)
        let button = DirectionButton(with: frame, direction: direction)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var sector01: ArcButton = {
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.sector01.start, endDegree: DPad.Crux.sector01.end)
        let button = ArcButton(with: arc, rect: bounds, offset: offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    open lazy var sector02: ArcButton = {
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.sector02.start, endDegree: DPad.Crux.sector02.end)
        let button = ArcButton(with: arc, rect: bounds, offset: offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    open lazy var sector03: ArcButton = {
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.sector03.start, endDegree: DPad.Crux.sector03.end)
        let button = ArcButton(with: arc, rect: bounds, offset: offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    open lazy var sector04: ArcButton = {
        let arc = Arc(radius: dpadRadius, startDegree: DPad.Crux.sector04.start, endDegree: DPad.Crux.sector04.end)
        let button = ArcButton(with: arc, rect: bounds, offset: offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 350)
    }
    
    open var intrinsicRatio: CGFloat{
        if intrinsicContentSize.width >= intrinsicContentSize.height {
            return intrinsicContentSize.width / intrinsicContentSize.height
        } else {
            return intrinsicContentSize.height / intrinsicContentSize.width
        }
    }
    
    open var scaledContentSize: CGSize {
        if self.bounds.size.width >= self.bounds.size.height {
            return CGSize(width: self.bounds.height * intrinsicRatio, height: self.bounds.height)
        } else {
            return CGSize(width: self.bounds.width, height: self.bounds.width * intrinsicRatio)
        }
    }
    
    /// Percent to scale individual amounts by
    open var scaleRatio: CGFloat {
        if scaledContentSize.width >= scaledContentSize.height {
            return scaledContentSize.width / intrinsicContentSize.width
        } else {
            return scaledContentSize.height / intrinsicContentSize.height
        }
    }
    
    // {x: 0.0, y: 0.0}
    open var offset: GraphOriginOffset {
        return GraphOriginOffset()
    }
    
    open var graphOrigin: GraphOrigin {
        return GraphOrigin(x: bounds.graphOrigin.x + offset.x, y: bounds.graphOrigin.y + offset.y)
    }
    
    /// The width and height of the central square
    open var cruxDiameter: CGFloat {
        return DirectionGroupingView.defaultCruxDiameter * scaleRatio
    }
    
    /// Determines the frame for each of the direction buttons.
    open func frame(for direction: Direction.Cardinal) -> CGRect {
        var size: CGSize
        switch direction {
        case .up, .down:
            size = CGSize(width: cruxDiameter, height: (dpadRadius - (cruxDiameter / 2) - Interface.theme.defaultSpacing))
        case .left, .right:
            size = CGSize(width: (dpadRadius - (cruxDiameter / 2) - Interface.theme.defaultSpacing), height: cruxDiameter)
        }
        
        var origin: CGPoint
        switch direction {
        case .up:
            origin = CGPoint(x: graphOrigin.x - (cruxDiameter / 2), y: graphOrigin.y - dpadRadius)
        case .down:
            origin = CGPoint(x: graphOrigin.x - (cruxDiameter / 2), y: graphOrigin.y + (cruxDiameter / 2) + Interface.theme.defaultSpacing)
        case .left:
            origin = CGPoint(x: graphOrigin.x - dpadRadius, y: graphOrigin.y - (cruxDiameter / 2))
        case .right:
            origin = CGPoint(x: graphOrigin.x + (cruxDiameter / 2) + Interface.theme.defaultSpacing, y: graphOrigin.y - (cruxDiameter / 2))
        }
        
        return CGRect(origin: origin, size: size)
    }
    
    /// Radius of the entire Direction Pad
    open var dpadRadius: CGFloat {
        return scaleRatio * 175.0
    }
    
    ///
    open var firstRingInteriorRadius: CGFloat {
        return dpadRadius + Interface.theme.defaultSpacing
    }
    
    ///
    open var firstRingExteriorRadius: CGFloat {
        return firstRingInteriorRadius + (scaleRatio * 80.0)
    }
    
    ///
    open var firstRingEdgeExteriorRadius: CGFloat {
        return firstRingExteriorRadius
    }
    
    ///
    open var secondRingInteriorRadius: CGFloat {
        return firstRingExteriorRadius + Interface.theme.defaultSpacing
    }
    
    ///
    open var secondRingExteriorRadius: CGFloat {
        return secondRingInteriorRadius + (scaleRatio * 50.0)
    }
    
    ///
    open var secondRingExtendedExteriorRadius: CGFloat {
        return secondRingInteriorRadius + (scaleRatio * 110.0)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        crux.layoutIfNeeded()
        up.layoutIfNeeded()
        down.layoutIfNeeded()
        left.layoutIfNeeded()
        right.layoutIfNeeded()
        sector01.layoutIfNeeded()
        sector02.layoutIfNeeded()
        sector03.layoutIfNeeded()
        sector04.layoutIfNeeded()
    }
}

