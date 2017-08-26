//===----------------------------------------------------------------------===//
//
// LDKIndicatorView.swift
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

@IBDesignable open class LDKIndicatorView: UIView, Tappable {
    static let defaultSize: CGSize = CGSize(width: 132, height: 60)
    
    @IBInspectable open var backgroundImageColor: UIColor = Interface.theme.primaryDark
    @IBInspectable open var displayValue: String = "000"
    @IBInspectable open var left: Bool = true
    internal var indicator: UIImageView = UIImageView(frame: CGRect.zero)
    internal var valueLabel: UILabel = UILabel(frame: CGRect.zero)
    internal var indicatorImage: UIImage?
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.clear
        
        let indicatorFrame = self.indicatorFrame(self.frame)
        UIGraphicsBeginImageContextWithOptions(indicatorFrame.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        self.indicatorImage = self.backgroundImage(context, size: indicatorFrame.size)
        UIGraphicsEndImageContext()
        
        self.indicator.frame = indicatorFrame
        self.indicator.image = self.indicatorImage
        self.indicator.backgroundColor = UIColor.purple
        if !self.subviews.contains(self.indicator) {
            self.addSubview(self.indicator)
        }
        
        let valueLabelFrame = self.displayValueFrame(self.frame)
        self.valueLabel.frame = valueLabelFrame
        self.valueLabel.textColor = self.backgroundImageColor
        self.valueLabel.text = self.displayValue
        self.valueLabel.textAlignment = (self.left) ? .left : .right
        if !self.subviews.contains(self.valueLabel) {
            self.addSubview(self.valueLabel)
        }
    }
    
    func scaleOfDefaultSize(_ actualSize: CGSize) -> GraphMultiplier {
        return GraphMultiplier(width: CGFloat(actualSize.width / LDKIndicatorView.defaultSize.width), height: CGFloat(actualSize.height / LDKIndicatorView.defaultSize.height))
    }
    
    func indicatorWidth(_ size: CGSize) -> CGFloat {
        let defaultWidth = LDKIndicatorView.defaultSize.width * 0.227272
        let scale = self.scaleOfDefaultSize(size).width
        return defaultWidth * scale
    }
    
    func indicatorFrame(_ rect: CGRect) -> CGRect {
        let indicatorWidth = self.indicatorWidth(rect.size)
        if self.left {
            return CGRect(x: 0, y: 0, width: indicatorWidth, height: rect.height)
        }
        
        return CGRect(x: rect.size.width - indicatorWidth, y: 0, width: indicatorWidth, height: rect.height)
    }
    
    func displayValueWidth(_ size: CGSize) -> CGFloat {
        let indicatorWidth = self.indicatorWidth(size)
        return size.width - indicatorWidth - 8
    }
    
    func displayValueFrame(_ rect: CGRect) -> CGRect {
        let displayValueWidth = self.displayValueWidth(rect.size)
        if self.left {
            return CGRect(x: rect.width - displayValueWidth, y: 0, width: displayValueWidth, height: rect.height)
        }
        
        return CGRect(x: 0, y: 0, width: displayValueWidth, height: rect.height)
    }
    
    // MARK: - Tappable
    open func backgroundImagePath(_ size: CGSize) -> CGMutablePath {
        let rr = RoundedRectangle(size: size, leftRounded: false, rightRounded: false, cornersOnly: false)
        return rr.path
    }
}
