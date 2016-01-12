//===----------------------------------------------------------------------===//
//
// UIColor.swift
//
// Copyright (c) 2016 Richard Piazza
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
//===----------------------------------------------------------------------===//

import UIKit

public extension UIColor {
    /// A pale-yellow color; Hex #FFFF99
    static func paleCanary() -> UIColor {
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha: 1.0)
    }
    
    /// A medium-yellow color; Hex #FFCC5C
    static func goldenTainoi() -> UIColor {
        return UIColor(red: 255/255.0, green: 202/255.0, blue: 92/255.0, alpha: 1.0)
    }
    
    /// A medium-yellow color; Hex #FFCC66; Closer non-named LCARS variant
    static func goldenTainoiLCARS() -> UIColor {
        return UIColor(red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A dense-orange color; Hex #FF9933
    static func neonCarrot() -> UIColor {
        return UIColor(red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha: 1.0)
    }
    
    /// A pale-purple color; Hex #664466
    static func cosmic() -> UIColor {
        return UIColor(red: 118/255.0, green: 57/255.0, blue: 93/255.0, alpha: 1.0)
    }
    
    /// A pale-purple color; Hex #664466; Closer non-named LCARS variant
    static func cosmicLCARS() -> UIColor {
        return UIColor(red: 102/255.0, green: 68/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A medium-purple color; Hex #CB99C9
    static func pastelViolet() -> UIColor {
        return UIColor(red: 203/255.0, green: 153/255.0, blue: 201/255.0, alpha: 1.0)
    }
    
    /// A medium-purple color; Hex #CC99CC; Closer non-named LCARS variant
    static func pastelVioletLCARS() -> UIColor {
        return UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A pale-blue color; Hex #A1CAF1
    static func babyBlueEyes() -> UIColor {
        return UIColor(red: 161/255.0, green: 202/255.0, blue: 241/255.0, alpha: 1.0)
    }
    
    /// A pale-blue color; Hex #99CCFF; Closer non-named LCARS variant
    static func babyBlueEyesLCARS() -> UIColor {
        return UIColor(red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
    }
    
    /// A medium-blue color; Hex #286ACD
    static func mariner() -> UIColor {
        return UIColor(red: 40/255.0, green: 106/255.0, blue: 205/255.0, alpha: 1.0)
    }
    
    /// A medium-blue color; Hex #3366CC; Closer non-named LCARS variant
    static func marinerLCARS() -> UIColor {
        return UIColor(red: 51/255.0, green: 102/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A rich blue color; Hex #026395
    static func bahamaBlue() -> UIColor {
        return UIColor(red: 2/255.0, green: 99/255.0, blue: 149/255.0, alpha: 1.0)
    }
    
    /// A rich blue color; Hex #006699; Close non-named LCARS variant
    static func bahamaBlueLCARS() -> UIColor {
        return UIColor(red: 0/255.0, green: 102/255.0, blue: 153/255.0, alpha: 1.0)
    }
    
    /// A flat gray color; Hex #6D6C6C
    static func doveGray() -> UIColor {
        return UIColor(red: 109/255.0, green: 108/255.0, blue: 108/255.0, alpha: 1.0)
    }
    
    /// A flat gray color; Hex #6E6E6E; Close non-named LCARS variant
    static func doveGrayLCARS() -> UIColor {
        return UIColor(red: 110/255.0, green: 110/255.0, blue: 110/255.0, alpha: 1.0)
    }
}
