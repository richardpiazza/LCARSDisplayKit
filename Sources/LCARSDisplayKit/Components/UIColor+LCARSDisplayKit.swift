#if canImport(UIKit)
import UIKit

extension UIColor {
    /// Returns the same UIColor with a modified saturation value.
    /// Supplying the `amount` of 1.0 returns the same color.
    /// - A value of 1.1 returns a color 10% more saturated.
    /// - A value of 0.9 returns a color 10% less saturated.
    func adaptingSaturation(by amount: Float) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            return self
        }
        
        let adaptedSaturation = saturation * CGFloat(amount)
        
        return UIColor(hue: hue, saturation: adaptedSaturation, brightness: brightness, alpha: alpha)
    }
}
#endif
