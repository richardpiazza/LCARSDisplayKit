#if (os(macOS) || os(iOS) || os(tvOS) || os(watchOS))

import CoreGraphics
import GraphPoint

public struct Direction: Graphable {
    public enum Cardinal {
        case up
        case right
        case down
        case left
        
        public var degree: CGFloat {
            switch self {
            case .right: return CGFloat(0)
            case .down: return CGFloat(90)
            case .left: return CGFloat(180)
            case .up: return CGFloat(270)
            }
        }
        
        public init(degreeValue: CGFloat) {
            if degreeValue == Cardinal.up.degree {
                self = .up
            } else if degreeValue == Cardinal.left.degree {
                self = .left
            } else if degreeValue == Cardinal.down.degree {
                self = .down
            } else {
                self = .right
            }
        }
    }
    
    public var arc: Arc = Arc()
    public var cardinal: Cardinal = .up
    public var size: CGSize = CGSize()
    
    public init() {}
    public init(with arc: Arc, cardinal: Cardinal) {
        self.arc = arc
        self.cardinal = cardinal
    }
    
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
        
        let graphFrame = GraphFrame.graphFrame(graphPoints: arc.graphPoints, radius: arc.radius, startDegree: arc.startDegree, endDegree: arc.endDegree)
        let offset = graphFrame.graphOriginOffset
        let unit = min(size.width, size.height) / 2
        
        switch cardinal {
        case .right:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcX = size.width + offset.x - graphFrame.width
            arrowPath.addArc(center: CGPoint(x: arcX, y: offset.y), radius: arc.radius, startAngle: arc.startDegree.radians, endAngle: arc.endDegree.radians, clockwise: false)
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
            arrowPath.addArc(center: CGPoint(x: offset.x, y: size.height + offset.y - graphFrame.height), radius: arc.radius, startAngle: arc.startDegree.radians, endAngle: arc.endDegree.radians, clockwise: false)
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
            arrowPath.addArc(center: offset, radius: arc.radius, startAngle: arc.startDegree.radians, endAngle: arc.endDegree.radians, clockwise: false)
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
            arrowPath.addArc(center: offset, radius: arc.radius, startAngle: arc.startDegree.radians, endAngle: arc.endDegree.radians, clockwise: false)
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

#endif
