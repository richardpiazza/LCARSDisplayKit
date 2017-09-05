//===----------------------------------------------------------------------===//
//
// Crescent.swift
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

/// Two `Arc`s connected by stright lines at their end points.
public struct Crescent: Graphable {
    public var size: CGSize = CGSize.zero
    public var innerArc: Arc = Arc()
    public var outerArc: Arc = Arc()
    
    public var innerRadius: CGFloat {
        return min(innerArc.radius, outerArc.radius)
    }
    
    public var outerRadius: CGFloat {
        return max(outerArc.radius, innerArc.radius)
    }
    
    public var startDegree: CGFloat {
        return min(innerArc.startDegree, outerArc.startDegree)
    }
    
    public var endDegree: CGFloat {
        return max(innerArc.endDegree, outerArc.endDegree)
    }
    
    public var boundStart: Bool = false {
        didSet {
            if boundStart {
                outerArc.boundedStart = innerArc.startPoint
            } else {
                outerArc.boundedStart = nil
            }
        }
    }
    
    public var boundEnd: Bool = false {
        didSet {
            if boundEnd {
                outerArc.boundedEnd = innerArc.endPoint
            } else {
                outerArc.boundedEnd = nil
            }
        }
    }
    
    public init() {}
    public init(innerArc: Arc, outerArc: Arc, boundedStart: Bool = false, boundedEnd: Bool = false) {
        self.init()
        self.innerArc = innerArc
        self.outerArc = outerArc
        if boundedStart {
            self.outerArc.boundedStart = self.innerArc.startPoint
        }
        if boundedEnd {
            self.outerArc.boundedEnd = self.innerArc.endPoint
        }
    }
    public init(innerRadius: CGFloat, outerRadius: CGFloat, startDegree: CGFloat, endDegree: CGFloat, boundedStart: Bool = false, boundedEnd: Bool = false) {
        let innerArc = Arc(radius: innerRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = Arc(radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
        self.init(innerArc: innerArc, outerArc: outerArc, boundedStart: boundedStart, boundedEnd: boundedEnd)
    }
    
    // MARK: - Graphable
    public var graphPoints: [GraphPoint] {
        var points = [GraphPoint]()
        points.append(contentsOf: innerArc.graphPoints)
        points.append(contentsOf: outerArc.graphPoints)
        return points
    }
    
    public var graphFrame: GraphFrame {
        return GraphFrame.graphFrame(graphPoints: graphPoints, radius: outerRadius, startDegree: startDegree, endDegree: endDegree)
    }
    
    public var path: CGMutablePath {
        let path = CGMutablePath()
        
        let gf = graphFrame
        let offset = gf.graphOriginOffset
        let translatedEnd = gf.boundedPoint(graphPoint: outerArc.endPoint)
        
        path.addArc(center: offset, radius: innerArc.radius, startAngle: innerArc.startDegree.radians, endAngle: innerArc.endDegree.radians, clockwise: false)
        path.addLine(to: translatedEnd)
        path.addArc(center: offset, radius: outerArc.radius, startAngle: outerArc.endDegree.radians, endAngle: outerArc.startDegree.radians, clockwise: true)
        path.closeSubpath()
        
        return path
    }
}
