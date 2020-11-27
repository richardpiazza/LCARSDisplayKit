import GraphPoint
#if canImport(UIKit)
import UIKit

/// An expansion of the `DirectionGroupingView` with surrounding buttons.
/// This particular layout comes from the small Tactical station behind the command
/// chairs on the USS Voyager.
@IBDesignable open class DirectionGroupingView03: DirectionGroupingView {
    
    open lazy var innerRing01: CrescentButton = {
        let half = DPad.arc02.start + ((DPad.arc02.end - DPad.arc02.start) / 2)
        
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(DPad.arc01.start + 1.5), endDegree: Degree(half))
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), startDegree: Degree(DPad.arc01.start - 2.0), endDegree: Degree(half))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: false)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("454", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing08: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), dPad: .arc08)
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), dPad: .arc08)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("81", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing09: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), dPad: .arc09)
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), dPad: .arc09)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("77", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing10: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), dPad: .arc10)
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), dPad: .arc10)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("378", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing11: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), dPad: .arc11)
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), dPad: .arc11)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("42", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing13: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), dPad: .arc13)
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), dPad: .arc13)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("25", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing14: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(DPad.arc14.start), endDegree: Degree(DPad.arc14.end - 1.0))
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), startDegree: Degree(DPad.arc14.start), endDegree: Degree(DPad.arc14.end - 1.0))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: false, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("12", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing15: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(DPad.arc15.start - 0.5), endDegree: Degree(DPad.arc15.end + 0.5))
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), startDegree: Degree(DPad.arc15.start - 0.5), endDegree: Degree(DPad.arc15.end + 0.5))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("858", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing16: CrescentButton = {
        let half = DPad.arc17.start + ((DPad.arc17.end - DPad.arc17.start) / 2)
        
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(DPad.arc16.start + 1.0), endDegree: Degree(half))
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), startDegree: Degree(DPad.arc16.start - 2.0), endDegree: Degree(half))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: false)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("453", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing17: CrescentButton = {
        let half = DPad.arc17.start + ((DPad.arc17.end - DPad.arc17.start) / 2) + 1.5
        
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), startDegree: Degree(half), endDegree: Degree(DPad.arc19.end - 1.5))
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), startDegree: Degree(half), endDegree: Degree(DPad.arc19.end + 2.0))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: false, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("2852", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing20: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(firstRingInteriorRadius), dPad: .arc20)
        let outerArc = ModifiedArc(radius: Radius(firstRingExteriorRadius), dPad: .arc20)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("IR20", for: UIControl.State())
        button.color = Configuration.theme.inactive
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing09: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), dPad: .arc09)
        let outerArc = ModifiedArc(radius: Radius(secondRingExteriorRadius), dPad: .arc09)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("16", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing10: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), dPad: .arc10)
        let outerArc = ModifiedArc(radius: Radius(secondRingExteriorRadius), dPad: .arc10)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("51", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing11: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), dPad: .arc11)
        let outerArc = ModifiedArc(radius: Radius(secondRingExteriorRadius), dPad: .arc11)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("23", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing12: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), dPad: .arc12)
        let outerArc = ModifiedArc(radius: Radius(secondRingExteriorRadius), dPad: .arc12)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("38", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing13: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), dPad: .arc13)
        let outerArc = ModifiedArc(radius: Radius(secondRingExteriorRadius), dPad: .arc13)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("23", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing18Extended: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), dPad: .arc18)
        let outerArc = ModifiedArc(radius: Radius(secondRingExtendedExteriorRadius), dPad: .arc18)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("ORE18", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing19Extended: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), startDegree: Degree(DPad.arc19.start), endDegree: Degree(DPad.arc19.end + 2.0))
        let outerArc = ModifiedArc(radius: Radius(secondRingExtendedExteriorRadius), startDegree: Degree(DPad.arc19.start), endDegree: Degree(DPad.arc19.end + 2.0))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: false, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("ORE19", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        button.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing20Extended: CrescentButton = {
        let startDegree = GraphPoint.degree(graphPoint: innerRing20.crescent.outerArc.startPoint) + 0.25
        let endDegree = GraphPoint.degree(graphPoint: innerRing20.crescent.outerArc.endPoint) - 0.25
        
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), startDegree: Degree(startDegree), endDegree: Degree(endDegree))
        let outerArc = ModifiedArc(radius: Radius(secondRingExtendedExteriorRadius), startDegree: Degree(startDegree), endDegree: Degree(endDegree))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR20", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var edge04: EdgedCrescentButton = {
        let interiorArc = ModifiedArc(radius: Radius(thirdRingInteriorRadius), dPad: .arc13)
        let exteriorArc = ModifiedArc(radius: Radius(thirdRingExteriorRadius), dPad: .arc13)
        let interiorAngleStart = 270 - interiorArc.startDegree
        let exteriorAngleStart = 180 - 90 - interiorAngleStart
        let edgeLength = (Float(exteriorArc.endPoint.y) / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let point01 = CGPoint(x: CGFloat(-edgeLength), y: exteriorArc.endPoint.y)
        let point02 = CGPoint(x: exteriorArc.endPoint.x, y: exteriorArc.endPoint.y)
        
        var arc = ModifiedArc(radius: Radius(thirdRingInteriorRadius), dPad: .arc13)
        var edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [point01, point02])
        
        let button = EdgedCrescentButton(with: edgedCrescent, inBounds: bounds, offset: self.offset)
        button.setTitle("Mark", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 40.0, bottom: 20.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var edge05: EdgedCrescentButton = {
        let startDegree = GraphPoint.degree(graphPoint: innerRing15.crescent.outerArc.startPoint) + 0.25
        let endDegree = GraphPoint.degree(graphPoint: innerRing15.crescent.outerArc.endPoint) - 0.25
        let interiorArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), startDegree: Degree(startDegree), endDegree: Degree(endDegree))
        var exteriorArc = ModifiedArc(radius: Radius(secondRingEdgeExteriorRadius), startDegree: Degree(startDegree), endDegree: Degree(endDegree))
        exteriorArc.boundedStart = interiorArc.startPoint
        exteriorArc.boundedEnd = interiorArc.endPoint
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [exteriorArc.startPoint, exteriorArc.endPoint])
        
        let button = EdgedCrescentButton(with: edgedCrescent, inBounds: bounds, offset: self.offset)
        button.setTitle("E05", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var top00: RoundedRectangleButton = {
        var frame = CGRect(x: 0, y: 0, width: 0, height: self.cruxDiameter)
        frame.size.width = RoundedRectangleButton.defaultSize.width * scaleRatio
        frame.origin.y = edge05.frame.origin.y
        frame.origin.x = innerRing17.frame.origin.x
        
        let button = RoundedRectangleButton(frame: frame)
        button.roundRight = true
        button.setTitle("T00", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    
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
        return secondRingExteriorRadius + Configuration.theme.defaultSpacing
    }
    
    open var thirdRingExteriorRadius: CGFloat {
        return thirdRingInteriorRadius + (scaleRatio * 45.0)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        crux.color = Configuration.theme.tertiaryLight
        sector01.color = Configuration.theme.inactive
        sector02.color = Configuration.theme.inactive
        sector03.color = Configuration.theme.inactive
        sector04.color = Configuration.theme.inactive
        
        innerRing01.layoutIfNeeded()
        innerRing08.layoutIfNeeded()
        innerRing09.layoutIfNeeded()
        innerRing10.layoutIfNeeded()
        innerRing11.layoutIfNeeded()
        innerRing13.layoutIfNeeded()
        innerRing14.layoutIfNeeded()
        innerRing15.layoutIfNeeded()
        innerRing16.layoutIfNeeded()
        innerRing17.layoutIfNeeded()
        innerRing20.layoutIfNeeded()
        outerRing09.layoutIfNeeded()
        outerRing10.layoutIfNeeded()
        outerRing11.layoutIfNeeded()
        outerRing12.layoutIfNeeded()
        outerRing13.layoutIfNeeded()
        outerRing18Extended.layoutIfNeeded()
        outerRing19Extended.layoutIfNeeded()
        outerRing20Extended.layoutIfNeeded()
        edge04.layoutIfNeeded()
        edge05.layoutIfNeeded()
        top00.layoutIfNeeded()
    }
}
#endif
