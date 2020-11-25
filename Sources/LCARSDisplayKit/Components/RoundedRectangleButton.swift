import GraphPoint
#if canImport(UIKit)
import UIKit

/// A rectangular button with options for rounding left/right edges.
@IBDesignable open class RoundedRectangleButton: Button {
    
    public static let defaultSize: CGSize = CGSize(width: 144, height: 60)
    
    @IBInspectable open var roundLeft: Bool {
        get {
            return rectangle.leftRounded
        }
        set {
            rectangle.leftRounded = newValue
        }
    }
    @IBInspectable open var roundRight: Bool {
        get {
            return rectangle.rightRounded
        }
        set {
            rectangle.rightRounded = newValue
        }
    }
    @IBInspectable open var isFrame: Bool {
        get {
            return rectangle.cornersOnly
        }
        set {
            rectangle.cornersOnly = newValue
        }
    }
    
    open override var intrinsicContentSize: CGSize {
        return type(of: self).defaultSize
    }
    
    public convenience init(with frame: CGRect, roundedRectangle: RoundedRectangle) {
        self.init(frame: frame)
        self.rectangle = roundedRectangle
    }
}
#endif
