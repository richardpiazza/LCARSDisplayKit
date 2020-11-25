import GraphPoint
#if canImport(CoreGraphics)
import CoreGraphics
#endif

public struct Direction {
    
    public enum Cardinal: Degree {
        case right = 0.0
        case down = 90.0
        case left = 180.0
        case up = 270.0
    }
    
    public var cardinal: Cardinal
    public var arc: Arc
    
    public var size: CGSize = CGSize()
    
    public init(_ cardinal: Cardinal = .right, arc: Arc = Arc()) {
        self.cardinal = cardinal
        self.arc = arc
    }
}

extension Direction: ExpressibleByCartesianPoints {
    public var cartesianPoints: [CartesianPoint] {
        return []
    }
    
    public var cartesianFrame: CartesianFrame {
        return (try? CartesianFrame.make(for: arc.startingPoint, point2: arc.endingPoint, radius: arc.radius)) ?? .zero
    }
}

#if canImport(CoreGraphics)
extension Direction: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        
        if let subpaths = self.subpaths {
            for p in subpaths {
                path.addPath(p)
            }
        }
        
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        var paths: [CGMutablePath] = [CGMutablePath]()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let unit = min(size.width, size.height) / 2
        
        switch cardinal {
        case .right:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcX = Float(size.width) + center.x - frame.width
            arrowPath.addArc(center: CartesianPoint(x: arcX, y: center.y), radius: arc.radius, startAngle: arc.startDegree, endAngle: arc.endDegree, clockwise: false)
            arrowPath.addLine(to: CGPoint(x: size.width - unit, y: size.height))
            arrowPath.addLine(to: CGPoint(x: size.width - unit, y: 0))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CGPoint(x: size.width - (unit * 1.25), y: unit))
            arrowPath.addLine(to: CGPoint(x: size.width - (unit * 1.75), y: size.height * 0.1))
            arrowPath.addLine(to: CGPoint(x: size.width - (unit * 1.75), y: size.height * 0.9))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(CGRect(x: 0, y: 0, width: size.width - (unit * 2.0), height: size.height))
            paths.append(remainingPath)
        case .down:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcY = Float(size.height) + center.y - frame.height
            arrowPath.addArc(center: CartesianPoint(x: center.x, y: arcY), radius: arc.radius, startAngle: arc.startDegree, endAngle: arc.endDegree, clockwise: false)
            arrowPath.addLine(to: CGPoint(x: 0, y: size.height - unit))
            arrowPath.addLine(to: CGPoint(x: size.width, y: size.height - unit))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CGPoint(x: unit, y: size.height - (unit * 1.25)))
            arrowPath.addLine(to: CGPoint(x: size.width * 0.1, y: size.height - (unit * 1.75)))
            arrowPath.addLine(to: CGPoint(x: size.width * 0.9, y: size.height - (unit * 1.75)))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(CGRect(x: 0, y: 0, width: size.width, height: size.height - (unit * 2)))
            paths.append(remainingPath)
        case .left:
            let arrowPath: CGMutablePath = CGMutablePath()
            arrowPath.addArc(center: center, radius: arc.radius, startAngle: arc.startDegree, endAngle: arc.endDegree, clockwise: false)
            arrowPath.addLine(to: CGPoint(x: unit, y: 0))
            arrowPath.addLine(to: CGPoint(x: unit, y: size.height))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CGPoint(x: unit * 1.25, y: unit))
            arrowPath.addLine(to: CGPoint(x: unit * 1.75, y: size.height * 0.1))
            arrowPath.addLine(to: CGPoint(x: unit * 1.75, y: size.height * 0.9))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(CGRect(x: (unit * 2), y: 0, width: size.width - (unit * 2.0), height: size.height))
            paths.append(remainingPath)
        case .up:
            let arrowPath: CGMutablePath = CGMutablePath()
            arrowPath.addArc(center: center, radius: arc.radius, startAngle: arc.startDegree, endAngle: arc.endDegree, clockwise: false)
            arrowPath.addLine(to: CGPoint(x: size.width, y: unit))
            arrowPath.addLine(to: CGPoint(x: 0, y: unit))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CGPoint(x: unit, y: unit * 1.25))
            arrowPath.addLine(to: CGPoint(x: size.width * 0.1, y: unit * 1.75))
            arrowPath.addLine(to: CGPoint(x: size.width * 0.9, y: unit * 1.75))
            arrowPath.closeSubpath()
            
            arrowPath.addRect(CGRect(x: 0, y: (unit * 2.0), width: size.width, height: (unit * 0.5)))
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(CGRect(x: 0, y: (unit * 2.75), width: size.width, height: unit))
            remainingPath.addRect(CGRect(x: 0, y: (unit * 4.0), width: size.width, height: size.height - (unit * 4.0)))
            paths.append(remainingPath)
        }
        
        return paths
    }
}

extension Direction: Graphable {
    
}
#endif
