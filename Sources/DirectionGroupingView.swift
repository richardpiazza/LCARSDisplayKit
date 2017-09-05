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
    
    open lazy var crux: RoundedRectangleButton = {
        let x = graphOrigin.x - (cruxDiameter / 2)
        let y = graphOrigin.y - (cruxDiameter / 2)
        let frame = CGRect(x: x, y: y, width: cruxDiameter, height: cruxDiameter)
        let button = RoundedRectangleButton(frame: frame)
        button.color = Interface.theme.primaryDark
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var up: DirectionButton = {
        let x = graphOrigin.x - (cruxDiameter / 2)
        let y = graphOrigin.y - cruxExteriorRadius
        let frame = CGRect(x: x, y: y, width: cruxDiameter, height: cruxDirectionDiameter)
        let button = DirectionButton(frame: frame, radius: cruxExteriorRadius, startDegree: DPad.Crux.up.start, endDegree: DPad.Crux.up.end, cardinal: .up)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var down: DirectionButton = {
        let x = graphOrigin.x - (cruxDiameter / 2)
        let y = graphOrigin.y + (cruxDiameter / 2) + minimalElementSpacing
        let frame = CGRect(x: x, y: y, width: cruxDiameter, height: cruxDirectionDiameter)
        let button = DirectionButton(frame: frame, radius: self.cruxExteriorRadius, startDegree: DPad.Crux.down.start, endDegree: DPad.Crux.down.end, cardinal: .down)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var left: DirectionButton = {
        let x = graphOrigin.x - (cruxDiameter / 2) - cruxDirectionDiameter - minimalElementSpacing
        let y = graphOrigin.y - (cruxDiameter / 2)
        let frame = CGRect(x: x, y: y, width: cruxDirectionDiameter, height: cruxDiameter)
        let button = DirectionButton(frame: frame, radius: self.cruxExteriorRadius, startDegree: DPad.Crux.left.start, endDegree: DPad.Crux.left.end, cardinal: .left)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var right: DirectionButton = {
        let graphOrigin = GraphOrigin(x: self.bounds.graphOrigin.x + offset.x, y: self.bounds.graphOrigin.y + offset.y)
        let x = graphOrigin.x + (cruxDiameter / 2) + minimalElementSpacing
        let y = graphOrigin.y - (cruxDiameter / 2)
        let frame = CGRect(x: x, y: y, width: cruxDirectionDiameter, height: cruxDiameter)
        let button = DirectionButton(frame: frame, radius: self.cruxExteriorRadius, startDegree: DPad.Crux.right.start, endDegree: DPad.Crux.right.end, cardinal: .right)
        button.setTitle("", for: UIControlState())
        self.addSubview(button)
        return button
    }()
    open lazy var sector01: ArcButton = {
        let arc = Arc(radius: self.cruxExteriorRadius, startDegree: DPad.Crux.sector01.start, endDegree: DPad.Crux.sector01.end)
        let button = ArcButton(with: arc, rect: self.bounds, offset: self.offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    open lazy var sector02: ArcButton = {
        let arc = Arc(radius: self.cruxExteriorRadius, startDegree: DPad.Crux.sector02.start, endDegree: DPad.Crux.sector02.end)
        let button = ArcButton(with: arc, rect: self.bounds, offset: self.offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    open lazy var sector03: ArcButton = {
        let arc = Arc(radius: self.cruxExteriorRadius, startDegree: DPad.Crux.sector03.start, endDegree: DPad.Crux.sector03.end)
        let button = ArcButton(with: arc, rect: self.bounds, offset: self.offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    open lazy var sector04: ArcButton = {
        let arc = Arc(radius: self.cruxExteriorRadius, startDegree: DPad.Crux.sector04.start, endDegree: DPad.Crux.sector04.end)
        let button = ArcButton(with: arc, rect: self.bounds, offset: self.offset)
        button.setTitle("", for: UIControlState())
        button.color = Interface.theme.primaryMedium
        self.addSubview(button)
        return button
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 348, height: 348)
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
    
    open var scaleMultiplier: CGSize {
        return CGSize(width: scaledContentSize.width / intrinsicContentSize.width, height: scaledContentSize.height / intrinsicContentSize.height)
    }
    
    // {x: 0.0, y: 0.0}
    open var offset: GraphOriginOffset {
        return GraphOriginOffset()
    }
    
    open var graphOrigin: GraphOrigin {
        return GraphOrigin(x: bounds.graphOrigin.x + offset.x, y: bounds.graphOrigin.y + offset.y)
    }
    
    // 8.0
    open var minimalElementSpacing: CGFloat {
        if scaledContentSize.width >= scaledContentSize.height {
            return scaledContentSize.width * 0.01085
        } else {
            return scaledContentSize.height * 0.01486
        }
    }
    
    // 15.0
    open var defaultElementSpacing: CGFloat {
        if scaledContentSize.width >= scaledContentSize.height {
            return scaledContentSize.width * 0.02035
        } else {
            return scaledContentSize.height * 0.02788
        }
    }
    
    // 30.0
    open var maximumElementSpacing: CGFloat {
        if scaledContentSize.width >= scaledContentSize.height {
            return scaledContentSize.width * 0.0407
        } else {
            return scaledContentSize.height * 0.05576
        }
    }
    
    // 60.0
    open var cruxDiameter: CGFloat {
        if scaledContentSize.width >= scaledContentSize.height {
            return RoundedRectangleButton.defaultSize.height * scaleMultiplier.width
        } else {
            return RoundedRectangleButton.defaultSize.height * scaleMultiplier.height
        }
    }
    
    // 46.426406871192851
    open var cruxInteriorRadius: CGFloat {
        return (cruxDiameter / 2) + minimalElementSpacing
    }
    
    // 166.426406871192851
    open var cruxExteriorRadius: CGFloat {
        return cruxInteriorRadius + (cruxDiameter * 2.3)
    }
    
    open var cruxDirectionDiameter: CGFloat {
        return cruxExteriorRadius - cruxInteriorRadius
    }
    
    // 181.426406871192851
    open var firstRingInteriorRadius: CGFloat {
        return cruxExteriorRadius + defaultElementSpacing
    }
    
    // 261.226406871192851
    open var firstRingExteriorRadius: CGFloat {
        return firstRingInteriorRadius + (cruxDiameter * 1.33)
    }
    
    open var firstRingEdgeExteriorRadius: CGFloat {
        return firstRingExteriorRadius
    }
    
    // 276.226406871192851
    open var secondRingInteriorRadius: CGFloat {
        return firstRingExteriorRadius + defaultElementSpacing
    }
    
    // 326.206406871192851
    open var secondRingExteriorRadius: CGFloat {
        return secondRingInteriorRadius + (cruxDiameter * 0.833)
    }
    
    // 386.206406871192851
    open var secondRingExtendedExteriorRadius: CGFloat {
        return secondRingInteriorRadius + (cruxDiameter * 1.833)
    }
    
    // 339.706406871192851
    open var secondRingEdgeExteriorRadius: CGFloat {
        return secondRingExteriorRadius + (cruxDiameter * 0.225)
    }
    
    // 341.206406871192851
    open var thirdRingInteriorRadius: CGFloat {
        return secondRingExteriorRadius + defaultElementSpacing
    }
    
    // 386.206406871192851
    open var thirdRingExteriorRadius: CGFloat {
        return thirdRingInteriorRadius + (cruxDiameter * 0.75)
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

