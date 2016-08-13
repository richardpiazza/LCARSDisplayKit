//===----------------------------------------------------------------------===//
//
// UIImage.swift
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

public protocol Theme {
    var primaryLight: UIColor { get }
    var primaryMedium: UIColor { get }
    var primaryDark: UIColor { get }
    var secondaryLight: UIColor { get }
    var secondaryMedium: UIColor { get }
    var secondaryDark: UIColor { get }
    var tertiaryLight: UIColor { get }
    var tertiaryMedium: UIColor { get }
    var tertiaryDark: UIColor { get }
    var inactive: UIColor { get }
}

public struct Interface {
    public static var theme: Theme = TNG()
    
    public struct TNG: Theme {
        /// A pale-yellow color (Pale Canary)
        ///
        /// HEX #FFFF99
        public var primaryLight: UIColor {
            return UIColor(red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha: 1.0)
        }
        
        /// A medium-yellow color (Golden Tainoi)
        ///
        /// HEX #FFCC66
        public var primaryMedium: UIColor {
            return UIColor(red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha: 1.0)
        }
        
        /// A dense-orange color (Neon Carrot)
        ///
        /// Hex #FF9933
        public var primaryDark: UIColor {
            return UIColor(red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha: 1.0)
        }
        
        /// A pale-purple color (Cosmic)
        ///
        /// Hex #664466;
        public var secondaryLight: UIColor {
            return UIColor(red: 102/255.0, green: 68/255.0, blue: 102/255.0, alpha: 1.0)
        }
        
        /// A medium-purple color (Pastel Violet)
        ///
        /// Hex #CC99CC;
        public var secondaryMedium: UIColor {
            return UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
        }
        
        /// Not-used
        public var secondaryDark: UIColor {
            return UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
        }
        
        /// A pale-blue color (Baby Blue Eyes)
        ///
        /// Hex #99CCFF
        public var tertiaryLight: UIColor {
            return UIColor(red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
        }
        
        /// A rich blue color (Bahama Blue)
        ///
        /// Hex #006699
        public var tertiaryMedium: UIColor {
            return UIColor(red: 0/255.0, green: 102/255.0, blue: 153/255.0, alpha: 1.0)
            
        }
        
        /// A medium-blue color (Mariner)
        ///
        /// Hex #3366CC
        public var tertiaryDark: UIColor {
            return UIColor(red: 51/255.0, green: 102/255.0, blue: 204/255.0, alpha: 1.0)
        }
        
        /// A flat gray color
        ///
        /// Hex #6E6E6E
        public var inactive: UIColor {
            return UIColor(red: 110/255.0, green: 110/255.0, blue: 110/255.0, alpha: 1.0)
        }
    }
}
