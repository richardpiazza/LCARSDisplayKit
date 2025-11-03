import GraphPoint
import Swift2D
#if canImport(UIKit) && !os(watchOS)
import UIKit

open class DirectionControl: InteractiveControl<Direction> {
    
    override open var colors: [UIColor]? {
        return [theme.primaryDark, theme.primaryLight]
    }
    
    override open var touchedColors: [UIColor]? {
        guard let c = self.colors else {
            return nil
        }
        
        var colors = c
        for (index, color) in colors.enumerated() {
            colors[index] = color.adaptingSaturation(by: 0.8)
        }
        return colors
    }
}
#endif
