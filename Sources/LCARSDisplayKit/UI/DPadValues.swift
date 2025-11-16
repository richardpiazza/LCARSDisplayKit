import Foundation
import GraphPoint
import Swift2D

public struct DPadValues {
    
    public enum Layout {
        case compact
        case standard
    }
    
    public struct Radii {
        public let firstRingInteriorRadius: CGFloat
        public let firstRingExteriorRadius: CGFloat
        public let secondRingInteriorRadius: CGFloat
        public let secondRingExteriorRadius: CGFloat
        public let secondRingExtendedExteriorRadius: CGFloat
        public let secondRingEdgeExteriorRadius: CGFloat
        public let thirdRingInteriorRadius: CGFloat
        public let thirdRingExteriorRadius: CGFloat
    }
    
    public static let intrinsicSpacing: CGFloat = 8.0
    
    public let plane: CartesianPlane
    public let diameter: CGFloat
    public let radius: CGFloat
    public let scale: CGFloat
    public let spacing: CGFloat
    public let cruxRadius: CGFloat
    public let cartesianOffset: CartesianFrame.Offset
    
    private static func make(
        size: CGSize,
        intrinsicSize: CGSize,
        intrinsicCruxSize: CGSize = Crux.intrinsicSize,
        intrinsicSpacing: CGFloat = intrinsicSpacing,
        offsetModifier: Point = .zero
    ) -> DPadValues {
        let intrinsicRatio = if intrinsicSize.width >= intrinsicSize.height {
            intrinsicSize.width / intrinsicSize.height
        } else {
            intrinsicSize.height / intrinsicSize.width
        }
        
        let scaledSize = if size.width >= size.height {
            CGSize(width: size.height * intrinsicRatio, height: size.height)
        } else {
            CGSize(width: size.width, height: size.width * intrinsicRatio)
        }
        
        let scale = if size.width >= size.height {
            scaledSize.width / intrinsicSize.width
        } else {
            scaledSize.height / intrinsicSize.height
        }
        
        let plane = CartesianPlane(origin: .zero, size: Size(scaledSize))
        let diameter = min(scaledSize.width, scaledSize.height)
        let radius = diameter / 2.0
        let spacing = intrinsicSpacing * scale
        let cruxRadius = (min(intrinsicCruxSize.width, intrinsicCruxSize.height) * scale) / 2.0
        let cartesianOffset = CartesianFrame.Offset(
            x: scaledSize.width * offsetModifier.x,
            y: scaledSize.height * offsetModifier.y
        )
        
        return DPadValues(
            plane: plane,
            diameter: diameter,
            radius: radius,
            scale: scale,
            spacing: spacing,
            cruxRadius: cruxRadius,
            cartesianOffset: cartesianOffset
        )
    }
    
    public init(
        plane: CartesianPlane,
        diameter: CGFloat,
        radius: CGFloat,
        scale: CGFloat,
        spacing: CGFloat,
        cruxRadius: CGFloat,
        cartesianOffset: CartesianFrame.Offset
    ) {
        self.plane = plane
        self.diameter = diameter
        self.radius = radius
        self.scale = scale
        self.spacing = spacing
        self.cruxRadius = cruxRadius
        self.cartesianOffset = cartesianOffset
    }
    
    public init(
        size: CGSize,
        intrinsicSize: CGSize,
        intrinsicCruxSize: CGSize = Crux.intrinsicSize,
        intrinsicSpacing: CGFloat = Self.intrinsicSpacing,
        offsetModifier: Point = .zero
    ) {
        self = Self.make(
            size: size,
            intrinsicSize: intrinsicSize,
            intrinsicCruxSize: intrinsicCruxSize,
            intrinsicSpacing: intrinsicSpacing,
            offsetModifier: offsetModifier
        )
    }
    
    public init(
        scale: CGFloat,
        intrinsicSize: CGSize,
        intrinsicCruxSize: CGSize = Crux.intrinsicSize,
        intrinsicSpacing: CGFloat = Self.intrinsicSpacing,
        offsetModifier: Point = .zero
    ) {
        let size = CGSize(width: intrinsicSize.width * scale, height: intrinsicSize.height * scale)
        self = Self.make(
            size: size,
            intrinsicSize: intrinsicSize,
            intrinsicCruxSize: intrinsicCruxSize,
            intrinsicSpacing: intrinsicSpacing,
            offsetModifier: offsetModifier
        )
    }
    
    public func radii(layout: Layout) -> Radii {
        let dPadRadius = DPadView.intrinsicSize.width / 2.0
        let firstRingInteriorRadius = (dPadRadius * scale) + spacing
        let firstRingExteriorRadius = firstRingInteriorRadius + (80.0 * scale)
        let secondRingInteriorRadius = firstRingExteriorRadius + spacing
        let secondRingExteriorRadius = secondRingInteriorRadius + (50.0 * scale)
        let secondRingExtendedExteriorRadius = secondRingInteriorRadius + (110.0 * scale)
        let secondRingEdgeExteriorRadius = secondRingExteriorRadius + ((layout == .compact ? 62.0 : 41.5) * scale)
        let thirdRingInteriorRadius = secondRingExteriorRadius + spacing
        let thirdRingExteriorRadius = thirdRingInteriorRadius + ((layout == .compact ? 45.0 : 72.0) * scale)
        
        return Radii(
            firstRingInteriorRadius: firstRingInteriorRadius,
            firstRingExteriorRadius: firstRingExteriorRadius,
            secondRingInteriorRadius: secondRingInteriorRadius,
            secondRingExteriorRadius: secondRingExteriorRadius,
            secondRingExtendedExteriorRadius: secondRingExtendedExteriorRadius,
            secondRingEdgeExteriorRadius: secondRingEdgeExteriorRadius,
            thirdRingInteriorRadius: thirdRingInteriorRadius,
            thirdRingExteriorRadius: thirdRingExteriorRadius
        )
    }
    
    public func crux() -> Crux {
        Crux(
            identifier: .crux,
            radius: cruxRadius
        )
    }
    
    public func wedge(sector: Wedge.Sector) -> Wedge {
        Wedge(
            identifier: sector.rawValue,
            sector: sector,
            radius: radius
        )
    }
    
    public func direction(cardinal: Direction.Cardinal) -> Direction {
        Direction(
            identifier: cardinal.rawValue,
            cardinal: cardinal,
            interiorRadius: cruxRadius + spacing,
            exteriorRadius: radius
        )
    }
}
