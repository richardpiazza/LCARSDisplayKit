//===----------------------------------------------------------------------===//
//
// UIButton.swift
//
// Copyright (c) 2016 Richard Piazza
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
//===----------------------------------------------------------------------===//

import UIKit

extension UIButton {
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let tappableSelf = self as? Tappable else {
            return
        }
        
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(tappableSelf.backgroundImage(context, size: rect.size), for: UIControlState())
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let tappableSelf = (self as? Tappable) else {
            return super.point(inside: point, with: event)
        }
        
        let path = tappableSelf.backgroundImagePath(bounds.size)
        return path.contains(point)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        Audio.engine.playBeep()
        
        if let tappableSelf = self as? Tappable {
            let size = self.bounds.size
            UIGraphicsBeginImageContext(size)
            let context = UIGraphicsGetCurrentContext()
            self.setBackgroundImage(tappableSelf.touchImage(context, size: size), for: UIControlState())
            UIGraphicsEndImageContext()
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let tappableSelf = self as? Tappable {
            let size = self.bounds.size
            UIGraphicsBeginImageContext(size)
            let context = UIGraphicsGetCurrentContext()
            self.setBackgroundImage(tappableSelf.backgroundImage(context, size: size), for: UIControlState())
            UIGraphicsEndImageContext()
        }
        
        super.touchesEnded(touches, with: event)
    }
}
