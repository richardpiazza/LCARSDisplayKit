//===----------------------------------------------------------------------===//
//
// LDKButton.swift
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

@IBDesignable open class LDKButton: UIButton, Tappable {
    static let defaultSize: CGSize = CGSize(width: 144, height: 60)
    
    open var roundedRectangle: RoundedRectangle = RoundedRectangle()
    @IBInspectable open var backgroundImageColor: UIColor = Interface.theme.primaryDark
    @IBInspectable open var roundLeft: Bool {
        get {
            return roundedRectangle.leftRounded
        }
        set {
            roundedRectangle.leftRounded = newValue
        }
    }
    @IBInspectable open var roundRight: Bool {
        get {
            return roundedRectangle.rightRounded
        }
        set {
            roundedRectangle.rightRounded = newValue
        }
    }
    @IBInspectable open var isFrame: Bool {
        get {
            return roundedRectangle.cornersOnly
        }
        set {
            roundedRectangle.cornersOnly = newValue
        }
    }
    
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
    
    func setRoundedRectangle(_ roundedRectangle: RoundedRectangle, withFrame frame: CGRect) {
        self.roundedRectangle = roundedRectangle
        self.frame = frame
    }
    
    // MARK: - Tappable
    open func backgroundImagePath(_ size: CGSize) -> CGMutablePath {
        roundedRectangle.size = size
        return roundedRectangle.path
    }
}
