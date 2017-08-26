//===----------------------------------------------------------------------===//
//
// LDKElbowButton.swift
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

@IBDesignable open class LDKElbowButton: UIButton, Tappable {
    @IBInspectable open var backgroundImageColor: UIColor = Interface.theme.primaryDark
    @IBInspectable open var top: Bool = true
    @IBInspectable open var left: Bool = true
    /// Specifies if the corner specified by `top` and `left` should be rounded.
    @IBInspectable open var rounded: Bool = true
    @IBInspectable open var horizontalHeight: CGFloat = CGFloat(120)
    @IBInspectable open var verticalWidth: CGFloat = CGFloat(30)
    /// If closedHeight > 0, an additional area is drawn parallel to the horizontalHeight area.
    @IBInspectable open var closedHeight: CGFloat = CGFloat(0)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.Okuda.regular
        self.setTitleColor(UIColor.black, for: UIControlState())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.font = UIFont.Okuda.regular
        self.setTitleColor(UIColor.black, for: UIControlState())
    }
    
    convenience init(frame: CGRect, top: Bool, left: Bool, rounded: Bool, horizontalHeight: CGFloat, verticalWidth: CGFloat, closedHeight: CGFloat) {
        self.init(frame: frame)
        self.top = top
        self.left = left
        self.rounded = rounded
        self.horizontalHeight = horizontalHeight
        self.verticalWidth = verticalWidth
        self.closedHeight = closedHeight
    }
    
    // MARK: - Tappable
    open func backgroundImagePath(_ size: CGSize) -> CGMutablePath {
        return type(of: self).elbowPathWithSize(size, top: top, left: left, rounded: rounded, horizontalHeight: horizontalHeight, verticalWidth: verticalWidth, closedHeight: closedHeight)
    }
    
    // MARK: - CG Paths
    open static func elbowPathWithSize(_ size: CGSize, top: Bool, left: Bool, rounded: Bool, horizontalHeight: CGFloat, verticalWidth: CGFloat, closedHeight: CGFloat) -> CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let outerRadius = fmax(horizontalHeight, verticalWidth) / 2
        let innerRadius = outerRadius / 2.4
        let upperLeftOuterCenter = CGPoint(x: outerRadius, y: outerRadius)
        let upperLeftInnerCenter = CGPoint(x: verticalWidth + innerRadius, y: horizontalHeight + innerRadius)
        let lowerRightOuterCenter = CGPoint(x: size.width - outerRadius, y: size.height - outerRadius)
        let lowerRightInnerCenter = CGPoint(x: size.width - verticalWidth - innerRadius, y: size.height - horizontalHeight - innerRadius)
        
        if top && left {
            // Upper Left
            if rounded {
                path.addArc(center: upperLeftOuterCenter, radius: outerRadius, startAngle: CGFloat.radians180, endAngle: CGFloat.radians270, clockwise: false)
            } else {
                path.move(to: CGPoint.zero)
            }
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: verticalWidth + innerRadius, y: horizontalHeight))
                path.addArc(center: upperLeftInnerCenter, radius: innerRadius, startAngle: CGFloat.radians270, endAngle: CGFloat.radians180, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: verticalWidth, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: size.height))
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: size.height))
            }
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.closeSubpath()
        } else if !top && left {
            // Lower Left
            if rounded {
                path.addArc(center: CGPoint(x: upperLeftOuterCenter.x, y: lowerRightOuterCenter.y), radius: outerRadius, startAngle: CGFloat.radians180, endAngle: CGFloat.radians90, clockwise: true)
            } else {
                path.move(to: CGPoint(x: 0, y: size.height))
            }
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: size.width, y: size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: verticalWidth + innerRadius, y: size.height - horizontalHeight))
                path.addArc(center: CGPoint(x: upperLeftInnerCenter.x, y: lowerRightInnerCenter.y), radius: innerRadius, startAngle: CGFloat.radians90, endAngle: CGFloat.radians180, clockwise: false)
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: verticalWidth, y: closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: closedHeight))
                path.addLine(to: CGPoint(x: size.width, y: 0))
            } else {
                path.addLine(to: CGPoint(x: verticalWidth, y: 0))
            }
            path.addLine(to: CGPoint.zero)
            path.closeSubpath()
        } else if top && !left {
            // Upper Right
            if rounded {
                path.addArc(center: CGPoint(x: lowerRightOuterCenter.x, y: upperLeftOuterCenter.y), radius: outerRadius, startAngle: CGFloat.radians0, endAngle: CGFloat.radians270, clockwise: true)
            } else {
                path.move(to: CGPoint(x: size.width, y: 0))
            }
            path.addLine(to: CGPoint.zero)
            path.addLine(to: CGPoint(x: 0, y: horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: size.width - verticalWidth - innerRadius, y: horizontalHeight))
                path.addArc(center: CGPoint(x: lowerRightInnerCenter.x, y: upperLeftInnerCenter.y), radius: innerRadius, startAngle: CGFloat.radians270, endAngle: CGFloat.radians0, clockwise: false)
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: 0, y: size.height - closedHeight))
                path.addLine(to: CGPoint(x: 0, y: size.height))
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: size.height))
            }
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.closeSubpath()
        } else if !top && !left {
            // Lower Right
            if rounded {
                path.addArc(center: lowerRightOuterCenter, radius: outerRadius, startAngle: CGFloat.radians0, endAngle: CGFloat.radians90, clockwise: false)
            } else {
                path.move(to: CGPoint(x: size.width, y: size.height))
            }
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height - horizontalHeight))
            if rounded {
                path.addLine(to: CGPoint(x: size.width - verticalWidth - innerRadius, y: size.height - horizontalHeight))
                path.addArc(center: lowerRightInnerCenter, radius: innerRadius, startAngle: CGFloat.radians90, endAngle: CGFloat.radians0, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: size.height - horizontalHeight))
            }
            if closedHeight > 0 {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: closedHeight))
                path.addLine(to: CGPoint(x: 0, y: closedHeight))
                path.addLine(to: CGPoint.zero)
            } else {
                path.addLine(to: CGPoint(x: size.width - verticalWidth, y: 0))
            }
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.closeSubpath()
        }
        
        return path
    }
}
