//===----------------------------------------------------------------------===//
//
// DPad.swift
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

/// A range following the CoreGraphics radial coordinates.
public typealias DegreeRange = (start: CGFloat, end: CGFloat)

/// A collection of `DegreeRange` used in drawing the DPad
public struct DPad {
    public struct Crux {
        public static let down = DegreeRange(CGFloat(80), CGFloat(100))//80.5,99.5
        public static let left = DegreeRange(CGFloat(170), CGFloat(190))//170.5,189.5
        public static let up = DegreeRange(CGFloat(260), CGFloat(280))//260.5,279.5
        public static let right = DegreeRange(CGFloat(350), CGFloat(10))//350.5,9.5
        public static let sector01 = DegreeRange(CGFloat(12), CGFloat(78))//11,79
        public static let sector02 = DegreeRange(CGFloat(102), CGFloat(168))//101,169
        public static let sector03 = DegreeRange(CGFloat(192), CGFloat(258))//191,259
        public static let sector04 = DegreeRange(CGFloat(282), CGFloat(348))//281,349
    }
    
    public struct Ring {
        public static let sector01 = DegreeRange(CGFloat(10.5), CGFloat(79.5))
        public static let sector02 = DegreeRange(CGFloat(99.5), CGFloat(169.5))
        public static let sector03 = DegreeRange(CGFloat(189.5), CGFloat(259.5))
        public static let sector04 = DegreeRange(CGFloat(280.5), CGFloat(350.5))
        public static let arc01 = DegreeRange(CGFloat(9.5), CGFloat(25.5))
        public static let arc02 = DegreeRange(CGFloat(27.5), CGFloat(43.5))
        public static let arc03 = DegreeRange(CGFloat(45.5), CGFloat(61.5))
        public static let arc04 = DegreeRange(CGFloat(63.5), CGFloat(79.5))
        public static let arc05 = DegreeRange(CGFloat(81.5), CGFloat(97.5))
        public static let arc06 = DegreeRange(CGFloat(99.5), CGFloat(115.5))
        public static let arc07 = DegreeRange(CGFloat(117.5), CGFloat(133.5))
        public static let arc08 = DegreeRange(CGFloat(135.5), CGFloat(151.5))
        public static let arc09 = DegreeRange(CGFloat(153.5), CGFloat(169.5))
        public static let arc10 = DegreeRange(CGFloat(171.5), CGFloat(187.5))
        public static let arc11 = DegreeRange(CGFloat(189.5), CGFloat(205.5))
        public static let arc12 = DegreeRange(CGFloat(207.5), CGFloat(223.5))
        public static let arc13 = DegreeRange(CGFloat(225.5), CGFloat(241.5))
        public static let arc14 = DegreeRange(CGFloat(243.5), CGFloat(259.5))
        public static let arc15 = DegreeRange(CGFloat(261.5), CGFloat(278.5))
        public static let arc16 = DegreeRange(CGFloat(280.5), CGFloat(296.5))
        public static let arc17 = DegreeRange(CGFloat(298.5), CGFloat(314.5))
        public static let arc18 = DegreeRange(CGFloat(316.5), CGFloat(332.5))
        public static let arc19 = DegreeRange(CGFloat(334.5), CGFloat(350.5))
        public static let arc20 = DegreeRange(CGFloat(352.5), CGFloat(8.5))
    }
}
