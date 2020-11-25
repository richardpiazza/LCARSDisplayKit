import GraphPoint
#if canImport(UIKit)
import UIKit

/// An expansion of the `DirectionGroupingView` with surrounding buttons.
/// This layout is representative of LCARS starting in 2371.
@IBDesignable open class DirectionGroupingView01: DirectionGroupingView {
    open lazy var innerRing01: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc01.start, endDegree: DPad.arc04.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc01.start, endDegree: DPad.arc04.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR01", for: UIControl.State())
        button.titleEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 0, right: 0)
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing05: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc05.start, endDegree: DPad.arc05.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc05.start, endDegree: DPad.arc05.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR05", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing10: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR10", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing11: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR11", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing12: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc12.start, endDegree: DPad.arc12.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc12.start, endDegree: DPad.arc12.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR12", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing13: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR13", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing14: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc14.start, endDegree: DPad.arc14.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc14.start, endDegree: DPad.arc14.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR14", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing15: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc15.start, endDegree: DPad.arc15.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc15.start, endDegree: DPad.arc15.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR15", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing16: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc16.start, endDegree: DPad.arc19.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc16.start, endDegree: DPad.arc19.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR16", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing20: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc20.start, endDegree: DPad.arc20.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc20.start, endDegree: DPad.arc20.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR20", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing10: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR10", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing11: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR11", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing12: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc12.start, endDegree: DPad.arc12.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc12.start, endDegree: DPad.arc12.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR12", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing13: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR13", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing14: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc14.start, endDegree: DPad.arc14.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc14.start, endDegree: DPad.arc14.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR14", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing16: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc16.start, endDegree: DPad.arc16.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc16.start, endDegree: DPad.arc16.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR16", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing17: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc17.start, endDegree: DPad.arc17.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc17.start, endDegree: DPad.arc17.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR17", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing18: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc18.start, endDegree: DPad.arc18.end)
        let outerArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.arc18.start, endDegree: DPad.arc18.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR18", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing19: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc19.start, endDegree: DPad.arc19.end)
        let outerArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.arc19.start, endDegree: DPad.arc19.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR19", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing20: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc20.start, endDegree: DPad.arc20.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc20.start, endDegree: DPad.arc20.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR20", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var edge06: EdgedCrescentButton = {
        let interiorArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc06.start, endDegree: DPad.arc06.end)
        let exteriorArc = Arc(radius: firstRingEdgeExteriorRadius, startDegree: DPad.arc06.start, endDegree: DPad.arc06.end)
        
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
        let edge06ExteriorArc = Arc(radius: firstRingEdgeExteriorRadius, startDegree: DPad.arc06.start, endDegree: DPad.arc06.end)
        let edge09ExteriorArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.arc09.start, endDegree: DPad.arc09.end)
        
        let interiorArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc07.start, endDegree: DPad.arc08.end)
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
        let interiorArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc09.start, endDegree: DPad.arc09.end)
        let exteriorArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.arc09.start, endDegree: DPad.arc09.end)
        
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
        let interiorArc = Arc(radius: thirdRingInteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        let exteriorArc = Arc(radius: thirdRingExteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        
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
        let interiorArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc15.start, endDegree: DPad.arc15.end)
        let exteriorArc = Arc(radius: secondRingEdgeExteriorRadius, startDegree: DPad.arc15.start, endDegree: DPad.arc15.end)
        
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
        
        let roundedRectangle = RoundedRectangle(size: CGSize(width: width, height: height), leftRounded: true, rightRounded: true, cornersOnly: false)
        
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
    open override var offset: GraphOriginOffset {
        return GraphOriginOffset(x: 0.0, y: (scaledContentSize.height * 0.0765))
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
