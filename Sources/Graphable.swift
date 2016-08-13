//===----------------------------------------------------------------------===//
//
// Graphable.swift
//
// Copyright (c) 2015 Richard Piazza
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

import CoreGraphics
import GraphPoint

public protocol Graphable {
    /// The `GraphPoint`s that define the area of the object
    var graphPoints: [GraphPoint] { get }
    /// The `GraphFrame` required to contain all the `GraphPoint`s
    var graphFrame: GraphFrame { get }
    /// A path connecting all `GraphPoint`s
    var path: CGMutablePathRef { get }
}

extension Graphable {
    public var graphPoints: [GraphPoint] {
        return []
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(forGraphPoints: graphPoints)
    }
    
    public var path: CGMutablePathRef {
        return CGPathCreateMutable()
    }
}
