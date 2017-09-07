//===----------------------------------------------------------------------===//
//
// Button.swift
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

/// Base button class
open class Button: UIButton, Tappable {
    open var rectangle: RoundedRectangle = RoundedRectangle()
    open var graphable: Graphable {
        get {
            return rectangle
        }
        set {
            if let type = newValue as? RoundedRectangle {
                rectangle = type
            }
        }
    }
    open var behavior: Behavior? {
        willSet {
            behavior?.end(self)
        }
        didSet {
            behavior?.begin(self)
        }
    }
    
    @IBInspectable open var color: UIColor = Interface.theme.inactive
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        graphable.size = frame.size
        self.titleLabel?.font = Interface.theme.body
        self.setTitleColor(UIColor.black, for: UIControlState())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.font = Interface.theme.body
        self.setTitleColor(UIColor.black, for: UIControlState())
    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 144, height: 60)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        graphable.size = rect.size
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.image(context), for: UIControlState())
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return path.contains(point)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        Interface.theme.beep()
        
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
    open var colors: [UIColor]? {
        return nil
    }
    
    open var touchedColors: [UIColor]? {
        return nil
    }
}
