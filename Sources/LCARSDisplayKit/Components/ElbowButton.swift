import GraphPoint
#if canImport(UIKit)
import UIKit

/// A large sweeping button typically used to group other buttons.
@IBDesignable open class ElbowButton: Button {
    
    open var elbow: Elbow = Elbow(size: .zero)
    open override var graphable: Graphable {
        get {
            return elbow
        }
        set {
            if let type = newValue as? Elbow {
                elbow = type
            }
        }
    }
    
    @IBInspectable open var top: Bool {
        get { elbow.top }
        set { elbow.top = newValue }
    }
    
    @IBInspectable open var left: Bool {
        get { elbow.left }
        set { elbow.left = newValue }
    }
    
    @IBInspectable open var rounded: Bool {
        get { elbow.rounded }
        set { elbow.rounded = newValue }
    }
    
    @IBInspectable open var horizontalHeight: CGFloat {
        get { CGFloat(elbow.horizontalHeight) }
        set { elbow.horizontalHeight = Float(newValue) }
    }
    
    @IBInspectable open var verticalWidth: CGFloat {
        get { CGFloat(elbow.verticalWidth) }
        set { elbow.verticalWidth = Float(newValue) }
    }
    
    @IBInspectable open var closedHeight: CGFloat {
        get { CGFloat(elbow.closedHeight) }
        set { elbow.closedHeight = Float(newValue) }
    }
    
    @IBInspectable open var matchRadius: Bool {
        get { elbow.shouldMatchRadius }
        set { elbow.shouldMatchRadius = newValue }
    }
    
    @available(*, deprecated)
    public convenience init(frame: CGRect, elbow: Elbow) {
        self.init(frame: frame)
        self.elbow = elbow
    }
}
#endif
