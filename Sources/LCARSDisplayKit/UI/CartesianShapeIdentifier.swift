public struct CartesianShapeIdentifier: Hashable, Sendable, ExpressibleByIntegerLiteral {
    public let rawValue: Int
    
    public init(integerLiteral value: Int) {
        rawValue = value
    }
}
