import GraphPoint

/// A collection of radial arcs that are used to draw circular elements.
///
/// Each arc contains 17° with 0.5° on each side for spacing.
/// (20 x 17°) + (20 x 0.5°) + (20 x 0.5°) = 360°
public struct Curve: Hashable {
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
    
    public static let arc01: Self = Curve(start: 9.5, end: 26.5)
    public static let arc02: Self = Curve(start: 27.5, end: 44.5)
    public static let arc03: Self = Curve(start: 45.5, end: 62.5)
    public static let arc04: Self = Curve(start: 63.5, end: 80.5)
    public static let arc05: Self = Curve(start: 81.5, end: 98.5)
    public static let arc06: Self = Curve(start: 99.5, end: 116.5)
    public static let arc07: Self = Curve(start: 117.5, end: 134.5)
    public static let arc08: Self = Curve(start: 135.5, end: 152.5)
    public static let arc09: Self = Curve(start: 153.5, end: 170.5)
    public static let arc10: Self = Curve(start: 171.5, end: 188.5)
    public static let arc11: Self = Curve(start: 189.5, end: 206.5)
    public static let arc12: Self = Curve(start: 207.5, end: 224.5)
    public static let arc13: Self = Curve(start: 225.5, end: 242.5)
    public static let arc14: Self = Curve(start: 243.5, end: 260.5)
    public static let arc15: Self = Curve(start: 261.5, end: 278.5)
    public static let arc16: Self = Curve(start: 279.5, end: 296.5)
    public static let arc17: Self = Curve(start: 297.5, end: 314.5)
    public static let arc18: Self = Curve(start: 315.5, end: 332.5)
    public static let arc19: Self = Curve(start: 333.5, end: 350.5)
    public static let arc20: Self = Curve(start: 351.5, end: 8.5)
}
