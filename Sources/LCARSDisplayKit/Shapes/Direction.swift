#if canImport(CoreGraphics)
import CoreGraphics
#endif
import GraphPoint
import Swift2D

/// A shape representing a cardinal direction in a control cluster.
public struct Direction: Hashable, Sendable {

    public enum Cardinal: CartesianShapeIdentifier, Hashable, Sendable, CaseIterable {
        case down
        case left
        case right
        case up

        public var start: Degree {
            switch self {
            case .down: 80
            case .left: 170
            case .right: 350
            case .up: 260
            }
        }

        public var end: Degree {
            switch self {
            case .down: 100
            case .left: 190
            case .right: 10
            case .up: 280
            }
        }
    }

    /// Initialize a `Direction` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - cardinal: The cardinal direction represented by this shape.
    ///   - interiorRadius:
    ///   - exteriorArc:
    public let identifier: CartesianShapeIdentifier?
    public let cardinal: Cardinal
    public let interiorRadius: Radius
    public let exteriorArc: Arc

    public init(
        identifier: CartesianShapeIdentifier? = nil,
        cardinal: Cardinal = .up,
        interiorRadius: Radius = 0.0,
        exteriorArc: Arc = Arc()
    ) {
        self.identifier = identifier
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        self.exteriorArc = exteriorArc
    }

    /// Initialize a `Direction` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianShapeIdentifier`.
    ///   - cardinal: The cardinal direction represented by this shape.
    ///   - interiorRadius:
    ///   - exteriorRadius: Radius uses to construct the `exteriorArc`.
    public init(
        identifier: CartesianShapeIdentifier? = nil,
        cardinal: Cardinal = .up,
        interiorRadius: Radius,
        exteriorRadius: Radius
    ) {
        self.identifier = identifier
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        exteriorArc = Arc(
            radius: exteriorRadius,
            startingDegree: cardinal.start,
            endingDegree: cardinal.end
        )
    }
}

extension Direction: CartesianShape {
    public var cartesianPoints: [CartesianPoint] {
        [
            exteriorArc.startingPoint,
            exteriorArc.endingPoint,
        ]
    }

    public var cartesianFrame: CartesianFrame {
        guard let frame = try? CartesianFrame.make(for: exteriorArc, points: cartesianPoints) else {
            return .zero
        }

        let x, y, width, height: CGFloat

        switch cardinal {
        case .up:
            width = frame.width
            height = (exteriorArc.radius - interiorRadius) + frame.height
            x = frame.x
            y = frame.y
        case .left:
            width = (exteriorArc.radius - interiorRadius) + frame.width
            height = frame.height
            x = frame.x
            y = frame.y
        case .right:
            width = (exteriorArc.radius - interiorRadius) + frame.width
            height = frame.height
            x = frame.x - (exteriorArc.radius - interiorRadius)
            y = frame.y
        case .down:
            width = frame.width
            height = (exteriorArc.radius - interiorRadius) + frame.height
            x = frame.x
            y = frame.y + (exteriorArc.radius - interiorRadius)
        }

        return CartesianFrame(
            x: x,
            y: y,
            width: width,
            height: height
        )
    }

    #if canImport(CoreGraphics)
    public var path: CGPath {
        let path: CGMutablePath = CGMutablePath()
        subpaths?.forEach { path.addPath($0) }
        return path
    }

    public var subpaths: [CGPath]? {
        guard let frame = try? CartesianFrame.make(for: exteriorArc, points: cartesianPoints) else {
            return nil
        }

        var paths: [CGMutablePath] = [CGMutablePath]()
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
            remainingPath.addRect(Rect(x: unit * 2, y: 0, width: size.width - (unit * 2.0), height: size.height))
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

            arrowPath.addRect(Rect(x: 0, y: unit * 2.0, width: size.width, height: unit * 0.5))
            paths.append(arrowPath)

            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: unit * 2.75, width: size.width, height: unit))
            remainingPath.addRect(Rect(x: 0, y: unit * 4.0, width: size.width, height: size.height - (unit * 4.0)))
            paths.append(remainingPath)
        }

        return paths
    }
    #endif
}
