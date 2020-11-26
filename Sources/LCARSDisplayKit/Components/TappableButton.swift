#if canImport(UIKit)
import UIKit

/// Base button class
open class TappableButton<Shape: Graphable>: UIButton {
    
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
            shape?.size = frame.size
        }
    }
    
    open var tapHandler: TapHandler?
    
    @IBInspectable open var color: UIColor = Configuration.theme.inactive
    
    public init(shape: Shape, tapHandler: TapHandler? = nil) {
        super.init(frame: .zero)
        self.shape = shape
        self.tapHandler = tapHandler
        
        self.shape?.size = frame.size
        
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
        
        shape?.size = rect.size
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.image(context), for: .init())
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return shape?.path.contains(point) ?? false
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
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
    
    var touchedColor: UIColor {
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
            return UIImage.image(with: paths, colors: colors, size: shape.size, context: context)
        }
        
        return UIImage.image(with: shape.path, fillColor: self.color, context: context)
    }
    
    /// An image generated using the shape's `path` and substituting the `touchedColor`.
    open func touchedImage(_ context: CGContext?) -> UIImage? {
        guard let shape = self.shape else {
            return nil
        }
        
        if let paths = shape.subpaths, let colors = self.touchedColors {
            return UIImage.image(with: paths, colors: colors, size: shape.size, context: context)
        }
        
        return UIImage.image(with: shape.path, fillColor: self.touchedColor, context: context)
    }
}
#endif
