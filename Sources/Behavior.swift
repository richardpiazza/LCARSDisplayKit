//===----------------------------------------------------------------------===//
//
// Behavior.swift
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

public enum Behavior {
    case pulsate
    
    internal struct Timers {
        static var action: Timer?
        static var inverseAction: Timer?
    }
    
    public func begin(_ view: UIView) {
        switch self {
        case .pulsate:
            Timers.action = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true, block: { (timer) in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseOut], animations: {
                    view.alpha = 0.0
                }, completion: nil)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                Timers.inverseAction = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true, block: { (timer) in
                    UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn], animations: {
                        view.alpha = 1.0
                    }, completion: nil)
                })
            })
            break
        }
    }
    
    public func end(_ view: UIView) {
        switch self {
        case .pulsate:
            Timers.inverseAction?.invalidate()
            Timers.inverseAction = nil
            Timers.action?.invalidate()
            Timers.action = nil
            view.alpha = 1.0
            break
        }
    }
}
