import GraphPoint

@available(*, deprecated, renamed: "Radial")
public typealias Curve = Radial

/// A collection of radial arcs that are used to draw circular elements.
///
/// Each arc contains 17° with 0.5° on each side for spacing.
/// (20 x 17°) + (20 x 0.5°) + (20 x 0.5°) = 360°
public struct Radial: Hashable {
    public let start: Degree
    public let end: Degree

    public var mid: Degree { end - start }
    public var quarter: Degree { mid / 2.0 }

    public func arc(radius: Radius) -> Arc {
        Arc(
            radius: radius,
            startingDegree: start,
            endingDegree: end
        )
    }

    public static let arc01: Self = Radial(start: 9.5, end: 26.5)
    public static let arc02: Self = Radial(start: 27.5, end: 44.5)
    public static let arc03: Self = Radial(start: 45.5, end: 62.5)
    public static let arc04: Self = Radial(start: 63.5, end: 80.5)
    public static let arc05: Self = Radial(start: 81.5, end: 98.5)
    public static let arc06: Self = Radial(start: 99.5, end: 116.5)
    public static let arc07: Self = Radial(start: 117.5, end: 134.5)
    public static let arc08: Self = Radial(start: 135.5, end: 152.5)
    public static let arc09: Self = Radial(start: 153.5, end: 170.5)
    public static let arc10: Self = Radial(start: 171.5, end: 188.5)
    public static let arc11: Self = Radial(start: 189.5, end: 206.5)
    public static let arc12: Self = Radial(start: 207.5, end: 224.5)
    public static let arc13: Self = Radial(start: 225.5, end: 242.5)
    public static let arc14: Self = Radial(start: 243.5, end: 260.5)
    public static let arc15: Self = Radial(start: 261.5, end: 278.5)
    public static let arc16: Self = Radial(start: 279.5, end: 296.5)
    public static let arc17: Self = Radial(start: 297.5, end: 314.5)
    public static let arc18: Self = Radial(start: 315.5, end: 332.5)
    public static let arc19: Self = Radial(start: 333.5, end: 350.5)
    public static let arc20: Self = Radial(start: 351.5, end: 8.5)
}
