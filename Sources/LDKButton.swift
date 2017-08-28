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
    
    open var rectangle: RoundedRectangle = RoundedRectangle()
    open var graphable: Graphable {
        get {
            return rectangle
        }
        set {}
    }
    
    @IBInspectable open var roundLeft: Bool {
        get {
            return rectangle.leftRounded
        }
        set {
            rectangle.leftRounded = newValue
        }
    }
    @IBInspectable open var roundRight: Bool {
        get {
            return rectangle.rightRounded
        }
        set {
            rectangle.rightRounded = newValue
        }
    }
    @IBInspectable open var isFrame: Bool {
        get {
            return rectangle.cornersOnly
        }
        set {
            rectangle.cornersOnly = newValue
        }
    }
    @IBInspectable open var color: UIColor = Interface.theme.random()
    @IBInspectable lazy open var touchedColor: UIColor = {
        [unowned self] in
        return self.color.adaptingSaturation(by: 0.8)
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        graphable.size = frame.size
        rectangle.size = frame.size
        self.titleLabel?.font = UIFont.Okuda.regular
        self.setTitleColor(UIColor.black, for: UIControlState())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.font = UIFont.Okuda.regular
        self.setTitleColor(UIColor.black, for: UIControlState())
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        graphable.size = rect.size
        rectangle.size = rect.size
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.image(context), for: UIControlState())
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return path.contains(point)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        Audio.engine.playBeep()
        
        let size = self.bounds.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.touchedImage(context), for: UIControlState())
        UIGraphicsEndImageContext()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let size = self.bounds.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.image(context), for: UIControlState())
        UIGraphicsEndImageContext()
        
        super.touchesEnded(touches, with: event)
    }
    
    // - MARK: Tappable
    open var path: CGMutablePath {
        return graphable.path
    }
    
    open func image(_ context: CGContext?) -> UIImage? {
        if let paths = self.subpaths, let colors = self.colors {
            return UIImage.image(with: paths, colors: colors, size: graphable.size, context: context)
        }
        
        return UIImage.image(with: path, fillColor: color, context: context)
    }
    
    open func touchedImage(_ context: CGContext?) -> UIImage? {
        if let paths = self.subpaths, let colors = touchedColors {
            return UIImage.image(with: paths, colors: colors, size: graphable.size, context: context)
        }
        
        return UIImage.image(with: path, fillColor: touchedColor, context: context)
    }
    
    open var subpaths: [CGMutablePath]? {
        return graphable.subpaths
    }
    
    open var colors: [UIColor]? {
        return nil
    }
    
    open var touchedColors: [UIColor]? {
        return nil
    }
}
