#if canImport(UIKit)
import UIKit

/// A collection of radial coordinates used in drawing the `DirectionGroupingView`
///
/// Each arc in the ring should contain 17° with .5° on each side for spacing.
/// (20 x 17°) + (20 x 0.5°) + (20 x 0.5°) = 360°
public enum DPad {
    case down
    case left
    case up
    case right
    case sector01
    case sector02
    case sector03
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
    
    public var start: CGFloat {
        switch self {
        case .down: return CGFloat(80)
        case .left: return CGFloat(170)
        case .up: return CGFloat(260)
        case .right: return CGFloat(350)
        case .sector01: return CGFloat(12)
        case .sector02: return CGFloat(102)
        case .sector03: return CGFloat(192)
        case .sector04: return CGFloat(282)
        case .arc01: return CGFloat(9.5)
        case .arc02: return CGFloat(27.5)
        case .arc03: return CGFloat(45.5)
        case .arc04: return CGFloat(63.5)
        case .arc05: return CGFloat(81.5)
        case .arc06: return CGFloat(99.5)
        case .arc07: return CGFloat(117.5)
        case .arc08: return CGFloat(135.5)
        case .arc09: return CGFloat(153.5)
        case .arc10: return CGFloat(171.5)
        case .arc11: return CGFloat(189.5)
        case .arc12: return CGFloat(207.5)
        case .arc13: return CGFloat(225.5)
        case .arc14: return CGFloat(243.5)
        case .arc15: return CGFloat(261.5)
        case .arc16: return CGFloat(279.5)
        case .arc17: return CGFloat(297.5)
        case .arc18: return CGFloat(315.5)
        case .arc19: return CGFloat(334.5)
        case .arc20: return CGFloat(351.5)
        }
    }
    
    public var end: CGFloat {
        switch self {
        case .down: return CGFloat(100)
        case .left: return CGFloat(190)
        case .up: return CGFloat(280)
        case .right: return CGFloat(10)
        case .sector01: return CGFloat(78)
        case .sector02: return CGFloat(168)
        case .sector03: return CGFloat(258)
        case .sector04: return CGFloat(348)
        case .arc01: return CGFloat(26.5)
        case .arc02: return CGFloat(44.5)
        case .arc03: return CGFloat(62.5)
        case .arc04: return CGFloat(80.5)
        case .arc05: return CGFloat(98.5)
        case .arc06: return CGFloat(116.5)
        case .arc07: return CGFloat(134.5)
        case .arc08: return CGFloat(152.5)
        case .arc09: return CGFloat(170.5)
        case .arc10: return CGFloat(188.5)
        case .arc11: return CGFloat(206.5)
        case .arc12: return CGFloat(224.5)
        case .arc13: return CGFloat(242.5)
        case .arc14: return CGFloat(260.5)
        case .arc15: return CGFloat(278.5)
        case .arc16: return CGFloat(296.5)
        case .arc17: return CGFloat(314.5)
        case .arc18: return CGFloat(332.5)
        case .arc19: return CGFloat(350.5)
        case .arc20: return CGFloat(8.5)
        }
    }
}
#endif
