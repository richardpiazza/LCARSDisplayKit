/*
*  LDKArc.swift
*
*  Copyright (c) 2015 Richard Piazza
*
*  Permission is hereby granted, free of charge, to any person obtaining a copy
*  of this software and associated documentation files (the "Software"), to deal
*  in the Software without restriction, including without limitation the rights
*  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*  copies of the Software, and to permit persons to whom the Software is
*  furnished to do so, subject to the following conditions:
*
*  The above copyright notice and this permission notice shall be included in all
*  copies or substantial portions of the Software.
*
*  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
*  SOFTWARE.
*
*  Star Trek and related marks are registered trademarks of CBS® / PARAMOUNT® PLC.
*  Original LCARS design credit: Mike Okuda.
*/

import UIKit

public class LDKArc {
    var radius: CGFloat = CGFloat(0)
    var startDegree: CGFloat = CGFloat(0)
    var endDegree: CGFloat = CGFloat(0)

    convenience init(radius: CGFloat, startDegree: CGFloat, endDegree: CGFloat) {
        self.init()
        self.radius = radius
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
    
    public func startPoint() -> LDKAxisPoint {
        return self.dynamicType.axisPointFor(self.radius, degree: self.startDegree)
    }
    
    public func endPoint() -> LDKAxisPoint {
        return self.dynamicType.axisPointFor(self.radius, degree: self.endDegree)
    }
    
    public func points() -> [LDKAxisPoint] {
        return [LDKAxisPoint](arrayLiteral: self.startPoint(), self.endPoint())
    }
    
    public func axisFrame() -> LDKAxisFrame {
        return LDKAxisFrame.axisFrameForPoints(self.points(), radius: self.radius, startDegree: self.startDegree, endDegree: self.endDegree)
    }
    
    /// Calculates the right-angle pivot point between start and end points
    public func rightAnglePivot(axisFrame: LDKAxisFrame) -> LDKAxisPoint {
        let startPoint = self.startPoint()
        let endPoint = self.endPoint()
        let translatedStart = axisFrame.viewPointForAxisPoint(startPoint)
        let translatedEnd = axisFrame.viewPointForAxisPoint(endPoint)
        
        var pivot = CGPointZero
        if self.startDegree < 90 {
            pivot = CGPointMake(translatedEnd.x, translatedStart.y)
        } else if self.startDegree < 180 {
            pivot = CGPointMake(translatedStart.x, translatedEnd.y)
        } else if self.startDegree < 270 {
            pivot = CGPointMake(translatedEnd.x, translatedStart.y)
        } else {
            pivot = CGPointMake(translatedStart.x, translatedEnd.y)
        }
        
        return pivot
    }
    
    /// Calculates the X,Y termination of a radius for the supplied degree
    public static func axisPointFor(radius: CGFloat, degree: CGFloat) -> LDKAxisPoint {
        var axisPoint: LDKAxisPoint = CGPointZero
        
        let angleRight = CGFloat(90)
        var angleRise: CGFloat = CGFloat(0)
        var angleRun: CGFloat = CGFloat(0)
        
        if (degree > 315) {
            angleRise = CGFloat(360) - degree
            angleRun = CGFloat(180) - angleRight - angleRise
            axisPoint.y = (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 270) {
            angleRun = degree - CGFloat(270)
            angleRise = CGFloat(180) - angleRight - angleRun
            axisPoint.y = (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 225) {
            angleRun = CGFloat(270) - degree
            angleRise = CGFloat(180) - angleRight - angleRun
            axisPoint.y = (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 180) {
            angleRise = degree - CGFloat(180)
            angleRun = CGFloat(180) - angleRight - angleRise
            axisPoint.y = (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 135) {
            angleRise = CGFloat(180) - degree
            angleRun = CGFloat(180) - angleRight - angleRise
            axisPoint.y = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 90) {
            angleRun = degree - CGFloat(90)
            angleRise = CGFloat(180) - angleRight - angleRun
            axisPoint.y = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree > 45) {
            angleRun = CGFloat(90) - degree
            angleRise = CGFloat(180) - angleRight - angleRun
            axisPoint.y = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        } else if (degree >= 0) {
            angleRise = degree
            angleRun = CGFloat(180) - angleRight - angleRise
            axisPoint.y = -1.0 * (radius / sin(angleRight.toRadians())) * sin(angleRise.toRadians())
            axisPoint.x = (radius / sin(angleRight.toRadians())) * sin(angleRun.toRadians())
        }
        
        return axisPoint
    }
}
