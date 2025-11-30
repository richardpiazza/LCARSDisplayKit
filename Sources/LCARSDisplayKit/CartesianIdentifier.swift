@available(*, deprecated, renamed: "CartesianIdentifier")
public typealias CartesianShapeIdentifier = CartesianIdentifier

public struct CartesianIdentifier: Hashable, Sendable, ExpressibleByStringLiteral, RawRepresentable {
    public let rawValue: String

    public init(stringLiteral value: String) {
        rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }

    public static let crux: Self = "crux"
    public static let down: Self = "down"
    public static let edge06: Self = "edge06"
    public static let edge07: Self = "edge07"
    public static let edge09: Self = "edge09"
    public static let edge13: Self = "edge14"
    public static let edge15: Self = "edge15"
    public static let innerRing01: Self = "innerRing01"
    public static let innerRing02: Self = "innerRing02"
    public static let innerRing03: Self = "innerRing03"
    public static let innerRing04: Self = "innerRing04"
    public static let innerRing05: Self = "innerRing05"
    public static let innerRing06: Self = "innerRing06"
    public static let innerRing07: Self = "innerRing07"
    public static let innerRing08: Self = "innerRing08"
    public static let innerRing09: Self = "innerRing09"
    public static let innerRing10: Self = "innerRing10"
    public static let innerRing11: Self = "innerRing11"
    public static let innerRing12: Self = "innerRing12"
    public static let innerRing13: Self = "innerRing13"
    public static let innerRing14: Self = "innerRing14"
    public static let innerRing15: Self = "innerRing15"
    public static let innerRing16: Self = "innerRing16"
    public static let innerRing17: Self = "innerRing17"
    public static let innerRing18: Self = "innerRing18"
    public static let innerRing19: Self = "innerRing19"
    public static let innerRing20: Self = "innerRing20"
    public static let left: Self = "left"
    public static let outerRing01: Self = "outerRing01"
    public static let outerRing02: Self = "outerRing02"
    public static let outerRing03: Self = "outerRing03"
    public static let outerRing04: Self = "outerRing04"
    public static let outerRing05: Self = "outerRing05"
    public static let outerRing06: Self = "outerRing06"
    public static let outerRing07: Self = "outerRing07"
    public static let outerRing08: Self = "outerRing08"
    public static let outerRing09: Self = "outerRing09"
    public static let outerRing10: Self = "outerRing10"
    public static let outerRing11: Self = "outerRing11"
    public static let outerRing12: Self = "outerRing12"
    public static let outerRing13: Self = "outerRing13"
    public static let outerRing14: Self = "outerRing14"
    public static let outerRing15: Self = "outerRing15"
    public static let outerRing16: Self = "outerRing16"
    public static let outerRing17: Self = "outerRing17"
    public static let outerRing18: Self = "outerRing18"
    public static let outerRing19: Self = "outerRing19"
    public static let outerRing20: Self = "outerRing20"
    public static let right: Self = "right"
    public static let sector1: Self = "sector1"
    public static let sector2: Self = "sector2"
    public static let sector3: Self = "sector3"
    public static let sector4: Self = "sector4"
    public static let top00: Self = "top00"
    public static let top01: Self = "top01"
    public static let top02: Self = "top02"
    public static let top03: Self = "top03"
    public static let top04: Self = "top04"
    public static let top05: Self = "top05"
    public static let up: Self = "up"
}
