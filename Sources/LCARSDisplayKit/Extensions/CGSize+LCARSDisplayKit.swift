#if canImport(CoreGraphics)
import CoreGraphics

public extension CGSize {
    func dPadValues(
        intrinsicDiameter: CGFloat = 350.0,
        intrinsicCruxDiameter: CGFloat = 60.0,
        intrinsicSpacing: CGFloat = 8.0
    ) -> (
        diameter: CGFloat,
        radius: CGFloat,
        scale: CGFloat,
        spacing: CGFloat,
        cruxRadius: CGFloat
    ) {
        let diameter = min(height, width)
        let radius = diameter / 2.0
        let scale = diameter / intrinsicDiameter
        let spacing = intrinsicSpacing * scale
        let cruxRadius = (intrinsicCruxDiameter * scale) / 2.0
        
        return (diameter, radius, scale, spacing, cruxRadius)
    }
}
#endif
