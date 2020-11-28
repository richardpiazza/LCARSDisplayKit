import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

/// The standard circular Direction-Pad found in many LCARS layouts.
@IBDesignable open class DirectionGroupingView: UIView, InteractiveControlDelegate {
    
    public typealias ButtonTapHandler = (_ button: UIControl) -> Void
    
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
        
        crux.frame = frameForCrux() // frame(forShape: cruxShape)
        up.frame = frame(for: .up)
        down.frame = frame(for: .down)
        left.frame = frame(for: .left)
        right.frame = frame(for: .right)
        sector01.frame = frame(forShape: sector1Shape)
        sector02.frame = frame(forShape: sector2Shape)
        sector03.frame = frame(forShape: sector3Shape)
        sector04.frame = frame(forShape: sector4Shape)
    }
    
    // MARK: - Scale & Position
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 350)
    }
    
    open var intrinsicRatio: CGFloat{
        if intrinsicContentSize.width >= intrinsicContentSize.height {
            return intrinsicContentSize.width / intrinsicContentSize.height
        } else {
            return intrinsicContentSize.height / intrinsicContentSize.width
        }
    }
    
    open var scaledContentSize: CGSize {
        if self.bounds.size.width >= self.bounds.size.height {
            return CGSize(width: self.bounds.height * intrinsicRatio, height: self.bounds.height)
        } else {
            return CGSize(width: self.bounds.width, height: self.bounds.width * intrinsicRatio)
        }
    }
    
    /// Percent to scale individual amounts by
    open var scaleRatio: CGFloat {
        if scaledContentSize.width >= scaledContentSize.height {
            return scaledContentSize.width / intrinsicContentSize.width
        } else {
            return scaledContentSize.height / intrinsicContentSize.height
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
    
    public static var defaultCruxDiameter: CGFloat = CGFloat(60)
    
    /// The width and height of the central square
    open var cruxDiameter: CGFloat {
        return Self.defaultCruxDiameter * scaleRatio
    }
    
    var innerRadius: Radius {
        return (Float(cruxDiameter) / 2) + Float(theme.defaultSpacing)
    }
    
    /// Radius of the entire Direction Pad
    open var dpadRadius: CGFloat {
        return scaleRatio * 175.0
    }
    
    ///
    open var firstRingInteriorRadius: CGFloat {
        return dpadRadius + theme.defaultSpacing
    }
    
    ///
    open var firstRingExteriorRadius: CGFloat {
        return firstRingInteriorRadius + (scaleRatio * 80.0)
    }
    
    ///
    open var firstRingEdgeExteriorRadius: CGFloat {
        return firstRingExteriorRadius
    }
    
    ///
    open var secondRingInteriorRadius: CGFloat {
        return firstRingExteriorRadius + theme.defaultSpacing
    }
    
    ///
    open var secondRingExteriorRadius: CGFloat {
        return secondRingInteriorRadius + (scaleRatio * 50.0)
    }
    
    ///
    open var secondRingExtendedExteriorRadius: CGFloat {
        return secondRingInteriorRadius + (scaleRatio * 110.0)
    }
    
    // MARK: - Shapes
    var cruxShape: RoundedRectangle {
        let x = cartesianOrigin.x - (Float(cruxDiameter) / 2)
        let y = cartesianOrigin.y - (Float(cruxDiameter) / 2)
        let width = Float(cruxDiameter)
        let height = Float(cruxDiameter)
        
        let topLeft: Point = .init(x: x, y: y)
        let bottomRight: Point = .init(x: x + width, y: y + height)
        
        let plane = CartesianPlane(bounds)
        let first = plane.cartesianPoint(for: topLeft)
        let second = plane.cartesianPoint(for: bottomRight)
        
        return RoundedRectangle(cartesianPoints: [first, second])
    }
    
    var upExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: DPad.up.start, endingDegree: DPad.up.end + 0.5)
    }
    
    var downExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: DPad.down.start - 0.5, endingDegree: DPad.down.end)
    }
    
    var leftExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: DPad.left.start - 0.5, endingDegree: DPad.left.end)
    }
    
    var rightExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: DPad.right.start, endingDegree: DPad.right.end + 0.5)
    }
    
    var sector1Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: Radius(dpadRadius), dPad: .sector01))
    }
    
    var sector2Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: Radius(dpadRadius), dPad: .sector02))
    }
    
    var sector3Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: Radius(dpadRadius), dPad: .sector03))
    }
    
    var sector4Shape: Wedge {
        Wedge(exteriorArc: Arc(radius: Radius(dpadRadius), dPad: .sector04))
    }
    
    // MARK: - Components
    open lazy var crux: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: cruxShape, delegate: self)
        button.color = theme.primaryDark
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var up: DirectionControl = {
        let direction = Direction(.up, interiorRadius: innerRadius, exteriorArc: upExteriorArc)
        let button = DirectionControl(shape: direction, delegate: self)
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var down: DirectionControl = {
        let direction = Direction(.down, interiorRadius: innerRadius, exteriorArc: downExteriorArc)
        let button = DirectionControl(shape: direction, delegate: self)
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var left: DirectionControl = {
        let direction = Direction(.left, interiorRadius: innerRadius, exteriorArc: leftExteriorArc)
        let button = DirectionControl(shape: direction, delegate: self)
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var right: DirectionControl = {
        let direction = Direction(.right, interiorRadius: innerRadius, exteriorArc: rightExteriorArc)
        let button = DirectionControl(shape: direction, delegate: self)
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
        return CGRect(x: CGFloat(cartesianOrigin.x) - (cruxDiameter / 2), y: CGFloat(cartesianOrigin.y) - (cruxDiameter / 2), width: cruxDiameter, height: cruxDiameter)
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
                width: cruxDiameter,
                height: (dpadRadius - (cruxDiameter / 2) - theme.defaultSpacing)
            )
        case .left, .right:
            size = CGSize(
                width: (dpadRadius - (cruxDiameter / 2) - theme.defaultSpacing),
                height: cruxDiameter
            )
        }
        
        var origin: CGPoint
        switch direction {
        case .up:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x) - (cruxDiameter / 2),
                y: CGFloat(cartesianOrigin.y) - dpadRadius
            )
        case .down:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x) - (cruxDiameter / 2),
                y: CGFloat(cartesianOrigin.y) + (cruxDiameter / 2) + theme.defaultSpacing
            )
        case .left:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x) - dpadRadius,
                y: CGFloat(cartesianOrigin.y) - (cruxDiameter / 2)
            )
        case .right:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x) + (cruxDiameter / 2) + theme.defaultSpacing,
                y: CGFloat(cartesianOrigin.y) - (cruxDiameter / 2)
            )
        }
        
        return CGRect(origin: origin, size: size)
    }
}
#endif
