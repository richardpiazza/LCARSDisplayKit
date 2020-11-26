#if canImport(UIKit)
import UIKit

/// Base button class
open class Button: UIButton, Tappable {
    public typealias TapHandler = (_ button: Button) -> Void
    
    open var rectangle: RoundedRectangle = RoundedRectangle()
    open var graphable: Graphable {
        get {
            return rectangle
        }
        set {
            if let type = newValue as? RoundedRectangle {
                rectangle = type
            }
        }
    }
    open var behavior: Behavior? {
        willSet {
            behavior?.end(self)
        }
        didSet {
            behavior?.begin(self)
        }
    }
    
    open var tapHandler: TapHandler?
    
    @IBInspectable open var color: UIColor = Configuration.theme.inactive
    
    public init(frame: CGRect, tapHandler: TapHandler? = nil) {
        super.init(frame: frame)
        graphable.size = frame.size
        self.tapHandler = tapHandler
        titleLabel?.font = Configuration.theme.body
        setTitleColor(.black, for: .init())
    }
    
    @available(*, deprecated, renamed: "init(frame:font:tapHandler:)")
    public override init(frame: CGRect) {
        super.init(frame: frame)
        graphable.size = frame.size
        self.titleLabel?.font = Configuration.theme.body
        self.setTitleColor(UIColor.black, for: UIControl.State())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.font = Configuration.theme.body
        self.setTitleColor(UIColor.black, for: UIControl.State())
    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 144, height: 60)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        graphable.size = rect.size
        let context = UIGraphicsGetCurrentContext()
        self.setBackgroundImage(self.image(context), for: UIControl.State())
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return path.contains(point)
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
    
    // - MARK: Tappable    
    open var colors: [UIColor]? {
        return nil
    }
    
    open var touchedColors: [UIColor]? {
        return nil
    }
}
#endif
