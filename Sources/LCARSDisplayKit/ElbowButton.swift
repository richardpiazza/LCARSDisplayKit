#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint

/// A large sweeping button typically used to group other buttons.
@IBDesignable open class ElbowButton: Button {
    
    open var elbow: Elbow = Elbow()
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
        get {
            return elbow.top
        }
        set {
            elbow.top = newValue
        }
    }
    @IBInspectable open var left: Bool {
        get {
            return elbow.left
        }
        set {
            elbow.left = newValue
        }
    }
    @IBInspectable open var rounded: Bool {
        get {
            return elbow.rounded
        }
        set {
            elbow.rounded = newValue
        }
    }
    @IBInspectable open var horizontalHeight: CGFloat {
        get {
            return elbow.horizontalHeight
        }
        set {
            elbow.horizontalHeight = newValue
        }
    }
    @IBInspectable open var verticalWidth: CGFloat {
        get {
            return elbow.verticalWidth
        }
        set {
            elbow.verticalWidth = newValue
        }
    }
    @IBInspectable open var closedHeight: CGFloat {
        get {
            return elbow.closedHeight
        }
        set {
            elbow.closedHeight = newValue
        }
    }
    @IBInspectable open var matchRadius: Bool {
        get {
            return elbow.shouldMatchRadius
        }
        set {
            elbow.shouldMatchRadius = newValue
        }
    }
    
    convenience init(frame: CGRect, elbow: Elbow) {
        self.init(frame: frame)
        self.elbow = elbow
    }
}

#endif
