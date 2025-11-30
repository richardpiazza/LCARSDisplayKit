import GraphPoint
import Swift2D

/// A shape representing a cardinal direction in a control cluster.
public struct Direction: Hashable, Sendable {

    public enum Cardinal: CartesianIdentifier, Hashable, Sendable, CaseIterable {
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

    public let cardinal: Cardinal
    public let interiorRadius: Radius
    public let exteriorArc: Arc

    /// Initialize a `Direction` Cartesian Shape.
    ///
    /// - parameters:
    ///   - cardinal: The cardinal direction represented by this shape.
    ///   - interiorRadius:
    ///   - exteriorArc:
    public init(
        cardinal: Cardinal,
        interiorRadius: Radius,
        exteriorArc: Arc
    ) {
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        self.exteriorArc = exteriorArc
    }

    /// Initialize a `Direction` Cartesian Shape.
    ///
    /// - parameters:
    ///   - cardinal: The cardinal direction represented by this shape.
    ///   - interiorRadius:
    ///   - exteriorRadius: Radius uses to construct the `exteriorArc`.
    public init(
        cardinal: Cardinal,
        interiorRadius: Radius,
        exteriorRadius: Radius
    ) {
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        exteriorArc = Arc(
            radius: exteriorRadius,
            startingDegree: cardinal.start,
            endingDegree: cardinal.end
        )
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        cardinal: Cardinal = .up,
        interiorRadius: Radius = 0.0,
        exteriorArc: Arc = Arc()
    ) {
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        self.exteriorArc = exteriorArc
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        cardinal: Cardinal = .up,
        interiorRadius: Radius,
        exteriorRadius: Radius
    ) {
        self.cardinal = cardinal
        self.interiorRadius = interiorRadius
        exteriorArc = Arc(
            radius: exteriorRadius,
            startingDegree: cardinal.start,
            endingDegree: cardinal.end
        )
    }

    @available(*, deprecated)
    public var identifier: CartesianIdentifier? { nil }
}
