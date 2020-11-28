import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

/// An expansion of the `DirectionGroupingView` with surrounding buttons.
/// This layout is representative of LCARS starting in 2371.
@IBDesignable open class DirectionGroupingView01: DirectionGroupingView {
    
    public override func initializeSubviews() {
        super.initializeSubviews()
        
        addSubview(innerRing01)
        addSubview(innerRing05)
        addSubview(innerRing10)
        addSubview(innerRing11)
        addSubview(innerRing12)
        addSubview(innerRing13)
        addSubview(innerRing14)
        addSubview(innerRing15)
        addSubview(innerRing16)
        addSubview(innerRing20)
        addSubview(outerRing10)
        addSubview(outerRing11)
        addSubview(outerRing12)
        addSubview(outerRing13)
        addSubview(outerRing14)
        addSubview(outerRing16)
        addSubview(outerRing17)
        addSubview(outerRing18)
        addSubview(outerRing19)
        addSubview(outerRing20)
        addSubview(edge06)
        addSubview(edge07)
        addSubview(edge09)
        addSubview(edge13)
        addSubview(edge15)
        addSubview(top00)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        innerRing01.frame = frame(forShape: innerRing01Crescent)
        innerRing05.frame = frame(forShape: innerRing05Crescent)
        innerRing10.frame = frame(forShape: innerRing10Crescent)
        innerRing11.frame = frame(forShape: innerRing11Crescent)
        innerRing12.frame = frame(forShape: innerRing12Crescent)
        innerRing13.frame = frame(forShape: innerRing13Crescent)
        innerRing14.frame = frame(forShape: innerRing14Crescent)
        innerRing15.frame = frame(forShape: innerRing15Crescent)
        innerRing16.frame = frame(forShape: innerRing16Crescent)
        innerRing20.frame = frame(forShape: innerRing20Crescent)
        outerRing10.frame = frame(forShape: outerRing10Crescent)
        outerRing11.frame = frame(forShape: outerRing11Crescent)
        outerRing12.frame = frame(forShape: outerRing12Crescent)
        outerRing13.frame = frame(forShape: outerRing13Crescent)
        outerRing14.frame = frame(forShape: outerRing14Crescent)
        outerRing16.frame = frame(forShape: outerRing16Crescent)
        outerRing17.frame = frame(forShape: outerRing17Crescent)
        outerRing18.frame = frame(forShape: outerRing18Crescent)
        outerRing19.frame = frame(forShape: outerRing19Crescent)
        outerRing20.frame = frame(forShape: outerRing20Crescent)
        edge06.frame = frame(forShape: edge06Shape)
        edge07.frame = frame(forShape: edge07Shape)
        edge09.frame = frame(forShape: edge09Shape)
        edge13.frame = frame(forShape: edge13Shape)
        edge15.frame = frame(forShape: edge15Shape)
        top00.frame = frameForTop00()
    }
    
    // MARK: - Scale & Position
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 760, height: 625)
    }
    
    // {0.0, 50.0}
    open override var cartesianOffset: CartesianFrame.Offset {
        return .init(x: 0.0, y: Float(scaledContentSize.height * 0.0765))
    }
    
    open var secondRingEdgeExteriorRadius: CGFloat {
        return secondRingExteriorRadius + (scaleRatio * 41.5)
    }
    
    open var thirdRingInteriorRadius: CGFloat {
        return secondRingExteriorRadius + Configuration.theme.defaultSpacing
    }
    
    open var thirdRingExteriorRadius: CGFloat {
        return thirdRingInteriorRadius + (scaleRatio * 72.0)
    }
    
    // MARK: - Shapes
    
    var innerRing01Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: Degree(DPad.arc01.start), endingDegree: Degree(DPad.arc04.end))
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startingDegree: Degree(DPad.arc01.start), endingDegree: Degree(DPad.arc04.end))
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing05Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc05)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc05)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing10Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc10)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc10)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing11Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc11)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc11)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing12Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc12)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc12)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing13Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc13)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc13)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing14Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc14)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc14)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing15Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc15)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc15)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing16Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: Degree(DPad.arc16.start), endingDegree: Degree(DPad.arc19.end))
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startingDegree: Degree(DPad.arc16.start), endingDegree: Degree(DPad.arc19.end))
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var innerRing20Crescent: Crescent {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc20)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc20)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing10Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc10)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc10)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing11Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc11)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc11)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing12Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc12)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc12)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing13Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc13)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc13)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing14Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc14)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc14)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing16Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc16)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc16)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing17Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc17)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc17)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing18Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc18)
        let outerArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc18)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing19Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc19)
        let outerArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc19)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing20Crescent: Crescent {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc20)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc20)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var edge06Shape: EdgedCrescent {
        let interiorArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc06)
        let exteriorArc = Arc(radius: Radius(firstRingEdgeExteriorRadius), dPad: .arc06)
        
        let interiorAngleEnd = interiorArc.endingDegree - 90
        let exteriorAngleEnd = 90 - interiorAngleEnd
        let endX = (exteriorArc.startingPoint.y / sin(exteriorAngleEnd.radians)) * sin(interiorAngleEnd.radians)
        
        let edgePointStart = CartesianPoint(x: exteriorArc.startingPoint.x, y: exteriorArc.startingPoint.y)
        let edgePointEnd = CartesianPoint(x: endX, y: exteriorArc.startingPoint.y)
        
        return EdgedCrescent(interiorArc: interiorArc, edgePoints: [edgePointStart, edgePointEnd])
    }
    
    var edge07Shape: EdgedCrescent {
        let edge06ExteriorArc = Arc(radius: Radius(firstRingEdgeExteriorRadius), dPad: .arc06)
        let edge09ExteriorArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc09)
        
        let interiorArc = Arc(radius: Radius(firstRingInteriorRadius), startingDegree: Degree(DPad.arc07.start), endingDegree: Degree(DPad.arc08.end))
        let interiorAngleStart = interiorArc.startingDegree - 90
        let exteriorAngleStart = 90 - interiorAngleStart
        let startX = (edge06ExteriorArc.startingPoint.y / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let interiorAngleEnd = 180 - interiorArc.endingDegree
        let exteriorAngleEnd = 90 - interiorAngleEnd
        let endY = (edge09ExteriorArc.endingPoint.x / sin(exteriorAngleEnd.radians)) * sin(interiorAngleEnd.radians)
        
        let edgePointStart = CartesianPoint(x: startX, y: edge06ExteriorArc.startingPoint.y)
        let edgePointMiddle = CartesianPoint(x: edge09ExteriorArc.endingPoint.x, y: edge06ExteriorArc.startingPoint.y)
        let edgePointEnd = CartesianPoint(x: edge09ExteriorArc.endingPoint.x, y: endY)
        
        return EdgedCrescent(interiorArc: interiorArc, edgePoints: [edgePointStart, edgePointMiddle, edgePointEnd])
    }
    
    var edge09Shape: EdgedCrescent {
        let interiorArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc09)
        let exteriorArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc09)
        
        let interiorAngleStart = 180 - interiorArc.startingDegree
        let exteriorAngleStart = 90 - interiorAngleStart
        let startY = (exteriorArc.endingPoint.x / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let edgePointStart = CartesianPoint(x: exteriorArc.endingPoint.x, y: startY)
        let edgePointEnd = CartesianPoint(x: exteriorArc.endingPoint.x, y: exteriorArc.endingPoint.y)
        
        return EdgedCrescent(interiorArc: interiorArc, edgePoints: [edgePointStart, edgePointEnd])
    }
    
    var edge13Shape: EdgedCrescent {
        let interiorArc = Arc(radius: Radius(thirdRingInteriorRadius), dPad: .arc13)
        let exteriorArc = Arc(radius: Radius(thirdRingExteriorRadius), dPad: .arc13)
        
        let interiorAngleStart = 270 - interiorArc.startingDegree
        let exteriorAngleStart = 90 - interiorAngleStart
        let startX = (exteriorArc.endingPoint.y / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let edgePointStart = CartesianPoint(x: -startX, y: exteriorArc.endingPoint.y)
        let edgePointEnd = CartesianPoint(x: exteriorArc.endingPoint.x, y: exteriorArc.endingPoint.y)
        
        return EdgedCrescent(interiorArc: interiorArc, edgePoints: [edgePointStart, edgePointEnd])
    }
    
    var edge15Shape: EdgedCrescent {
        let interiorArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc15)
        let exteriorArc = Arc(radius: Radius(secondRingEdgeExteriorRadius), dPad: .arc15)
        return EdgedCrescent(interiorArc: interiorArc, edgePoints: [exteriorArc.startingPoint, exteriorArc.endingPoint])
    }
    
    var top00Shape: RoundedRectangle {
        let edge15Origin = frame(forShape: edge15Shape).origin
        
        let width = RoundedRectangle.defaultSize.width * Float(scaleRatio)
        let height = RoundedRectangle.defaultSize.height * Float(scaleRatio)
        let x = Float(bounds.size.width + CGFloat(width) - edge15Origin.x)
        let y = Float(edge15Origin.y)
        
        let point1: CartesianPoint = .init(x: x, y: y)
        let point2: CartesianPoint = .init(x: x + width, y: y + height)
        
        return RoundedRectangle(cartesianPoints: [point1, point2], leftRounded: true, rightRounded: true)
    }
    
    // MARK: - Components
    
    open lazy var innerRing01: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing01Crescent, delegate: self)
        button.setTitle("IR01", for: .init())
        button.titleEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 0, right: 0)
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing05: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing05Crescent, delegate: self)
        button.setTitle("IR05", for: .init())
        button.color = Configuration.theme.primaryLight
        return button
    }()
    
    open lazy var innerRing10: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing10Crescent, delegate: self)
        button.setTitle("IR10", for: .init())
        button.color = Configuration.theme.primaryLight
        return button
    }()
    
    open lazy var innerRing11: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing11Crescent, delegate: self)
        button.setTitle("IR11", for: .init())
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing12: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing12Crescent, delegate: self)
        button.setTitle("IR12", for: .init())
        button.color = Configuration.theme.primaryDark
        return button
    }()
    
    open lazy var innerRing13: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing13Crescent, delegate: self)
        button.setTitle("IR13", for: .init())
        button.color = Configuration.theme.tertiaryDark
        return button
    }()
    
    open lazy var innerRing14: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing14Crescent, delegate: self)
        button.setTitle("IR14", for: .init())
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing15: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing15Crescent, delegate: self)
        button.setTitle("IR15", for: .init())
        button.color = Configuration.theme.primaryLight
        return button
    }()
    
    open lazy var innerRing16: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing16Crescent, delegate: self)
        button.setTitle("IR16", for: .init())
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    open lazy var innerRing20: Crescent_Button = {
        let button = Crescent_Button(shape: innerRing20Crescent, delegate: self)
        button.setTitle("IR20", for: .init())
        button.color = Configuration.theme.primaryLight
        return button
    }()
    
    open lazy var outerRing10: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing10Crescent, delegate: self)
        button.setTitle("OR10", for: .init())
        button.color = Configuration.theme.primaryDark
        return button
    }()
    
    open lazy var outerRing11: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing11Crescent, delegate: self)
        button.setTitle("OR11", for: .init())
        button.color = Configuration.theme.tertiaryDark
        return button
    }()
    
    open lazy var outerRing12: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing12Crescent, delegate: self)
        button.setTitle("OR12", for: .init())
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    open lazy var outerRing13: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing13Crescent, delegate: self)
        button.setTitle("OR13", for: .init())
        button.color = Configuration.theme.primaryLight
        return button
    }()
    
    open lazy var outerRing14: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing14Crescent, delegate: self)
        button.setTitle("OR14", for: .init())
        button.color = Configuration.theme.primaryDark
        return button
    }()
    
    open lazy var outerRing16: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing16Crescent, delegate: self)
        button.setTitle("OR16", for: .init())
        button.color = Configuration.theme.tertiaryDark
        return button
    }()
    
    open lazy var outerRing17: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing17Crescent, delegate: self)
        button.setTitle("OR17", for: .init())
        button.color = Configuration.theme.primaryLight
        return button
    }()
    
    open lazy var outerRing18: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing18Crescent, delegate: self)
        button.setTitle("OR18", for: .init())
        button.color = Configuration.theme.primaryDark
        return button
    }()
    
    open lazy var outerRing19: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing19Crescent, delegate: self)
        button.setTitle("OR19", for: .init())
        button.color = Configuration.theme.tertiaryDark
        return button
    }()
    
    open lazy var outerRing20: Crescent_Button = {
        let button = Crescent_Button(shape: outerRing20Crescent, delegate: self)
        button.setTitle("OR20", for: .init())
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    open lazy var edge06: EdgedCrescent_Button = {
        let button = EdgedCrescent_Button(shape: edge06Shape, delegate: self)
        button.setTitle("－", for: .init())
        button.color = Configuration.theme.tertiaryLight
        button.titleLabel?.font = Configuration.theme.subtitle
        return button
    }()
    
    /// Mode Select
    open lazy var edge07: EdgedCrescent_Button = {
        let button = EdgedCrescent_Button(shape: edge07Shape, delegate: self)
        button.setTitle("MODE SELECT", for: .init())
        button.color = Configuration.theme.primaryLight
        return button
    }()
    
    open var modeSelect: EdgedCrescent_Button {
        return edge07
    }
    
    open lazy var edge09: EdgedCrescent_Button = {
        let button = EdgedCrescent_Button(shape: edge09Shape, delegate: self)
        button.setTitle("+", for: .init())
        button.color = Configuration.theme.tertiaryDark
        button.titleLabel?.font = Configuration.theme.subtitle
        return button
    }()
    
    open lazy var edge13: EdgedCrescent_Button = {
        let button = EdgedCrescent_Button(shape: edge13Shape, delegate: self)
        button.setTitle("E13", for: .init())
        button.color = Configuration.theme.primaryDark
        return button
    }()
    
    open lazy var edge15: EdgedCrescent_Button = {
        let button = EdgedCrescent_Button(shape: edge15Shape, delegate: self)
        button.setTitle("E15", for: .init())
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    open lazy var top00: RoundedRectangle_Button = {
        let button = RoundedRectangle_Button(shape: top00Shape, delegate: self)
        button.setTitle("T00", for: .init())
        button.color = Configuration.theme.tertiaryLight
        return button
    }()
    
    // MARK: - Frame Calculations
    
    // TODO: Determine a way to use `frame(forShape:)`
    func frameForTop00() -> CGRect {
        let edge15Origin = frame(forShape: edge15Shape).origin
        
        let width = CGFloat(RoundedRectangle.defaultSize.width) * scaleRatio
        let height = CGFloat(RoundedRectangle.defaultSize.height) * scaleRatio
        let x = bounds.size.width + width - edge15Origin.x
        let y = edge15Origin.y
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
#endif
