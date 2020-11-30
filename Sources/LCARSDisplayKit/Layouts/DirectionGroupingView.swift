import GraphPoint
import Swift2D
#if canImport(UIKit) && !os(watchOS)
import UIKit

/// The standard circular Direction-Pad found in many LCARS layouts.
open class DirectionGroupingView: UIView, InteractiveControlDelegate {
    
    public typealias ButtonTapHandler = (_ button: UIControl) -> Void
    
    /// Size for the standard `RoundedRectangle` control.
    public static let defaultControlSize: Size = Size(width: 144, height: 60)
    
    public var buttonTapHandler: ButtonTapHandler?
    public var theme: Theme = TNG.shared
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeSubviews()
    }
    
    public func initializeSubviews() {
        addSubview(crux)
        addSubview(up)
        addSubview(down)
        addSubview(left)
        addSubview(right)
        addSubview(sector01)
        addSubview(sector02)
        addSubview(sector03)
        addSubview(sector04)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        crux.frame = frameForCrux()
        crux.shape = cruxShape
        up.frame = frame(for: .up)
        up.shape = upShape
        down.frame = frame(for: .down)
        down.shape = downShape
        left.frame = frame(for: .left)
        left.shape = leftShape
        right.frame = frame(for: .right)
        right.shape = rightShape
        sector01.frame = frame(forShape: sector1Shape)
        sector01.shape = sector1Shape
        sector02.frame = frame(forShape: sector2Shape)
        sector02.shape = sector2Shape
        sector03.frame = frame(forShape: sector3Shape)
        sector03.shape = sector3Shape
        sector04.frame = frame(forShape: sector4Shape)
        sector04.shape = sector4Shape
    }
    
    // MARK: - Scale & Position
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 350)
    }
    
    open var intrinsicRatio: Float {
        if intrinsicContentSize.width >= intrinsicContentSize.height {
            return Float(intrinsicContentSize.width / intrinsicContentSize.height)
        } else {
            return Float(intrinsicContentSize.height / intrinsicContentSize.width)
        }
    }
    
    open var scaledContentSize: Size {
        let width = Float(bounds.size.width)
        let height = Float(bounds.size.height)
        
        if width >= height {
            return Size(width: height * intrinsicRatio, height: height)
        } else {
            return Size(width: width, height: width * intrinsicRatio)
        }
    }
    
    /// Percent to scale individual amounts by
    open var scaleRatio: Float {
        if scaledContentSize.width >= scaledContentSize.height {
            return scaledContentSize.width / Float(intrinsicContentSize.width)
        } else {
            return scaledContentSize.height / Float(intrinsicContentSize.height)
        }
    }
    
    // {x: 0.0, y: 0.0}
    open var cartesianOffset: CartesianFrame.Offset {
        return .zero
    }
    
    /// The origin of the plane used for calculations. This includes the _offset_.
    open var cartesianOrigin: CartesianPoint {
        var origin = CartesianPlane(bounds).cartesianOrigin
        origin.x += cartesianOffset.x
        origin.y += cartesianOffset.y
        return origin
    }
    
    // MARK: - Measurements
    
    public static var defaultCruxDiameter: Float = 60.0
    
    /// The width and height of the central square
    open var cruxDiameter: Float {
        return Self.defaultCruxDiameter * scaleRatio
    }
    
    var innerRadius: Radius {
        return (cruxDiameter / 2) + Float(theme.defaultSpacing)
    }
    
    /// Radius of the entire Direction Pad
    open var dpadRadius: Radius {
        return scaleRatio * 175.0
    }
    
    ///
    open var firstRingInteriorRadius: Radius {
        return dpadRadius + Float(theme.defaultSpacing)
    }
    
    ///
    open var firstRingExteriorRadius: Radius {
        return firstRingInteriorRadius + (scaleRatio * 80.0)
    }
    
    ///
    open var firstRingEdgeExteriorRadius: Radius {
        return firstRingExteriorRadius
    }
    
    ///
    open var secondRingInteriorRadius: Radius {
        return firstRingExteriorRadius + Float(theme.defaultSpacing)
    }
    
    ///
    open var secondRingExteriorRadius: Radius {
        return secondRingInteriorRadius + (scaleRatio * 50.0)
    }
    
    ///
    open var secondRingExtendedExteriorRadius: Radius {
        return secondRingInteriorRadius + (scaleRatio * 110.0)
    }
    
    // MARK: - Shapes
    var cruxShape: RoundedRectangle {
        let x = cartesianOrigin.x - (cruxDiameter / 2)
        let y = cartesianOrigin.y - (cruxDiameter / 2)
        let width = cruxDiameter
        let height = cruxDiameter
        
        let topLeft: Point = .init(x: x, y: y)
        let bottomRight: Point = .init(x: x + width, y: y + height)
        
        let plane = CartesianPlane(bounds)
        let first = plane.cartesianPoint(for: topLeft)
        let second = plane.cartesianPoint(for: bottomRight)
        
        return RoundedRectangle(cartesianPoints: [first, second])
    }
    
    var upShape: Direction {
        let arc = Arc(radius: dpadRadius, startingDegree: DPad.up.start, endingDegree: DPad.up.end + 0.5)
        return Direction(.up, interiorRadius: innerRadius, exteriorArc: arc)
    }
    
    var downShape: Direction {
        let arc = Arc(radius: dpadRadius, startingDegree: DPad.down.start - 0.5, endingDegree: DPad.down.end)
        return Direction(.down, interiorRadius: innerRadius, exteriorArc: arc)
    }
    
    var leftShape: Direction {
        let arc = Arc(radius: dpadRadius, startingDegree: DPad.left.start - 0.5, endingDegree: DPad.left.end)
        return Direction(.left, interiorRadius: innerRadius, exteriorArc: arc)
    }
    
    var rightShape: Direction {
        let arc = Arc(radius: dpadRadius, startingDegree: DPad.right.start, endingDegree: DPad.right.end + 0.5)
        return Direction(.right, interiorRadius: innerRadius, exteriorArc: arc)
    }
    
    var sector1Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: dpadRadius, dPad: .sector01))
    }
    
    var sector2Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: dpadRadius, dPad: .sector02))
    }
    
    var sector3Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: dpadRadius, dPad: .sector03))
    }
    
    var sector4Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: dpadRadius, dPad: .sector04))
    }
    
    // MARK: - Components
    open lazy var crux: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: cruxShape, delegate: self)
        button.color = theme.primaryDark
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var up: DirectionControl = {
        let button = DirectionControl(shape: upShape, delegate: self)
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var down: DirectionControl = {
        let button = DirectionControl(shape: downShape, delegate: self)
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var left: DirectionControl = {
        let button = DirectionControl(shape: leftShape, delegate: self)
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var right: DirectionControl = {
        let button = DirectionControl(shape: rightShape, delegate: self)
        button.setTitle("", for: UIControl.State())
        return button
    }()
    
    open lazy var sector01: WedgeControl = {
        let button = WedgeControl(shape: sector1Shape, delegate: self)
        button.setTitle("", for: .init())
        button.color = theme.primaryMedium
        return button
    }()
    
    open lazy var sector02: WedgeControl = {
        let button = WedgeControl(shape: sector2Shape, delegate: self)
        button.setTitle("", for: .init())
        button.color = theme.primaryMedium
        return button
    }()
    
    open lazy var sector03: WedgeControl = {
        let button = WedgeControl(shape: sector3Shape, delegate: self)
        button.setTitle("", for: .init())
        button.color = theme.primaryMedium
        return button
    }()
    
    open lazy var sector04: WedgeControl = {
        let button = WedgeControl(shape: sector4Shape, delegate: self)
        button.setTitle("", for: .init())
        button.color = theme.primaryMedium
        return button
    }()
    
    // MARK - TappableButtonDelegate
    public func didTapButton(_ sender: UIButton) {
        buttonTapHandler?(sender)
    }
}

// MARK: - Frame Calculations
extension DirectionGroupingView {
    func frameForCrux() -> CGRect {
        return CGRect(
            Rect(
                x: cartesianOrigin.x - (cruxDiameter / 2),
                y: cartesianOrigin.y - (cruxDiameter / 2),
                width: cruxDiameter,
                height: cruxDiameter
            )
        )
    }
    
    /// Calculates the frame for the shape taking into account the offset.
    ///
    /// Duplications of `CartesianPlane(bounds).rect(for: frame)` logic.
    func frame<Shape: ExpressibleByCartesianPoints>(forShape shape: Shape) -> CGRect {
        let origin = cartesianOrigin
        let frame = shape.cartesianFrame
        let rect = Rect(
            origin: Point(
                x: origin.x + frame.x,
                y: origin.y - frame.y
            ),
            size: frame.size
        )
        return CGRect(rect)
    }
    
    /// Determines the frame for each of the direction buttons.
    func frame(for direction: Direction.Cardinal) -> CGRect {
        var size: CGSize
        switch direction {
        case .up, .down:
            size = CGSize(
                width: CGFloat(cruxDiameter),
                height: CGFloat(dpadRadius - (cruxDiameter / 2)) - theme.defaultSpacing
            )
        case .left, .right:
            size = CGSize(
                width: CGFloat(dpadRadius - (cruxDiameter / 2)) - theme.defaultSpacing,
                height: CGFloat(cruxDiameter)
            )
        }
        
        var origin: CGPoint
        switch direction {
        case .up:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x - (cruxDiameter / 2)),
                y: CGFloat(cartesianOrigin.y - dpadRadius)
            )
        case .down:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x - (cruxDiameter / 2)),
                y: CGFloat(cartesianOrigin.y + (cruxDiameter / 2)) + theme.defaultSpacing
            )
        case .left:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x - dpadRadius),
                y: CGFloat(cartesianOrigin.y - (cruxDiameter / 2))
            )
        case .right:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x + (cruxDiameter / 2)) + theme.defaultSpacing,
                y: CGFloat(cartesianOrigin.y - (cruxDiameter / 2))
            )
        }
        
        return CGRect(origin: origin, size: size)
    }
}
#endif
