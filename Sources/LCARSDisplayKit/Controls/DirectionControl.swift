#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

public struct DirectionControl: CartesianPlaceable {
    public let direction: Direction
    public let identifier: CartesianIdentifier?

    public init(
        direction: Direction,
        identifier: CartesianIdentifier? = nil
    ) {
        self.direction = direction
        self.identifier = identifier
    }

    public var cartesianPoints: [CartesianPoint] {
        [
            direction.exteriorArc.startingPoint,
            direction.exteriorArc.endingPoint,
        ]
    }

    public var cartesianFrame: CartesianFrame {
        guard let frame = try? CartesianFrame.make(for: direction.exteriorArc, points: cartesianPoints) else {
            return .zero
        }

        let x, y, width, height: Double

        switch direction.cardinal {
        case .up:
            width = frame.width
            height = (direction.exteriorArc.radius - direction.interiorRadius) + frame.height
            x = frame.x
            y = frame.y
        case .left:
            width = (direction.exteriorArc.radius - direction.interiorRadius) + frame.width
            height = frame.height
            x = frame.x
            y = frame.y
        case .right:
            width = (direction.exteriorArc.radius - direction.interiorRadius) + frame.width
            height = frame.height
            x = frame.x - (direction.exteriorArc.radius - direction.interiorRadius)
            y = frame.y
        case .down:
            width = frame.width
            height = (direction.exteriorArc.radius - direction.interiorRadius) + frame.height
            x = frame.x
            y = frame.y + (direction.exteriorArc.radius - direction.interiorRadius)
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
extension DirectionControl: PathConvertible {
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        subpaths?.forEach { path.addPath($0) }
        return path
    }

    public var subpaths: [CGPath]? {
        guard let frame = try? CartesianFrame.make(for: direction.exteriorArc, points: cartesianPoints) else {
            return nil
        }

        var paths: [CGMutablePath] = [CGMutablePath]()
        let center = frame.offsetToCartesianOrigin
        let unit = max(frame.width, frame.height) / 2
        let size = cartesianFrame.size

        switch direction.cardinal {
        case .right:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcX = size.width + center.x - frame.width
            arrowPath.addArc(arc: direction.exteriorArc, center: CartesianPoint(x: arcX, y: center.y), clockwise: false)
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
            arrowPath.addArc(arc: direction.exteriorArc, center: CartesianPoint(x: center.x, y: arcY), clockwise: false)
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
            arrowPath.addArc(arc: direction.exteriorArc, center: center, clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: unit, y: 0))
            arrowPath.addLine(to: CartesianPoint(x: unit, y: size.height))
            arrowPath.closeSubpath()

            arrowPath.move(to: CartesianPoint(x: unit * 1.25, y: unit))
            arrowPath.addLine(to: CartesianPoint(x: unit * 1.75, y: size.height * 0.1))
            arrowPath.addLine(to: CartesianPoint(x: unit * 1.75, y: size.height * 0.9))
            arrowPath.closeSubpath()
            paths.append(arrowPath)

            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: unit * 2, y: 0, width: size.width - (unit * 2.0), height: size.height))
            paths.append(remainingPath)
        case .up:
            let arrowPath: CGMutablePath = CGMutablePath()
            arrowPath.addArc(arc: direction.exteriorArc, center: center, clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: size.width, y: unit))
            arrowPath.addLine(to: CartesianPoint(x: 0, y: unit))
            arrowPath.closeSubpath()

            arrowPath.move(to: CartesianPoint(x: unit, y: unit * 1.25))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.1, y: unit * 1.75))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.9, y: unit * 1.75))
            arrowPath.closeSubpath()

            arrowPath.addRect(Rect(x: 0, y: unit * 2.0, width: size.width, height: unit * 0.5))
            paths.append(arrowPath)

            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: unit * 2.75, width: size.width, height: unit))
            remainingPath.addRect(Rect(x: 0, y: unit * 4.0, width: size.width, height: size.height - (unit * 4.0)))
            paths.append(remainingPath)
        }

        return paths
    }
}
#endif
