import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

/// An expansion of the `DirectionGroupingView` with surrounding buttons.
/// This layout is representative of LCARS starting in 2371.
@IBDesignable open class DirectionGroupingView01: DirectionGroupingView {
    open lazy var innerRing01: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(DPad.arc01.start), endDegree: Degree(DPad.arc04.end))
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startDegree: Degree(DPad.arc01.start), endDegree: Degree(DPad.arc04.end))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR01", for: UIControl.State())
        button.titleEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 0, right: 0)
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing05: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc05)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc05)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR05", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing10: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc10)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc10)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR10", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing11: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc11)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc11)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR11", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing12: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc12)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc12)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR12", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing13: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc13)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc13)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR13", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing14: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc14)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc14)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR14", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing15: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc15)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc15)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR15", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing16: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(DPad.arc16.start), endDegree: Degree(DPad.arc19.end))
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), startDegree: Degree(DPad.arc16.start), endDegree: Degree(DPad.arc19.end))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR16", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing20: CrescentButton = {
        let innerArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc20)
        let outerArc = Arc(radius: Radius(firstRingExteriorRadius), dPad: .arc20)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR20", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing10: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc10)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc10)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR10", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing11: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc11)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc11)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR11", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing12: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc12)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc12)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR12", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing13: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc13)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc13)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR13", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing14: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc14)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc14)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR14", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing16: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc16)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc16)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR16", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing17: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc17)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc17)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR17", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing18: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc18)
        let outerArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc18)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR18", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing19: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc19)
        let outerArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc19)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR19", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing20: CrescentButton = {
        let innerArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc20)
        let outerArc = Arc(radius: Radius(secondRingExteriorRadius), dPad: .arc20)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR20", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var edge06: EdgedCrescentButton = {
        let interiorArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc06)
        let exteriorArc = Arc(radius: Radius(firstRingEdgeExteriorRadius), dPad: .arc06)
        
        let interiorAngleEnd = interiorArc.endDegree - 90
        let exteriorAngleEnd = 90 - interiorAngleEnd
        let endX = (Float(exteriorArc.startPoint.y) / sin(exteriorAngleEnd.radians)) * sin(interiorAngleEnd.radians)
        
        let edgePointStart = GraphPoint(x: exteriorArc.startPoint.x, y: exteriorArc.startPoint.y)
        let edgePointEnd = GraphPoint(x: CGFloat(endX), y: exteriorArc.startPoint.y)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, inBounds: bounds, offset: offset)
        button.setTitle("－", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        button.titleLabel?.font = Configuration.theme.subtitle
        self.addSubview(button)
        return button
    }()
    /// Mode Select
    open lazy var edge07: EdgedCrescentButton = {
        let edge06ExteriorArc = Arc(radius: Radius(firstRingEdgeExteriorRadius), startDegree: Degree(DPad.arc06.start), endDegree: Degree(DPad.arc06.end))
        let edge09ExteriorArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), startDegree: Degree(DPad.arc09.start), endDegree: Degree(DPad.arc09.end))
        
        let interiorArc = Arc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(DPad.arc07.start), endDegree: Degree(DPad.arc08.end))
        let interiorAngleStart = interiorArc.startDegree - 90
        let exteriorAngleStart = 90 - interiorAngleStart
        let startX = (Float(edge06ExteriorArc.startPoint.y) / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let interiorAngleEnd = 180 - interiorArc.endDegree
        let exteriorAngleEnd = 90 - interiorAngleEnd
        let endY = (Float(edge09ExteriorArc.endPoint.x) / sin(exteriorAngleEnd.radians)) * sin(interiorAngleEnd.radians)
        
        let edgePointStart = GraphPoint(x: CGFloat(startX), y: edge06ExteriorArc.startPoint.y)
        let edgePointMiddle = GraphPoint(x: edge09ExteriorArc.endPoint.x, y: edge06ExteriorArc.startPoint.y)
        let edgePointEnd = GraphPoint(x: edge09ExteriorArc.endPoint.x, y: CGFloat(endY))
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointMiddle, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, inBounds: bounds, offset: offset)
        button.setTitle("MODE SELECT", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open var modeSelect: EdgedCrescentButton {
        return edge07
    }
    open lazy var edge09: EdgedCrescentButton = {
        let interiorArc = Arc(radius: Radius(firstRingInteriorRadius), dPad: .arc09)
        let exteriorArc = Arc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc09)
        
        let interiorAngleStart = 180 - interiorArc.startDegree
        let exteriorAngleStart = 90 - interiorAngleStart
        let startY = (Float(exteriorArc.endPoint.x) / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let edgePointStart = GraphPoint(x: exteriorArc.endPoint.x, y: CGFloat(startY))
        let edgePointEnd = GraphPoint(x: exteriorArc.endPoint.x, y: exteriorArc.endPoint.y)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, inBounds: bounds, offset: offset)
        button.setTitle("+", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        button.titleLabel?.font = Configuration.theme.subtitle
        self.addSubview(button)
        return button
    }()
    open lazy var edge13: EdgedCrescentButton = {
        let interiorArc = Arc(radius: Radius(thirdRingInteriorRadius), dPad: .arc13)
        let exteriorArc = Arc(radius: Radius(thirdRingExteriorRadius), dPad: .arc13)
        
        let interiorAngleStart = 270 - interiorArc.startDegree
        let exteriorAngleStart = 90 - interiorAngleStart
        let startX = (Float(exteriorArc.endPoint.y) / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let edgePointStart = GraphPoint(x: CGFloat(-startX), y: exteriorArc.endPoint.y)
        let edgePointEnd = GraphPoint(x: exteriorArc.endPoint.x, y: exteriorArc.endPoint.y)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [edgePointStart, edgePointEnd])
        
        let button = EdgedCrescentButton(with: edgedCrescent, inBounds: bounds, offset: offset)
        button.setTitle("E13", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var edge15: EdgedCrescentButton = {
        let interiorArc = Arc(radius: Radius(secondRingInteriorRadius), dPad: .arc15)
        let exteriorArc = Arc(radius: Radius(secondRingEdgeExteriorRadius), dPad: .arc15)
        
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [exteriorArc.startPoint, exteriorArc.endPoint])
        
        let button = EdgedCrescentButton(with: edgedCrescent, inBounds: bounds, offset: offset)
        button.setTitle("E15", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var top00: RoundedRectangleButton = {
        let edge15Origin = edge15.frame.origin
        
        let width = RoundedRectangleButton.defaultSize.width * scaleRatio
        let height = RoundedRectangleButton.defaultSize.height * scaleRatio
        let x = bounds.size.width + width - edge15Origin.x
        let y = edge15Origin.y
        
        let roundedRectangle = RoundedRectangle(size: Size(width: Float(width), height: Float(height)), leftRounded: true, rightRounded: true, cornersOnly: false)
        
        let button = RoundedRectangleButton(with: CGRect(x: x, y: y, width: width, height: height), roundedRectangle: roundedRectangle)
        button.setTitle("T00", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    
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
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        innerRing01.layoutIfNeeded()
        innerRing05.layoutIfNeeded()
        innerRing10.layoutIfNeeded()
        innerRing11.layoutIfNeeded()
        innerRing12.layoutIfNeeded()
        innerRing13.layoutIfNeeded()
        innerRing14.layoutIfNeeded()
        innerRing15.layoutIfNeeded()
        innerRing16.layoutIfNeeded()
        innerRing20.layoutIfNeeded()
        outerRing10.layoutIfNeeded()
        outerRing11.layoutIfNeeded()
        outerRing12.layoutIfNeeded()
        outerRing13.layoutIfNeeded()
        outerRing14.layoutIfNeeded()
        outerRing16.layoutIfNeeded()
        outerRing17.layoutIfNeeded()
        outerRing18.layoutIfNeeded()
        outerRing19.layoutIfNeeded()
        outerRing20.layoutIfNeeded()
        edge06.layoutIfNeeded()
        edge07.layoutIfNeeded()
        edge09.layoutIfNeeded()
        edge13.layoutIfNeeded()
        edge15.layoutIfNeeded()
        top00.layoutIfNeeded()
    }
}
#endif
