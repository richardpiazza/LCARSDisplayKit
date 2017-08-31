//===----------------------------------------------------------------------===//
//
// EdgedCrescent.swift
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
// Star Trek and related marks are registered trademarks of CBS® / PARAMOUNT®
// PLC. Original LCARS design credit: Mike Okuda.
//
//===----------------------------------------------------------------------===//

import CoreGraphics
import GraphPoint

/// An interior `Arc` extended with straight lines to additional points
public struct EdgedCrescent: Graphable {
    public var size: CGSize = CGSize.zero
    public var arc: Arc = Arc()
    public var additionalPoints: [GraphPoint] = [GraphPoint]()
    
    public init() {
    }
    
    public init(arc: Arc, additionalPoints: [GraphPoint]) {
        self.init()
        self.arc = arc
        self.additionalPoints = additionalPoints
    }
    
    // MARK: - Graphable
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: arc.graphPoints)
        points.append(contentsOf: additionalPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
    }
    
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        let gf = graphFrame
        let offset = gf.graphOriginOffset
        
        path.addArc(center: offset, radius: arc.radius, startAngle: arc.startDegree.radians, endAngle: arc.endDegree.radians, clockwise: false)
        
        for point in Array(additionalPoints.reversed()) {
            let translatedPoint = gf.boundedPoint(graphPoint: point)
            path.addLine(to: translatedPoint)
        }
        
        path.closeSubpath()
        
        return path
    }
}
