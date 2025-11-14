public struct CartesianShapeIdentifier: Hashable, Sendable, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(stringLiteral value: String) {
        rawValue = value
    }
}
