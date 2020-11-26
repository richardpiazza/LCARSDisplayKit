import GraphPoint
#if canImport(UIKit)
import UIKit

/// A button solely used in a 'DPad' to represent cardinal directions
open class DirectionButton: Button {
    
    open var direction: Direction = Direction()
    open override var graphable: Graphable {
        get {
            return direction
        }
        set {
            if let type = newValue as? Direction {
                direction = type
            }
        }
    }
    
    @available(*, deprecated)
    public convenience init(with frame: CGRect, direction: Direction) {
        self.init(frame: frame)
        self.direction = direction
    }
    
    // MARK: - Tappable
    override open var colors: [UIColor]? {
        return [Configuration.theme.primaryDark, Configuration.theme.primaryLight]
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

open class Direction_Button: TappableButton<Direction> {
    
    override open var colors: [UIColor]? {
        return [Configuration.theme.primaryDark, Configuration.theme.primaryLight]
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
