#if canImport(CoreGraphics)
import CoreGraphics
#else
import Foundation
#endif

#if canImport(CoreGraphics) || canImport(Foundation)
public extension CGSize {
    func dPadValues(
        intrinsicSize: CGSize = CGSize(width: 350.0, height: 350.0),
        intrinsicCruxDiameter: CGFloat = 60.0,
        intrinsicSpacing: CGFloat = 8.0
    ) -> (
        diameter: CGFloat,
        radius: CGFloat,
        scale: CGFloat,
        spacing: CGFloat,
        cruxRadius: CGFloat
    ) {
        let intrinsicDiameter = max(intrinsicSize.width, intrinsicSize.height)
        let diameter = min(height, width)
        let radius = diameter / 2.0
        let scale = diameter / intrinsicDiameter
        let spacing = intrinsicSpacing * scale
        let cruxRadius = (intrinsicCruxDiameter * scale) / 2.0

        return (diameter, radius, scale, spacing, cruxRadius)
    }

    func dPadValues(
        intrinsicDiameter: CGFloat,
        intrinsicCruxDiameter: CGFloat = 60.0,
        intrinsicSpacing: CGFloat = 8.0
    ) -> (
        diameter: CGFloat,
        radius: CGFloat,
        scale: CGFloat,
        spacing: CGFloat,
        cruxRadius: CGFloat
    ) {
        dPadValues(
            intrinsicSize: CGSize(width: intrinsicDiameter, height: intrinsicDiameter),
            intrinsicCruxDiameter: intrinsicCruxDiameter,
            intrinsicSpacing: intrinsicSpacing
        )
    }
}
#endif
