import GraphPoint
import Swift2D

public struct DPadValues {
    
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
    
    public static let intrinsicSpacing: Double = 8.0
    
    public let plane: CartesianPlane
    public let diameter: Double
    public let radius: Double
    public let scale: Double
    public let spacing: Double
    public let cruxRadius: Double
    public let offset: CartesianFrame.Offset
    
    private static func make(
        size: Size,
        intrinsicSize: Size,
        intrinsicCruxSize: Size = Crux.intrinsicSize,
        intrinsicSpacing: Double = intrinsicSpacing,
        intrinsicOffset: CartesianFrame.Offset = .zero
    ) -> DPadValues {
        let scaledSize: Size
        let scale: Double
        
        if intrinsicSize.width >= intrinsicSize.height {
            switch (size.width >= intrinsicSize.width, size.height >= intrinsicSize.height) {
            case (true, true):
                let widthRatio = size.width / intrinsicSize.width
                let proposedHeight = intrinsicSize.height * widthRatio
                if proposedHeight > size.height {
                    let heightRatio = size.height / intrinsicSize.height
                    let proposedWidth = intrinsicSize.width * heightRatio
                    scaledSize = Size(width: proposedWidth, height: size.height)
                    scale = heightRatio
                } else {
                    scaledSize = Size(width: size.width, height: proposedHeight)
                    scale = widthRatio
                }
            case (true, false):
                let heightRatio = intrinsicSize.height / size.height
                let proposedWidth = intrinsicSize.width * heightRatio
                scaledSize = Size(width: proposedWidth, height: size.height)
                scale = heightRatio
            case (false, true):
                let widthRatio = intrinsicSize.width / size.width
                let proposedHeight = intrinsicSize.height * widthRatio
                scaledSize = Size(width: size.width, height: proposedHeight)
                scale = widthRatio
            case (false, false):
                let widthRatio = size.width / intrinsicSize.width
                let proposedHeight = intrinsicSize.height * widthRatio
                if proposedHeight > size.height {
                    let heightRatio = size.height / intrinsicSize.height
                    let proposedWidth = intrinsicSize.width * heightRatio
                    scaledSize = Size(width: proposedWidth, height: size.height)
                    scale = heightRatio
                } else {
                    scaledSize = Size(width: size.width, height: proposedHeight)
                    scale = widthRatio
                }
            }
        } else {
            switch (size.height >= intrinsicSize.height, size.width >= intrinsicSize.width) {
            case (true, true):
                let heightRatio = size.height / intrinsicSize.height
                let proposedWidth = intrinsicSize.width * heightRatio
                if proposedWidth > size.width {
                    let widthRatio = size.width / intrinsicSize.width
                    let proposedHeight = intrinsicSize.height * widthRatio
                    scaledSize = Size(width: size.width, height: proposedHeight)
                    scale = widthRatio
                } else {
                    scaledSize = Size(width: proposedWidth, height: size.height)
                    scale = heightRatio
                }
            case (true, false):
                let widthRatio = intrinsicSize.width / size.width
                let proposedHeight = intrinsicSize.height * widthRatio
                scaledSize = Size(width: size.width, height: proposedHeight)
                scale = widthRatio
            case (false, true):
                let heightRatio = size.height / intrinsicSize.height
                let proposedWidth = intrinsicSize.width * heightRatio
                scaledSize = Size(width: proposedWidth, height: size.height)
                scale = heightRatio
            case (false, false):
                let heightRatio = size.height / intrinsicSize.height
                let proposedWidth = intrinsicSize.width * heightRatio
                if proposedWidth > size.width {
                    let widthRatio = size.width / intrinsicSize.width
                    let proposedHeight = intrinsicSize.height * widthRatio
                    scaledSize = Size(width: size.width, height: proposedHeight)
                    scale = widthRatio
                } else {
                    scaledSize = Size(width: proposedWidth, height: size.height)
                    scale = heightRatio
                }
            }
        }
        
        let plane = CartesianPlane(origin: .zero, size: scaledSize)
        let diameter = min(scaledSize.width, scaledSize.height)
        let radius = diameter / 2.0
        let spacing = intrinsicSpacing * scale
        let cruxRadius = (min(intrinsicCruxSize.width, intrinsicCruxSize.height) * scale) / 2.0
        let offset = CartesianFrame.Offset(
            x: intrinsicOffset.x * scale,
            y: intrinsicOffset.y * scale
        )
        
        return DPadValues(
            plane: plane,
            diameter: diameter,
            radius: radius,
            scale: scale,
            spacing: spacing,
            cruxRadius: cruxRadius,
            offset: offset
        )
    }
    
    public init(
        plane: CartesianPlane,
        diameter: Double,
        radius: Double,
        scale: Double,
        spacing: Double,
        cruxRadius: Double,
        offset: CartesianFrame.Offset
    ) {
        self.plane = plane
        self.diameter = diameter
        self.radius = radius
        self.scale = scale
        self.spacing = spacing
        self.cruxRadius = cruxRadius
        self.offset = offset
    }
    
    public init(
        size: Size,
        intrinsicSize: Size,
        intrinsicCruxSize: Size = Crux.intrinsicSize,
        intrinsicSpacing: Double = Self.intrinsicSpacing,
        intrinsicOffset: CartesianFrame.Offset = .zero
    ) {
        self = Self.make(
            size: size,
            intrinsicSize: intrinsicSize,
            intrinsicCruxSize: intrinsicCruxSize,
            intrinsicSpacing: intrinsicSpacing,
            intrinsicOffset: intrinsicOffset
        )
    }
    
    public init(
        scale: Double,
        intrinsicSize: Size,
        intrinsicCruxSize: Size = Crux.intrinsicSize,
        intrinsicSpacing: Double = Self.intrinsicSpacing,
        intrinsicOffset: CartesianFrame.Offset = .zero
    ) {
        let size = Size(width: intrinsicSize.width * scale, height: intrinsicSize.height * scale)
        self = Self.make(
            size: size,
            intrinsicSize: intrinsicSize,
            intrinsicCruxSize: intrinsicCruxSize,
            intrinsicSpacing: intrinsicSpacing,
            intrinsicOffset: intrinsicOffset
        )
    }
    
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
