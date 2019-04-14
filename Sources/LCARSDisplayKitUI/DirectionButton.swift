#if canImport(LCARSDisplayKit)
import LCARSDisplayKit
#endif
#if (os(iOS) || os(tvOS))
import UIKit
import GraphPoint

/// A button soley used in a 'DPad' to represent cardinal directions
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
    
    public convenience init(with frame: CGRect, direction: Direction) {
        self.init(frame: frame)
        self.direction = direction
    }
    
//    convenience init(with direction: Direction, rect: CGRect, offset: GraphOriginOffset) {
//        let exteriorRadius = direction.arc.radius
//        let frame = rect.frame(graphFrame: direction.graphFrame, offset: offset)
//        self.init(frame: frame)
//        self.direction = direction
//    }
    
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

#endif
