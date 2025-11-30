import GraphPoint
import Swift2D

/// A `Arc` that uses it's `pivotPoint` to draw a wedge.
public struct Wedge: Hashable, Sendable {

    public enum Sector: CartesianIdentifier, Hashable, Sendable, CaseIterable {
        case sector1
        case sector2
        case sector3
        case sector4

        public var start: Degree {
            switch self {
            case .sector1: 12
            case .sector2: 102
            case .sector3: 192
            case .sector4: 282
            }
        }

        public var end: Degree {
            switch self {
            case .sector1: 78
            case .sector2: 168
            case .sector3: 258
            case .sector4: 348
            }
        }
    }

    public let exteriorArc: Arc

    /// Initialize a `Wedge` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianIdentifier`.
    ///   - exteriorArc:
    public init(
        exteriorArc: Arc
    ) {
        self.exteriorArc = exteriorArc
    }

    /// Initialize a `Wedge` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianIdentifier`.
    ///   - sector:
    ///   - radius:
    public init(
        sector: Sector,
        radius: Radius
    ) {
        exteriorArc = Arc(
            radius: radius,
            startingDegree: sector.start,
            endingDegree: sector.end
        )
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        exteriorArc: Arc = Arc()
    ) {
        self.exteriorArc = exteriorArc
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        sector: Sector,
        radius: Radius
    ) {
        exteriorArc = Arc(
            radius: radius,
            startingDegree: sector.start,
            endingDegree: sector.end
        )
    }

    @available(*, deprecated, message: "Use `WedgeControl`")
    public var identifier: CartesianIdentifier? { nil }
}
