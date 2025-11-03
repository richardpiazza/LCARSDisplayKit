import GraphPoint

/// A collection of radial coordinates used in drawing the `DirectionGroupingView`
///
/// Each arc in the ring should contain 17° with 0.5° on each side for spacing.
/// (20 x 17°) + (20 x 0.5°) + (20 x 0.5°) = 360°
public enum DPad {
    @available(*, deprecated, renamed: "CardinalDirection.down")
    case down
    @available(*, deprecated, renamed: "CardinalDirection.left")
    case left
    @available(*, deprecated, renamed: "CardinalDirection.up")
    case up
    @available(*, deprecated, renamed: "CardinalDirection.right")
    case right
    @available(*, deprecated, renamed: "Sector.sector01")
    case sector01
    @available(*, deprecated, renamed: "Sector.sector02")
    case sector02
    @available(*, deprecated, renamed: "Sector.sector03")
    case sector03
    @available(*, deprecated, renamed: "Sector.sector04")
    case sector04
    case arc01
    case arc02
    case arc03
    case arc04
    case arc05
    case arc06
    case arc07
    case arc08
    case arc09
    case arc10
    case arc11
    case arc12
    case arc13
    case arc14
    case arc15
    case arc16
    case arc17
    case arc18
    case arc19
    case arc20
    
    public var start: Degree {
        switch self {
        case .down: return 80
        case .left: return 170
        case .up: return 260
        case .right: return 350
        case .sector01: return 12
        case .sector02: return 102
        case .sector03: return 192
        case .sector04: return 282
        case .arc01: return 9.5
        case .arc02: return 27.5
        case .arc03: return 45.5
        case .arc04: return 63.5
        case .arc05: return 81.5
        case .arc06: return 99.5
        case .arc07: return 117.5
        case .arc08: return 135.5
        case .arc09: return 153.5
        case .arc10: return 171.5
        case .arc11: return 189.5
        case .arc12: return 207.5
        case .arc13: return 225.5
        case .arc14: return 243.5
        case .arc15: return 261.5
        case .arc16: return 279.5
        case .arc17: return 297.5
        case .arc18: return 315.5
        case .arc19: return 334.5
        case .arc20: return 351.5
        }
    }
    
    public var end: Degree {
        switch self {
        case .down: return 100
        case .left: return 190
        case .up: return 280
        case .right: return 10
        case .sector01: return 78
        case .sector02: return 168
        case .sector03: return 258
        case .sector04: return 348
        case .arc01: return 26.5
        case .arc02: return 44.5
        case .arc03: return 62.5
        case .arc04: return 80.5
        case .arc05: return 98.5
        case .arc06: return 116.5
        case .arc07: return 134.5
        case .arc08: return 152.5
        case .arc09: return 170.5
        case .arc10: return 188.5
        case .arc11: return 206.5
        case .arc12: return 224.5
        case .arc13: return 242.5
        case .arc14: return 260.5
        case .arc15: return 278.5
        case .arc16: return 296.5
        case .arc17: return 314.5
        case .arc18: return 332.5
        case .arc19: return 350.5
        case .arc20: return 8.5
        }
    }
}

public extension DPad {
    enum Arc: DegreeConvertible, CaseIterable {
        case arc01
        case arc02
        case arc03
        case arc04
        case arc05
        case arc06
        case arc07
        case arc08
        case arc09
        case arc10
        case arc11
        case arc12
        case arc13
        case arc14
        case arc15
        case arc16
        case arc17
        case arc18
        case arc19
        case arc20
        
        public var start: Degree {
            switch self {
            case .arc01: return 9.5
            case .arc02: return 27.5
            case .arc03: return 45.5
            case .arc04: return 63.5
            case .arc05: return 81.5
            case .arc06: return 99.5
            case .arc07: return 117.5
            case .arc08: return 135.5
            case .arc09: return 153.5
            case .arc10: return 171.5
            case .arc11: return 189.5
            case .arc12: return 207.5
            case .arc13: return 225.5
            case .arc14: return 243.5
            case .arc15: return 261.5
            case .arc16: return 279.5
            case .arc17: return 297.5
            case .arc18: return 315.5
            case .arc19: return 334.5
            case .arc20: return 351.5
            }
        }
        
        public var end: Degree {
            switch self {
            case .arc01: return 26.5
            case .arc02: return 44.5
            case .arc03: return 62.5
            case .arc04: return 80.5
            case .arc05: return 98.5
            case .arc06: return 116.5
            case .arc07: return 134.5
            case .arc08: return 152.5
            case .arc09: return 170.5
            case .arc10: return 188.5
            case .arc11: return 206.5
            case .arc12: return 224.5
            case .arc13: return 242.5
            case .arc14: return 260.5
            case .arc15: return 278.5
            case .arc16: return 296.5
            case .arc17: return 314.5
            case .arc18: return 332.5
            case .arc19: return 350.5
            case .arc20: return 8.5
            }
        }
    }
}

public extension DPad {
    enum CardinalDirection: DegreeConvertible, CaseIterable {
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
}

public extension DPad {
    enum Sector: DegreeConvertible, CaseIterable {
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
