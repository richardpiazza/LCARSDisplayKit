import GraphPoint
#if canImport(UIKit)
import UIKit

/// An expansion of the `DirectionGroupingView` with surrounding buttons.
/// This particular layout comes from the small Tactical station behind the command
/// chairs on the USS Voyager.
@IBDesignable open class DirectionGroupingView03: DirectionGroupingView {
    
    public override func initializeSubviews() {
        super.initializeSubviews()
        
        addSubview(innerRing01)
        addSubview(innerRing08)
        addSubview(innerRing09)
        addSubview(innerRing10)
        addSubview(innerRing11)
        addSubview(innerRing13)
        addSubview(innerRing14)
        addSubview(innerRing15)
        addSubview(innerRing16)
        addSubview(innerRing17)
        addSubview(innerRing20)
        addSubview(outerRing09)
        addSubview(outerRing10)
        addSubview(outerRing11)
        addSubview(outerRing12)
        addSubview(outerRing13)
        addSubview(outerRing18Extended)
        addSubview(outerRing19Extended)
        addSubview(outerRing20Extended)
        addSubview(edge04)
        addSubview(edge05)
        addSubview(top00)
        
        crux.color = theme.tertiaryLight
        sector01.color = theme.inactive
        sector02.color = theme.inactive
        sector03.color = theme.inactive
        sector04.color = theme.inactive
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        innerRing01.frame = frame(forShape: innerRing01Shape)
        innerRing08.frame = frame(forShape: innerRing08Shape)
        innerRing09.frame = frame(forShape: innerRing09Shape)
        innerRing10.frame = frame(forShape: innerRing10Shape)
        innerRing11.frame = frame(forShape: innerRing11Shape)
        innerRing13.frame = frame(forShape: innerRing13Shape)
        innerRing14.frame = frame(forShape: innerRing14Shape)
        innerRing15.frame = frame(forShape: innerRing15Shape)
        innerRing16.frame = frame(forShape: innerRing16Shape)
        innerRing17.frame = frame(forShape: innerRing17Shape)
        innerRing20.frame = frame(forShape: innerRing20Shape)
        outerRing09.frame = frame(forShape: outerRing09Shape)
        outerRing10.frame = frame(forShape: outerRing10Shape)
        outerRing11.frame = frame(forShape: outerRing11Shape)
        outerRing12.frame = frame(forShape: outerRing12Shape)
        outerRing13.frame = frame(forShape: outerRing13Shape)
        outerRing18Extended.frame = frame(forShape: outerRing18ExtendedShape)
        outerRing19Extended.frame = frame(forShape: outerRing19ExtendedShape)
        outerRing20Extended.frame = frame(forShape: outerRing20ExtendedShape)
        edge04.frame = frame(forShape: edge04Shape)
        edge05.frame = frame(forShape: edge05Shape)
        top00.frame = frameForTop00()
    }
    
    // MARK: - Scale & Position
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 715, height: 520)
    }
    
    // {-27.0, 79.0}
    open override var cartesianOffset: CartesianFrame.Offset {
        return .init(x: Float(-(scaledContentSize.width * 0.0366)), y: Float(scaledContentSize.height * 0.14))
    }
    
    open var secondRingEdgeExteriorRadius: CGFloat {
        return secondRingInteriorRadius + (scaleRatio * 62.0)
    }
    
    open var thirdRingInteriorRadius: CGFloat {
        return secondRingExteriorRadius + theme.defaultSpacing
    }
    
    open var thirdRingExteriorRadius: CGFloat {
        return thirdRingInteriorRadius + (scaleRatio * 45.0)
    }
    
    // MARK: - Shapes
    
    var innerRing01Shape: Crescent {
        let half = DPad.arc02.start + ((DPad.arc02.end - DPad.arc02.start) / 2)
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: DPad.arc01.start + 1.5, endingDegree: half)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startingDegree: DPad.arc01.start - 2.0, endingDegree: half)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: true, extendExteriorEnd: false)
    }
    
    var innerRing08Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc08)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc08)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing09Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc09)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc09)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing10Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc10)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc10)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing11Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc11)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc11)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing13Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc13)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc13)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing14Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: DPad.arc14.start, endingDegree: DPad.arc14.end - 1.0)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startingDegree: DPad.arc14.start, endingDegree: DPad.arc14.end - 1.0)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: false, extendExteriorEnd: true)
    }
    
    var innerRing15Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: DPad.arc15.start - 0.5, endingDegree: DPad.arc15.end + 0.5)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startingDegree: DPad.arc15.start - 0.5, endingDegree: DPad.arc15.end + 0.5)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: true, extendExteriorEnd: true)
    }
    
    var innerRing16Shape: Crescent {
        let half = DPad.arc17.start + ((DPad.arc17.end - DPad.arc17.start) / 2)
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: DPad.arc16.start + 1.0, endingDegree: half)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startingDegree: DPad.arc16.start - 2.0, endingDegree: half)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: true, extendExteriorEnd: false)
    }
    
    var innerRing17Shape: Crescent {
        let half = DPad.arc17.start + ((DPad.arc17.end - DPad.arc17.start) / 2) + 1.5
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: half, endingDegree: DPad.arc19.end - 1.5)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startingDegree: half, endingDegree: DPad.arc19.end + 2.0)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: false, extendExteriorEnd: true)
    }
    
    var innerRing20Shape: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc20)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc20)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: true, extendExteriorEnd: true)
    }
    
    var outerRing09Shape: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc09)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc09)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing10Shape: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc10)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc10)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing11Shape: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc11)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc11)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing12Shape: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc12)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc12)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing13Shape: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc13)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc13)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing18ExtendedShape: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc18)
        let outerArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc18)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing19ExtendedShape: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), startingDegree: DPad.arc19.start, endingDegree: DPad.arc19.end + 2.0)
        let outerArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), startingDegree: DPad.arc19.start, endingDegree: DPad.arc19.end + 2.0)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: false, extendExteriorEnd: true)
    }
    
    var outerRing20ExtendedShape: Crescent {
        let shape = innerRing20Shape
        var startPoint = shape.exteriorArcStartingPoint
        startPoint.x += Float(secondRingInteriorRadius - firstRingExteriorRadius)
        let startDegree = try! Degree.make(for: startPoint)
        var endPoint = shape.exteriorArcEndingPoint
        endPoint.x += Float(secondRingInteriorRadius - firstRingExteriorRadius)
        let endDegree = try! Degree.make(for: endPoint)
        
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), startingDegree: startDegree, endingDegree: endDegree)
        let outerArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), startingDegree: startDegree, endingDegree: endDegree)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc, extendExteriorStart: true, extendExteriorEnd: true)
    }
    
    var edge04Shape: EdgedCrescent {
        let interiorArc = Arc(radius: Radius(thirdRingInteriorRadius), dPad: .arc13)
        let exteriorArc = Arc(radius: Radius(thirdRingExteriorRadius), dPad: .arc13)
        let interiorAngleStart = 270 - interiorArc.startingDegree
        let exteriorAngleStart = 180 - 90 - interiorAngleStart
        let edgeLength = (exteriorArc.endingPoint.y / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let point01 = CartesianPoint(x: -edgeLength, y: exteriorArc.endingPoint.y)
        let point02 = CartesianPoint(x: exteriorArc.endingPoint.x, y: exteriorArc.endingPoint.y)
        
        let arc = Arc(radius: Radius(thirdRingInteriorRadius), dPad: .arc13)
        return EdgedCrescent(interiorArc: arc, edgePoints: [point01, point02])
    }
    
    var edge05Shape: EdgedCrescent {
        let shape = innerRing15Shape
        var startPoint = shape.exteriorArcStartingPoint
        startPoint.y += Float(secondRingInteriorRadius - firstRingExteriorRadius)
        let startDegree = try! Degree.make(for: startPoint)
        var endPoint = shape.exteriorArcEndingPoint
        endPoint.y += Float(secondRingInteriorRadius - firstRingExteriorRadius)
        let endDegree = try! Degree.make(for: endPoint)
        
        let interiorArc = Arc(radius: Radius(secondRingInteriorRadius), startingDegree: startDegree, endingDegree: endDegree)
        let exteriorArc = Arc(radius: Radius(secondRingEdgeExteriorRadius), startingDegree: startDegree, endingDegree: endDegree)
        let crescent = Crescent(interiorArc: interiorArc, exteriorArc: exteriorArc, extendExteriorStart: true, extendExteriorEnd: true)
        return EdgedCrescent(interiorArc: interiorArc, edgePoints: [crescent.exteriorArcStartingPoint, crescent.exteriorArcEndingPoint])
    }
    
    var top00Shape: RoundedRectangle {
        var frame = CGRect(x: 0, y: 0, width: 0, height: self.cruxDiameter)
        frame.size.width = CGFloat(RoundedRectangle.defaultSize.width) * scaleRatio
        frame.origin.y = edge05.frame.origin.y
        frame.origin.x = innerRing17.frame.origin.x
        
        let point1: CartesianPoint = CartesianPoint(frame.origin)
        let point2: CartesianPoint = CartesianPoint(x: point1.x + Float(frame.size.width), y: Float(cruxDiameter))
        
        return RoundedRectangle(cartesianPoints: [point1, point2], rightRounded: true)
    }
    
    // MARK: - Components
    open lazy var innerRing01: CrescentControl = {
        let button = CrescentControl(shape: innerRing01Shape, delegate: self)
        button.setTitle("454", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var innerRing08: CrescentControl = {
        let button = CrescentControl(shape: innerRing08Shape, delegate: self)
        button.setTitle("81", for: .init())
        button.color = theme.primaryDark
        return button
    }()
    
    open lazy var innerRing09: CrescentControl = {
        let button = CrescentControl(shape: innerRing09Shape, delegate: self)
        button.setTitle("77", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing10: CrescentControl = {
        let button = CrescentControl(shape: innerRing10Shape, delegate: self)
        button.setTitle("378", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var innerRing11: CrescentControl = {
        let button = CrescentControl(shape: innerRing11Shape, delegate: self)
        button.setTitle("42", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing13: CrescentControl = {
        let button = CrescentControl(shape: innerRing13Shape, delegate: self)
        button.setTitle("25", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var innerRing14: CrescentControl = {
        let button = CrescentControl(shape: innerRing14Shape, delegate: self)
        button.setTitle("12", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing15: CrescentControl = {
        let button = CrescentControl(shape: innerRing15Shape, delegate: self)
        button.setTitle("858", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var innerRing16: CrescentControl = {
        let button = CrescentControl(shape: innerRing16Shape, delegate: self)
        button.setTitle("453", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing17: CrescentControl = {
        let button = CrescentControl(shape: innerRing17Shape, delegate: self)
        button.setTitle("2852", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing20: CrescentControl = {
        let button = CrescentControl(shape: innerRing20Shape, delegate: self)
        button.setTitle("IR20", for: .init())
        button.color = theme.inactive
        return button
    }()
    
    open lazy var outerRing09: CrescentControl = {
        let button = CrescentControl(shape: outerRing09Shape, delegate: self)
        button.setTitle("16", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var outerRing10: CrescentControl = {
        let button = CrescentControl(shape: outerRing10Shape, delegate: self)
        button.setTitle("51", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var outerRing11: CrescentControl = {
        let button = CrescentControl(shape: outerRing11Shape, delegate: self)
        button.setTitle("23", for: .init())
        button.color = theme.primaryDark
        return button
    }()
    
    open lazy var outerRing12: CrescentControl = {
        let button = CrescentControl(shape: outerRing12Shape, delegate: self)
        button.setTitle("38", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var outerRing13: CrescentControl = {
        let button = CrescentControl(shape: outerRing13Shape, delegate: self)
        button.setTitle("23", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var outerRing18Extended: CrescentControl = {
        let button = CrescentControl(shape: outerRing18ExtendedShape, delegate: self)
        button.setTitle("ORE18", for: .init())
        button.color = theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0)
        return button
    }()
    
    open lazy var outerRing19Extended: CrescentControl = {
        let button = CrescentControl(shape: outerRing19ExtendedShape, delegate: self)
        button.setTitle("ORE19", for: .init())
        button.color = theme.tertiaryLight
        button.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        return button
    }()
    
    open lazy var outerRing20Extended: CrescentControl = {
        let button = CrescentControl(shape: outerRing20ExtendedShape, delegate: self)
        button.setTitle("OR20", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var edge04: EdgedCrescentControl = {
        let button = EdgedCrescentControl(shape: edge04Shape, delegate: self)
        button.setTitle("Mark", for: .init())
        button.color = theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 40.0, bottom: 20.0, right: 0.0)
        return button
    }()
    
    open lazy var edge05: EdgedCrescentControl = {
        let button = EdgedCrescentControl(shape: edge05Shape, delegate: self)
        button.setTitle("E05", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open lazy var top00: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: top00Shape, delegate: self)
        button.setTitle("T00", for: UIControl.State())
        button.color = theme.tertiaryDark
        return button
    }()
    
    // MARK: - Frame Calculations
    func frameForTop00() -> CGRect {
        var frame = CGRect(x: 0, y: 0, width: 0, height: cruxDiameter)
        frame.size.width = CGFloat(RoundedRectangle.defaultSize.width) * scaleRatio
        frame.origin.y = edge05.frame.origin.y
        frame.origin.x = innerRing17.frame.origin.x
        return frame
    }
}
#endif
