#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct Direction {
    public typealias Cardinal = DPad.CardinalDirection
    
    public var cardinal: Cardinal
    public var interiorRadius: Radius
    public var exteriorArc: Arc
    
    public init() {
        cardinal = .right
        interiorRadius = 0.0
        exteriorArc = Arc()
    }
    
    public init(_ cardinal: Cardinal, interiorRadius: Radius = 0.0, exteriorArc: Arc = Arc()) {
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        self.exteriorArc = exteriorArc
    }
    
    public init(_ cardinal: Cardinal, interiorRadius: Radius = 0.0, exteriorRadius: Radius = 0.0) {
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        exteriorArc = Arc(radius: exteriorRadius, cardinalDirection: cardinal)
    }
}

extension Direction: CartesianPointConvertible {
    public var cartesianPoints: [CartesianPoint] {
        [exteriorArc.startingPoint, exteriorArc.endingPoint]
    }
    
    public var exteriorArcFrame: CartesianFrame {
        (try? CartesianFrame.make(for: exteriorArc, points: cartesianPoints)) ?? .zero
    }

    public var cartesianFrame: CartesianFrame {
        guard let frame = try? CartesianFrame.make(for: exteriorArc, points: cartesianPoints) else {
            return .zero
        }
        
        let x, y, width, height: CGFloat
        
        #warning("Calculations are slightly off. Width affecting x; Height affecting y.")
        switch cardinal {
        case .up:
            width = max(frame.width, frame.height)
            height = (frame.y - interiorRadius) + frame.height
            x = frame.x
            y = frame.y
        case .left:
            width = (abs(frame.x) - interiorRadius) + frame.width
            height = max(frame.width, frame.height)
            x = frame.x
            y = frame.y
        case .right:
            width = (frame.x - interiorRadius) + frame.width
            height = max(frame.width, frame.height)
            x = frame.x - (width - frame.width)
            y = frame.y
        case .down:
            width = max(frame.width, frame.height)
            height = (abs(frame.y) - interiorRadius) + frame.height
            x = frame.x
            y = frame.y + (height - frame.height)
        }
        
        return CartesianFrame(
            x: x,
            y: y,
            width: width,
            height: height
        )
    }
}

#if canImport(CoreGraphics)
extension Direction: PathConvertible {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        subpaths?.forEach { path.addPath($0) }
        return path
    }
    
    public var subpaths: [CGPath]? {
        var paths: [CGMutablePath] = [CGMutablePath]()
        
        let frame = exteriorArcFrame
        let center = frame.offsetToCartesianOrigin
        let unit = max(frame.width, frame.height) / 2
        let size = cartesianFrame.size
        
        switch cardinal {
        case .right:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcX = size.width + center.x - frame.width
            arrowPath.addArc(arc: exteriorArc, center: CartesianPoint(x: arcX, y: center.y), clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: size.width - unit, y: size.height))
            arrowPath.addLine(to: CartesianPoint(x: size.width - unit, y: 0))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: size.width - (unit * 1.25), y: unit))
            arrowPath.addLine(to: CartesianPoint(x: size.width - (unit * 1.75), y: size.height * 0.1))
            arrowPath.addLine(to: CartesianPoint(x: size.width - (unit * 1.75), y: size.height * 0.9))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: 0, width: size.width - (unit * 2.0), height: size.height))
            paths.append(remainingPath)
        case .down:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcY = size.height + center.y - frame.height
            arrowPath.addArc(arc: exteriorArc, center: CartesianPoint(x: center.x, y: arcY), clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: 0.0, y: size.height - unit))
            arrowPath.addLine(to: CartesianPoint(x: size.width, y: size.height - unit))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: unit, y: size.height - (unit * 1.25)))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.1, y: size.height - (unit * 1.75)))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.9, y: size.height - (unit * 1.75)))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: 0, width: size.width, height: size.height - (unit * 2)))
            paths.append(remainingPath)
        case .left:
            let arrowPath: CGMutablePath = CGMutablePath()
            arrowPath.addArc(arc: exteriorArc, center: center, clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: unit, y: 0))
            arrowPath.addLine(to: CartesianPoint(x: unit, y: size.height))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: unit * 1.25, y: unit))
            arrowPath.addLine(to: CartesianPoint(x: unit * 1.75, y: size.height * 0.1))
            arrowPath.addLine(to: CartesianPoint(x: unit * 1.75, y: size.height * 0.9))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: (unit * 2), y: 0, width: size.width - (unit * 2.0), height: size.height))
            paths.append(remainingPath)
        case .up:
            let arrowPath: CGMutablePath = CGMutablePath()
            arrowPath.addArc(arc: exteriorArc, center: center, clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: size.width, y: unit))
            arrowPath.addLine(to: CartesianPoint(x: 0, y: unit))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: unit, y: unit * 1.25))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.1, y: unit * 1.75))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.9, y: unit * 1.75))
            arrowPath.closeSubpath()
            
            arrowPath.addRect(Rect(x: 0, y: (unit * 2.0), width: size.width, height: (unit * 0.5)))
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: (unit * 2.75), width: size.width, height: unit))
            remainingPath.addRect(Rect(x: 0, y: (unit * 4.0), width: size.width, height: size.height - (unit * 4.0)))
            paths.append(remainingPath)
        }
        
        return paths
    }
}
#endif
