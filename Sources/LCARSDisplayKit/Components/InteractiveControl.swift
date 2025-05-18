import GraphPoint
import Swift2D
#if canImport(UIKit) && !os(watchOS)
import UIKit

public protocol InteractiveControlDelegate: AnyObject {
    func didTapButton(_ sender: UIButton)
}

public protocol InitializedWithoutArguments {
    init()
}

extension Crescent: InitializedWithoutArguments { }
extension Direction: InitializedWithoutArguments { }
extension EdgedCrescent: InitializedWithoutArguments { }
extension Elbow: InitializedWithoutArguments { }
extension RoundedRectangle: InitializedWithoutArguments { }
extension Wedge: InitializedWithoutArguments { }

/// Base button class
open class InteractiveControl<Shape: ExpressibleByCartesianPoints & ExpressibleByPath & InitializedWithoutArguments>: UIButton {
    
    open var shape: Shape = Shape.init() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    open var theme: Theme = TNG.shared
    open weak var delegate: InteractiveControlDelegate?
    open var behavior: Behavior? {
        willSet {
            behavior?.end(self)
        }
        didSet {
            behavior?.begin(self)
        }
    }
    
    /// The color of the element
    open var color: UIColor = TNG.shared.inactive
    
    /// A color used during active touching
    open var touchedColor: UIColor {
        return color.adaptingSaturation(by: 0.8)
    }
    
    /// Colors that are used for each of the `subpaths`
    open var colors: [UIColor]? {
        return nil
    }
    
    /// Colors used for each `subpath` used during active touching
    open var touchedColors: [UIColor]? {
        return nil
    }
    
    open override var frame: CGRect {
        didSet {
            if oldValue.size != frame.size {
                didChangeSize(Size(frame.size))
            }
        }
    }
    
    open override var bounds: CGRect {
        didSet {
            if oldValue.size != bounds.size {
                didChangeSize(Size(bounds.size))
            }
        }
    }
    
    private var _image: UIImage?
    private var _touchedImage: UIImage?
    
    public convenience init(shape: Shape, delegate: InteractiveControlDelegate? = nil) {
        self.init(frame: .zero)
        self.shape = shape
        self.delegate = delegate
        initializeSubviews()
    }
    
    open func initializeSubviews() {
        titleLabel?.font = theme.body
        setTitleColor(.black, for: .init())
    }
    
    open func didChangeSize(_ size: Size) {
        _image = nil
        _touchedImage = nil
    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 144, height: 60)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        setBackgroundImage(image(context), for: .normal)
        setBackgroundImage(touchedImage(context), for: .highlighted)
        setBackgroundImage(touchedImage(context), for: .selected)
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return shape.path.contains(point)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        delegate?.didTapButton(self)
    }
    
    /// An image generated using the shape's `path`
    open func image(_ context: CGContext?) -> UIImage? {
        if _image != nil {
            return _image
        }
        
        guard let context = context else {
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
    
    /// Constructs a `UIImage` through filling a path.
    ///
    /// - parameter context: The CoreGraphics context in which to draw the image.
    /// - parameter path: The path to draw.
    /// - parameter color: The color used to fill the path.
    static func make(in context: CGContext, with path: CGPath, color: CGColor) -> UIImage? {
        return make(in: context, with: [(path, color)])
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
