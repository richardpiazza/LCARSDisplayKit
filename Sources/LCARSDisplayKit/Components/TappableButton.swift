import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

public protocol TappableButtonDelegate: class {
    func didTapButton(_ sender: UIButton)
}

/// Base button class
open class TappableButton<Shape: ExpressibleByCartesianPoints & ExpressibleByPath>: UIButton {
    
    public typealias TapHandler = (_ button: TappableButton<Shape>) -> Void
    
    open var shape: Shape?
    
    open var behavior: Behavior? {
        willSet {
            behavior?.end(self)
        }
        didSet {
            behavior?.begin(self)
        }
    }
    
    open override var frame: CGRect {
        didSet {
//            shape?.size = frame.size
        }
    }
    
    open weak var delegate: TappableButtonDelegate?
    open var tapHandler: TapHandler?
    
    /// The color of the element
    @IBInspectable open var color: UIColor = Configuration.theme.inactive
    
    public init(shape: Shape, delegate: TappableButtonDelegate? = nil, tapHandler: TapHandler? = nil) {
        super.init(frame: .zero)
        self.shape = shape
        self.delegate = delegate
        self.tapHandler = tapHandler
        
//        self.shape?.size = frame.size
        
        titleLabel?.font = Configuration.theme.body
        setTitleColor(.black, for: .init())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.font = Configuration.theme.body
        self.setTitleColor(.black, for: .init())
    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 144, height: 60)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
//        shape?.size = rect.size
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.image(context), for: .init())
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return shape?.path.contains(point) ?? false
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        delegate?.didTapButton(self)
        tapHandler?(self)
        
        let size = self.bounds.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.touchedImage(context), for: UIControl.State())
        UIGraphicsEndImageContext()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let size = self.bounds.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.image(context), for: UIControl.State())
        UIGraphicsEndImageContext()
        
        super.touchesEnded(touches, with: event)
    }
    
    /// Colors that are used for each of the `subpaths`
    open var colors: [UIColor]? {
        return nil
    }
    
    /// A color used during active touching
    open var touchedColor: UIColor {
        return self.color.adaptingSaturation(by: 0.8)
    }
    
    /// Colors used for each `subpath` used during active touching
    open var touchedColors: [UIColor]? {
        return nil
    }
    
    /// An image generated using the shape's `path`
    open func image(_ context: CGContext?) -> UIImage? {
        guard let shape = self.shape else {
            return nil
        }
        
        if let paths = shape.subpaths, let colors = self.colors {
//            let _size = shape.cartesianFrame.size
//            shape.size
            let _size = bounds.size
            return UIImage.image(with: paths, colors: colors, size: _size, context: context)
        }
        
        return UIImage.image(with: shape.path, fillColor: self.color, context: context)
    }
    
    /// An image generated using the shape's `path` and substituting the `touchedColor`.
    open func touchedImage(_ context: CGContext?) -> UIImage? {
        guard let shape = self.shape else {
            return nil
        }
        
        if let paths = shape.subpaths, let colors = self.touchedColors {
//            let _size = shape.cartesianFrame.size
//            shape.size
            let _size = bounds.size
            return UIImage.image(with: paths, colors: colors, size: _size, context: context)
        }
        
        return UIImage.image(with: shape.path, fillColor: self.touchedColor, context: context)
    }
}

// MARK: - Subclasses

open class Sector_Button: TappableButton<Arc> {
    
}

open class Crescent_Button: TappableButton<Crescent> {
    
}

open class EdgedCrescent_Button: TappableButton<EdgedCrescent> {
    
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

open class RoundedRectangle_Button: TappableButton<RoundedRectangle> {

    open override var intrinsicContentSize: CGSize {
        return CGSize(RoundedRectangle.defaultSize)
    }
    
    @IBInspectable open var roundLeft: Bool {
        get { shape?.leftRounded ?? true }
        set { shape?.leftRounded = newValue }
    }
    
    @IBInspectable open var roundRight: Bool {
        get { shape?.rightRounded ?? true }
        set { shape?.rightRounded = newValue }
    }
    
    @IBInspectable open var isFrame: Bool {
        get { shape?.cornersOnly ?? false }
        set { shape?.cornersOnly = newValue }
    }
    
}

@IBDesignable open class Elbow_Button: TappableButton<Elbow> {
    
    @IBInspectable open var top: Bool {
        get { shape?.top ?? true }
        set { shape?.top = newValue }
    }
    
    @IBInspectable open var left: Bool {
        get { shape?.left ?? true }
        set { shape?.left = newValue }
    }
    
    @IBInspectable open var rounded: Bool {
        get { shape?.rounded ?? true }
        set { shape?.rounded = newValue }
    }
    
    @IBInspectable open var horizontalHeight: CGFloat {
        get { CGFloat(shape?.horizontalHeight ?? Elbow.defaultHorizontalHeight) }
        set { shape?.horizontalHeight = Float(newValue) }
    }
    
    @IBInspectable open var verticalWidth: CGFloat {
        get { CGFloat(shape?.verticalWidth ?? Elbow.defaultVerticalWidth) }
        set { shape?.verticalWidth = Float(newValue) }
    }
    
    @IBInspectable open var closedHeight: CGFloat {
        get { CGFloat(shape?.closedHeight ?? Elbow.defaultClosedHeight) }
        set { shape?.closedHeight = Float(newValue) }
    }
    
    @IBInspectable open var matchRadius: Bool {
        get { shape?.shouldMatchRadius ?? false }
        set { shape?.shouldMatchRadius = newValue }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        shape = Elbow(size: Size(bounds.size))
    }
}
#endif
