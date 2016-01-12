//===----------------------------------------------------------------------===//
//
// LDKIndicatorView.swift
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

@IBDesignable public class LDKIndicatorView: UIView {
    static let defaultSize: CGSize = CGSizeMake(132, 60)
    
    @IBInspectable public var backgroundImageColor: UIColor = UIColor.neonCarrot()
    @IBInspectable public var displayValue: String = "000"
    @IBInspectable public var left: Bool = true
    internal var indicator: UIImageView = UIImageView(frame: CGRectZero)
    internal var valueLabel: UILabel = UILabel(frame: CGRectZero)
    internal var indicatorImage: UIImage?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.clearColor()
        
        let indicatorFrame = self.indicatorFrame(self.frame)
        UIGraphicsBeginImageContextWithOptions(indicatorFrame.size, false, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()
        self.indicatorImage = self.backgroundImage(context, size: indicatorFrame.size)
        UIGraphicsEndImageContext()
        
        self.indicator.frame = indicatorFrame
        self.indicator.image = self.indicatorImage
        self.indicator.backgroundColor = UIColor.purpleColor()
        if !self.subviews.contains(self.indicator) {
            self.addSubview(self.indicator)
        }
        
        let valueLabelFrame = self.displayValueFrame(self.frame)
        self.valueLabel.frame = valueLabelFrame
        self.valueLabel.textColor = self.backgroundImageColor
        self.valueLabel.text = self.displayValue
        self.valueLabel.textAlignment = (self.left) ? .Left : .Right
        if !self.subviews.contains(self.valueLabel) {
            self.addSubview(self.valueLabel)
        }
    }
    
    func scaleOfDefaultSize(actualSize: CGSize) -> GraphMultiplier {
        return GraphMultiplier(width: CGFloat(actualSize.width / LDKIndicatorView.defaultSize.width), height: CGFloat(actualSize.height / LDKIndicatorView.defaultSize.height))
    }
    
    func indicatorWidth(size: CGSize) -> CGFloat {
        let defaultWidth = LDKIndicatorView.defaultSize.width * 0.227272
        let scale = self.scaleOfDefaultSize(size).width
        return defaultWidth * scale
    }
    
    func indicatorFrame(rect: CGRect) -> CGRect {
        let indicatorWidth = self.indicatorWidth(rect.size)
        if self.left {
            return CGRectMake(0, 0, indicatorWidth, rect.height)
        }
        
        return CGRectMake(rect.size.width - indicatorWidth, 0, indicatorWidth, rect.height)
    }
    
    func displayValueWidth(size: CGSize) -> CGFloat {
        let indicatorWidth = self.indicatorWidth(size)
        return size.width - indicatorWidth - 8
    }
    
    func displayValueFrame(rect: CGRect) -> CGRect {
        let displayValueWidth = self.displayValueWidth(rect.size)
        if self.left {
            return CGRectMake(rect.width - displayValueWidth, 0, displayValueWidth, rect.height)
        }
        
        return CGRectMake(0, 0, displayValueWidth, rect.height)
    }
}

// MARK: - Tappable
extension LDKIndicatorView: Tappable {
    public func backgroundImagePath(size: CGSize) -> CGMutablePathRef {
        let rr = RoundedRectangle(size: size, leftRounded: false, rightRounded: false, cornersOnly: false)
        return rr.path
//        return LDKButton.buttonPathWithSize(size, roundLeft: false, roundRight: false, isFrame: false)
    }
}
