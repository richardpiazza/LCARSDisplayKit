import GraphPoint

/// A collection of radial coordinates used in drawing the `DirectionGroupingView`
///
/// Each arc in the ring should contain 17° with 0.5° on each side for spacing.
/// (20 x 17°) + (20 x 0.5°) + (20 x 0.5°) = 360°
enum DPad {
    struct Ring: Hashable {
        public let start: Degree
        public let end: Degree
        
        public var mid: Degree { end - start }
        
        static let arc01: Self = Ring(start: 9.5, end: 26.5)
        static let arc02: Self = Ring(start: 27.5, end: 44.5)
        static let arc03: Self = Ring(start: 45.5, end: 62.5)
        static let arc04: Self = Ring(start: 63.5, end: 80.5)
        static let arc05: Self = Ring(start: 81.5, end: 98.5)
        static let arc06: Self = Ring(start: 99.5, end: 116.5)
        static let arc07: Self = Ring(start: 117.5, end: 134.5)
        static let arc08: Self = Ring(start: 135.5, end: 152.5)
        static let arc09: Self = Ring(start: 153.5, end: 170.5)
        static let arc10: Self = Ring(start: 171.5, end: 188.5)
        static let arc11: Self = Ring(start: 189.5, end: 206.5)
        static let arc12: Self = Ring(start: 207.5, end: 224.5)
        static let arc13: Self = Ring(start: 225.5, end: 242.5)
        static let arc14: Self = Ring(start: 243.5, end: 260.5)
        static let arc15: Self = Ring(start: 261.5, end: 278.5)
        static let arc16: Self = Ring(start: 279.5, end: 296.5)
        static let arc17: Self = Ring(start: 297.5, end: 314.5)
        static let arc18: Self = Ring(start: 315.5, end: 332.5)
        static let arc19: Self = Ring(start: 333.5, end: 350.5)
        static let arc20: Self = Ring(start: 351.5, end: 8.5)
    }

    enum CardinalDirection: CaseIterable {
        case down
        case left
        case up
        case right
        
        public var start: Degree {
            switch self {
            case .down: return 80
            case .left: return 170
            case .up: return 260
            case .right: return 350
            }
        }
        
        public var end: Degree {
            switch self {
            case .down: return 100
            case .left: return 190
            case .up: return 280
            case .right: return 10
            }
        }
    }

    enum Sector: CaseIterable {
        case sector01
        case sector02
        case sector03
        case sector04
        
        public static var northEast: Self { sector04 }
        public static var northWest: Self { sector03 }
        public static var southEast: Self { sector01 }
        public static var southWest: Self { sector02 }
        
        public var start: Degree {
            switch self {
            case .sector01: return 12
            case .sector02: return 102
            case .sector03: return 192
            case .sector04: return 282
            }
        }
        
        public var end: Degree {
            switch self {
            case .sector01: return 78
            case .sector02: return 168
            case .sector03: return 258
            case .sector04: return 348
            }
        }
    }
}
