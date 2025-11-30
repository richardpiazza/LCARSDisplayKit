import GraphPoint

/// An `Arc` extended with straight lines to additional points
public struct EdgedCrescent: Hashable, Sendable {
    public let interiorArc: Arc
    public let edgePoints: [CartesianPoint]

    /// Initialize a `EdgedCrescent` Cartesian Shape.
    ///
    /// - parameters:
    ///   - identifier: A unique `CartesianIdentifier`.
    ///   - interiorArc:
    ///   - edgePoints:
    public init(
        interiorArc: Arc,
        edgePoints: [CartesianPoint]
    ) {
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }

    @available(*, deprecated)
    public init(
        identifier: CartesianIdentifier?,
        interiorArc: Arc = Arc(),
        edgePoints: [CartesianPoint] = []
    ) {
        self.interiorArc = interiorArc
        self.edgePoints = edgePoints
    }

    public var identifier: CartesianIdentifier? { nil }
}
