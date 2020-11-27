import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

/// The standard circular Direction-Pad found in many LCARS layouts.
@IBDesignable open class DirectionGroupingView: UIView {
    
    public typealias ButtonTapHandler = (_ button: Button?) -> Void
    
    public var buttonTapHandler: ButtonTapHandler?
    
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
        sector01.frame = frame(forShape: sector1Arc)
        sector02.frame = frame(forShape: sector2Arc)
        sector03.frame = frame(forShape: sector3Arc)
        sector04.frame = frame(forShape: sector4Arc)
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
    @available(*, deprecated, renamed: "cartesianOffset")
    open var offset: GraphOriginOffset {
        return GraphOriginOffset(cartesianOffset)
    }
    
    @available(*, deprecated, renamed: "cartesianOrigin")
    open var graphOrigin: GraphOrigin {
        return GraphOrigin(x: bounds.graphOrigin.x + offset.x, y: bounds.graphOrigin.y + offset.y)
    }
    
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
        return (Float(cruxDiameter) / 2) + Float(Configuration.theme.defaultSpacing)
    }
    
    /// Radius of the entire Direction Pad
    open var dpadRadius: CGFloat {
        return scaleRatio * 175.0
    }
    
    ///
    open var firstRingInteriorRadius: CGFloat {
        return dpadRadius + Configuration.theme.defaultSpacing
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
        return firstRingExteriorRadius + Configuration.theme.defaultSpacing
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
//        return RoundedRectangle(size: .zero, leftRounded: false, rightRounded: false, cornersOnly: false)
    }
    
    var upExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: Degree(DPad.up.start), endingDegree: Degree(DPad.up.end + 0.5))
    }
    
    var downExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: Degree(DPad.down.start - 0.5), endingDegree: Degree(DPad.down.end))
    }
    
    var leftExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: Degree(DPad.left.start - 0.5), endingDegree: Degree(DPad.left.end))
    }
    
    var rightExteriorArc: Arc {
        Arc(radius: Radius(dpadRadius), startingDegree: Degree(DPad.right.start), endingDegree: Degree(DPad.right.end + 0.5))
    }
    
    var sector1Arc: Arc {
        Arc(radius: Radius(dpadRadius), dPad: .sector01)
    }
    
    var sector2Arc: Arc {
        Arc(radius: Radius(dpadRadius), dPad: .sector02)
    }
    
    var sector3Arc: Arc {
        Arc(radius: Radius(dpadRadius), dPad: .sector03)
    }
    
    var sector4Arc: Arc {
        Arc(radius: Radius(dpadRadius), dPad: .sector04)
    }
    
    // MARK: - Components
    open lazy var crux: RoundedRectangle_Button = {
        let button = RoundedRectangle_Button(shape: cruxShape, tapHandler: { [weak self] (element) in
            self?.didTapButton(element)
        })
        button.color = Configuration.theme.primaryDark
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var up: Direction_Button = {
        let direction = Direction(.up, interiorRadius: innerRadius, exteriorArc: upExteriorArc)
        let button = Direction_Button(shape: direction) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var down: Direction_Button = {
        let direction = Direction(.down, interiorRadius: innerRadius, exteriorArc: downExteriorArc)
        let button = Direction_Button(shape: direction) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var left: Direction_Button = {
        let direction = Direction(.left, interiorRadius: innerRadius, exteriorArc: leftExteriorArc)
        let button = Direction_Button(shape: direction) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var right: Direction_Button = {
        let direction = Direction(.right, interiorRadius: innerRadius, exteriorArc: rightExteriorArc)
        let button = Direction_Button(shape: direction) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: UIControl.State())
        return button
    }()
    
    open lazy var sector01: Sector_Button = {
        let button = Sector_Button(shape: sector1Arc) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        button.color = Configuration.theme.primaryMedium
        return button
    }()
    
    open lazy var sector02: Sector_Button = {
        let button = Sector_Button(shape: sector2Arc) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        button.color = Configuration.theme.primaryMedium
        return button
    }()
    
    open lazy var sector03: Sector_Button = {
        let button = Sector_Button(shape: sector3Arc) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        button.color = Configuration.theme.primaryMedium
        return button
    }()
    
    open lazy var sector04: Sector_Button = {
        let button = Sector_Button(shape: sector4Arc) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        button.color = Configuration.theme.primaryMedium
        return button
    }()
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
                height: (dpadRadius - (cruxDiameter / 2) - Configuration.theme.defaultSpacing)
            )
        case .left, .right:
            size = CGSize(
                width: (dpadRadius - (cruxDiameter / 2) - Configuration.theme.defaultSpacing),
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
                y: CGFloat(cartesianOrigin.y) + (cruxDiameter / 2) + Configuration.theme.defaultSpacing
            )
        case .left:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x) - dpadRadius,
                y: CGFloat(cartesianOrigin.y) - (cruxDiameter / 2)
            )
        case .right:
            origin = CGPoint(
                x: CGFloat(cartesianOrigin.x) + (cruxDiameter / 2) + Configuration.theme.defaultSpacing,
                y: CGFloat(cartesianOrigin.y) - (cruxDiameter / 2)
            )
        }
        
        return CGRect(origin: origin, size: size)
    }
}

// MARK: - Interaction
extension DirectionGroupingView {
    func didTapButton(_ button: Button) {
        buttonTapHandler?(button)
    }
    
    func didTapButton<T: Graphable>(_ button: TappableButton<T>) {
        buttonTapHandler?(nil)
    }
}
#endif
