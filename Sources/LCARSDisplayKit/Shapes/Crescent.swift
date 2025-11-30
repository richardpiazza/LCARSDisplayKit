import GraphPoint

/// Two `Arc`s connected by straight lines at their end points.
public struct Crescent: Hashable, Sendable {
    public let interiorArc: Arc
    public let exteriorArc: Arc

    /// Initialize a `Crescent` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianIdentifier`.
    ///   - interiorArc: Arc with radius closest to the cartesian origin.
    ///   - exteriorArc: Arc with radius farthest from the cartesian origin.
    public init(
        interiorArc: Arc,
        exteriorArc: Arc
    ) {
        self.interiorArc = interiorArc
        self.exteriorArc = exteriorArc
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        interiorArc: Arc = Arc(),
        exteriorArc: Arc = Arc()
    ) {
        self.interiorArc = interiorArc
        self.exteriorArc = exteriorArc
    }

    public var identifier: CartesianIdentifier? { nil }
}
