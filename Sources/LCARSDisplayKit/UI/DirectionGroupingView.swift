import GraphPoint
#if canImport(UIKit)
import UIKit

/// The standard circular Direction-Pad found in many LCARS layouts.
@IBDesignable open class DirectionGroupingView: UIView {
    
    public typealias ButtonTapHandler = (_ button: Button?) -> Void
    
    public static var defaultCruxDiameter: CGFloat = CGFloat(60)
    
    public lazy var sector1Arc: Arc = {
        return Arc(radius: Radius(dpadRadius), dPad: .sector01)
    }()
    
    public lazy var sector2Arc: Arc = {
        return Arc(radius: Radius(dpadRadius), dPad: .sector02)
    }()
    
    public lazy var sector3Arc: Arc = {
        return Arc(radius: Radius(dpadRadius), dPad: .sector03)
    }()
    
    public lazy var sector4Arc: Arc = {
        return Arc(radius: Radius(dpadRadius), dPad: .sector04)
    }()
    
    open lazy var crux: RoundedRectangle_Button = {
        let shape = RoundedRectangle(size: .zero, leftRounded: false, rightRounded: false, cornersOnly: false)
        let button = RoundedRectangle_Button(shape: shape, tapHandler: { [weak self] (element) in
            self?.didTapButton(element)
        })
        button.color = Configuration.theme.primaryDark
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var up: Direction_Button = {
        let arc = Arc(radius: Radius(dpadRadius), startDegree: Degree(DPad.up.start), endDegree: Degree(DPad.up.end + 0.5))
        let direction = Direction(.up, arc: arc, innerRadius: innerRadius)
        let button = Direction_Button(shape: direction) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var down: Direction_Button = {
        let arc = Arc(radius: Radius(dpadRadius), startDegree: Degree(DPad.down.start - 0.5), endDegree: Degree(DPad.down.end))
        let direction = Direction(.down, arc: arc, innerRadius: innerRadius)
        let button = Direction_Button(shape: direction) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var left: Direction_Button = {
        let arc = Arc(radius: Radius(dpadRadius), startDegree: Degree(DPad.left.start - 0.5), endDegree: Degree(DPad.left.end))
        let direction = Direction(.left, arc: arc, innerRadius: innerRadius)
        let button = Direction_Button(shape: direction) { [weak self] (element) in
            self?.didTapButton(element)
        }
        button.setTitle("", for: .init())
        return button
    }()
    
    open lazy var right: Direction_Button = {
        let arc = Arc(radius: Radius(dpadRadius), startDegree: Degree(DPad.right.start), endDegree: Degree(DPad.right.end + 0.5))
        let direction = Direction(.right, arc: arc, innerRadius: innerRadius)
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
    
    public var buttonTapHandler: ButtonTapHandler?
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 350)
    }
    
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
    
    /// The width and height of the central square
    open var cruxDiameter: CGFloat {
        return DirectionGroupingView.defaultCruxDiameter * scaleRatio
    }
    
    var innerRadius: Radius {
        return (Float(cruxDiameter) / 2) + Float(Configuration.theme.defaultSpacing)
    }
    
    /// Determines the frame for each of the direction buttons.
    open func frame(for direction: Direction.Cardinal) -> CGRect {
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
    
    func frame(forSectorArc arc: Arc) -> CGRect {
        let origin = cartesianOrigin
        let arcFrame = arc.cartesianFrame
        return CGRect(CartesianFrame(x: origin.x + arcFrame.x, y: origin.y - arcFrame.y, width: arcFrame.width, height: arcFrame.height))
    }
    
    func frameForCrux() -> CGRect {
        return CGRect(x: CGFloat(cartesianOrigin.x) - (cruxDiameter / 2), y: CGFloat(cartesianOrigin.y) - (cruxDiameter / 2), width: cruxDiameter, height: cruxDiameter)
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
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        crux.frame = frameForCrux()
        up.frame = frame(for: .up)
        down.frame = frame(for: .down)
        left.frame = frame(for: .left)
        right.frame = frame(for: .right)
        sector01.frame = frame(forSectorArc: sector1Arc)
        sector02.frame = frame(forSectorArc: sector2Arc)
        sector03.frame = frame(forSectorArc: sector3Arc)
        sector04.frame = frame(forSectorArc: sector4Arc)
        
        crux.layoutIfNeeded()
        up.layoutIfNeeded()
        down.layoutIfNeeded()
        left.layoutIfNeeded()
        right.layoutIfNeeded()
        sector01.layoutIfNeeded()
        sector02.layoutIfNeeded()
        sector03.layoutIfNeeded()
        sector04.layoutIfNeeded()
    }
    
    func didTapButton(_ button: Button) {
        buttonTapHandler?(button)
    }
    
    func didTapButton<T: Graphable>(_ button: TappableButton<T>) {
        buttonTapHandler?(nil)
    }
}
#endif
