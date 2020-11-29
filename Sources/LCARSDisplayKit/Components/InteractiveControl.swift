import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

public protocol InteractiveControlDelegate: class {
    func didTapButton(_ sender: UIButton)
}

/// Base button class
open class InteractiveControl<Shape: ExpressibleByCartesianPoints & ExpressibleByPath>: UIButton {
    
    public typealias TapHandler = (_ button: InteractiveControl<Shape>) -> Void
    
    open var shape: Shape?
    open var theme: Theme = TNG.shared
    open weak var delegate: InteractiveControlDelegate?
    open var tapHandler: TapHandler?
    open var behavior: Behavior? {
        willSet {
            behavior?.end(self)
        }
        didSet {
            behavior?.begin(self)
        }
    }
    
    /// The color of the element
    @IBInspectable open var color: UIColor = TNG.shared.inactive
    
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
    
    open override var bounds: CGRect {
        didSet {
            if oldValue.size != bounds.size {
                _image = nil
                _touchedImage = nil
            }
        }
    }
    
    private var _image: UIImage?
    private var _touchedImage: UIImage?
    
    public init(shape: Shape, delegate: InteractiveControlDelegate? = nil, tapHandler: TapHandler? = nil) {
        super.init(frame: .zero)
        initializeSubviews()
        self.shape = shape
        self.delegate = delegate
        self.tapHandler = tapHandler
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }
    
    public func initializeSubviews() {
        titleLabel?.font = theme.body
        setTitleColor(.black, for: .init())
    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 144, height: 60)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(image(context), for: .init())
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let shape = self.shape else {
            return false
        }
        
        return shape.path.contains(point)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        delegate?.didTapButton(self)
        tapHandler?(self)
        
        let size = bounds.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        setBackgroundImage(touchedImage(context), for: UIControl.State())
        UIGraphicsEndImageContext()
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let size = bounds.size
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        setBackgroundImage(image(context), for: UIControl.State())
        UIGraphicsEndImageContext()
        
        super.touchesEnded(touches, with: event)
    }
    
    /// An image generated using the shape's `path`
    open func image(_ context: CGContext?) -> UIImage? {
        if _image != nil {
            return _image
        }
        
        guard let context = context else {
            return nil
        }
        
        guard let shape = self.shape else {
            return nil
        }
        
        switch (shape.subpaths, colors) {
        case (.some(let subpaths), .some(let subpathColors)):
            let pathsAndColors = subpaths.enumerated().map { (idx, path) -> (CGPath, CGColor) in
                if subpathColors.count > idx {
                    return (path, subpathColors[idx].cgColor)
                } else {
                    return (path, color.cgColor)
                }
            }
            _image = UIImage.make(in: context, with: pathsAndColors)
        default:
            _image = UIImage.make(in: context, with: shape.path, color: color.cgColor)
        }
        
        return _image
    }
    
    /// An image generated using the shape's `path` and substituting the `touchedColor`.
    open func touchedImage(_ context: CGContext?) -> UIImage? {
        if _touchedImage != nil {
            return _touchedImage
        }
        
        guard let context = context else {
            return nil
        }
        
        guard let shape = self.shape else {
            return nil
        }
        
        switch (shape.subpaths, touchedColors) {
        case (.some(let subpaths), .some(let subpathColors)):
            let pathsAndColors = subpaths.enumerated().map { (idx, path) -> (CGPath, CGColor) in
                if subpathColors.count > idx {
                    return (path, subpathColors[idx].cgColor)
                } else {
                    return (path, touchedColor.cgColor)
                }
            }
            _touchedImage = UIImage.make(in: context, with: pathsAndColors)
        default:
            _touchedImage = UIImage.make(in: context, with: shape.path, color: touchedColor.cgColor)
        }
        
        return _touchedImage
    }
}

extension UIImage {
    /// Constructs a `UIImage` through filling a path.
    ///
    /// - parameter context: The CoreGraphics context in which to draw the image.
    /// - parameter path: The path to draw.
    /// - parameter color: The color used to fill the path.
    static func make(in context: CGContext, with path: CGPath, color: CGColor) -> UIImage? {
        context.setLineWidth(0.0)
        context.setFillColor(color)
        context.addPath(path)
        context.fillPath()
        
        switch context.makeImage() {
        case .some(let image):
            return UIImage(cgImage: image)
        case .none:
            return nil
        }
    }
    
    /// Constructs a `UIImage` through filling multiple paths.
    ///
    /// - parameter context: The CoreGraphics context in which to draw the image.
    /// - parameter pathsAndColors: The path and color combinations that will be drawn.
    static func make(in context: CGContext, with pathsAndColors: [(CGPath, CGColor)]) -> UIImage? {
        context.setLineWidth(0.0)
        pathsAndColors.forEach { (path, color) in
            context.setFillColor(color)
            context.addPath(path)
            context.fillPath()
        }
        
        switch context.makeImage() {
        case .some(let image):
            return UIImage(cgImage: image)
        case .none:
            return nil
        }
    }
}

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
