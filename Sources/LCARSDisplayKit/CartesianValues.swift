import GraphPoint
import Swift2D

@available(*, deprecated, renamed: "CartesianValues")
public typealias DirectionPad = CartesianValues

public struct CartesianValues {

    public enum Layout {
        case compact
        case standard
    }

    public struct Radii {
        public let firstRingInteriorRadius: Double
        public let firstRingExteriorRadius: Double
        public let secondRingInteriorRadius: Double
        public let secondRingExteriorRadius: Double
        public let secondRingExtendedExteriorRadius: Double
        public let secondRingEdgeExteriorRadius: Double
        public let thirdRingInteriorRadius: Double
        public let thirdRingExteriorRadius: Double
    }

    @available(*, deprecated, renamed: "Scaler.intrinsicSpacing")
    public static let intrinsicSpacing: Double = 8.0

    public let plane: CartesianPlane
    public let diameter: Double
    public let radius: Double
    public let scale: Double
    public let spacing: Double
    public let cruxRadius: Double
    public let offset: CartesianFrame.Offset
    public let radii: Radii

    private static func make(
        size: Size,
        intrinsicSize: Size,
        intrinsicCruxSize: Size = Crux.intrinsicSize,
        intrinsicSpacing: Double = Scaler.intrinsicSpacing,
        intrinsicOffset: CartesianFrame.Offset = .zero,
        layout: Layout = .standard
    ) -> CartesianValues {
        let (scaledSize, scale) = Scaler.scale(from: intrinsicSize, to: size)
        let plane = CartesianPlane(origin: .zero, size: scaledSize)
        let diameter = min(scaledSize.width, scaledSize.height)
        let radius = diameter / 2.0
        let spacing = intrinsicSpacing * scale
        let cruxRadius = (min(intrinsicCruxSize.width, intrinsicCruxSize.height) * scale) / 2.0
        let offset = CartesianFrame.Offset(
            x: intrinsicOffset.x * scale,
            y: intrinsicOffset.y * scale
        )
        
        let firstRingInteriorRadius = (DPadView.intrinsicSize.maxRadius * scale) + spacing
        let firstRingExteriorRadius = firstRingInteriorRadius + (80.0 * scale)
        let secondRingInteriorRadius = firstRingExteriorRadius + spacing
        let secondRingExteriorRadius = secondRingInteriorRadius + (50.0 * scale)
        let secondRingExtendedExteriorRadius = secondRingInteriorRadius + (110.0 * scale)
        let secondRingEdgeExteriorRadius = secondRingExteriorRadius + ((layout == .compact ? 62.0 : 41.5) * scale)
        let thirdRingInteriorRadius = secondRingExteriorRadius + spacing
        let thirdRingExteriorRadius = thirdRingInteriorRadius + ((layout == .compact ? 45.0 : 72.0) * scale)

        let radii = Radii(
            firstRingInteriorRadius: firstRingInteriorRadius,
            firstRingExteriorRadius: firstRingExteriorRadius,
            secondRingInteriorRadius: secondRingInteriorRadius,
            secondRingExteriorRadius: secondRingExteriorRadius,
            secondRingExtendedExteriorRadius: secondRingExtendedExteriorRadius,
            secondRingEdgeExteriorRadius: secondRingEdgeExteriorRadius,
            thirdRingInteriorRadius: thirdRingInteriorRadius,
            thirdRingExteriorRadius: thirdRingExteriorRadius
        )

        return CartesianValues(
            plane: plane,
            diameter: diameter,
            radius: radius,
            scale: scale,
            spacing: spacing,
            cruxRadius: cruxRadius,
            offset: offset,
            radii: radii
        )
    }

    public init(
        plane: CartesianPlane,
        diameter: Double,
        radius: Double,
        scale: Double,
        spacing: Double,
        cruxRadius: Double,
        offset: CartesianFrame.Offset,
        radii: Radii
    ) {
        self.plane = plane
        self.diameter = diameter
        self.radius = radius
        self.scale = scale
        self.spacing = spacing
        self.cruxRadius = cruxRadius
        self.offset = offset
        self.radii = radii
    }

    public init(
        size: Size,
        intrinsicSize: Size,
        intrinsicCruxSize: Size = Crux.intrinsicSize,
        intrinsicSpacing: Double = Scaler.intrinsicSpacing,
        intrinsicOffset: CartesianFrame.Offset = .zero,
        layout: Layout = .standard
    ) {
        self = Self.make(
            size: size,
            intrinsicSize: intrinsicSize,
            intrinsicCruxSize: intrinsicCruxSize,
            intrinsicSpacing: intrinsicSpacing,
            intrinsicOffset: intrinsicOffset,
            layout: layout
        )
    }

    public init(
        scale: Double,
        intrinsicSize: Size,
        intrinsicCruxSize: Size = Crux.intrinsicSize,
        intrinsicSpacing: Double = Scaler.intrinsicSpacing,
        intrinsicOffset: CartesianFrame.Offset = .zero,
        layout: Layout = .standard
    ) {
        let size = Size(width: intrinsicSize.width * scale, height: intrinsicSize.height * scale)
        self = Self.make(
            size: size,
            intrinsicSize: intrinsicSize,
            intrinsicCruxSize: intrinsicCruxSize,
            intrinsicSpacing: intrinsicSpacing,
            intrinsicOffset: intrinsicOffset,
            layout: layout
        )
    }

    @available(*, deprecated, renamed: "radii")
    public func radii(layout: Layout, dPadRadius: Radius) -> Radii {
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
        Crux(radius: cruxRadius)
    }

    public func wedge(sector: Wedge.Sector) -> Wedge {
        Wedge(sector: sector, radius: radius)
    }

    public func direction(cardinal: Direction.Cardinal) -> Direction {
        Direction(
            cardinal: cardinal,
            interiorRadius: cruxRadius + spacing,
            exteriorRadius: radius
        )
    }

    public func scale(offset: CartesianFrame.Offset) -> CartesianFrame.Offset {
        CartesianFrame.Offset(
            x: offset.x * scale,
            y: offset.y * scale
        )
    }

    public func scale(size: Size) -> Size {
        Size(
            width: size.width * scale,
            height: size.height * scale
        )
    }
}
