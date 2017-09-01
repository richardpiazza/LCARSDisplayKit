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

@IBDesignable open class LDKIndicatorView: UIView {
    
    @IBInspectable open var color: UIColor = Interface.theme.primaryDark
    @IBInspectable open var displayValue: String = "000"
    @IBInspectable open var left: Bool = true
    
    public var display: UILabel = UILabel(frame: CGRect.zero)
    public var indicator: LDKButton = LDKButton(frame: CGRect.zero)
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 132, height: 60)
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
    
    public var indicatorWidth: CGFloat {
        return scaledContentSize.width * 0.227272
    }
    
    public var indicatorFrame: CGRect {
        let rect = self.frame
        let width = self.indicatorWidth
        if self.left {
            return CGRect(x: 0, y: 0, width: width, height: rect.height)
        } else {
            return CGRect(x: rect.size.width - width, y: 0, width: width, height: rect.height)
        }
    }
    
    public var displayWidth: CGFloat {
        return self.bounds.width - (indicatorWidth + 8)
    }
    
    public var displayFrame: CGRect {
        let rect = self.frame
        let width = self.displayWidth
        if self.left {
            return CGRect(x: rect.width - width, y: 0, width: width, height: rect.height)
        } else {
            return CGRect(x: 0, y: 0, width: width, height: rect.height)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.clear
        
        self.indicator.frame = indicatorFrame
        self.indicator.graphable.size = indicator.frame.size
        if !self.subviews.contains(self.indicator) {
            self.addSubview(self.indicator)
        }
        
        self.display.frame = displayFrame
        self.display.textColor = self.color
        self.display.text = self.displayValue
        self.display.textAlignment = (self.left) ? .left : .right
        self.display.font = UIFont.Okuda.bold
        if !self.subviews.contains(self.display) {
            self.addSubview(self.display)
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.indicator.frame = indicatorFrame
        self.indicator.graphable.size = indicator.frame.size
        self.display.frame = displayFrame
        self.display.text = displayValue
    }
}
