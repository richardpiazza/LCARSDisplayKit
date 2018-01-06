#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint
import LCARSDisplayKit
import LCARSDisplayKitUI

/// An expansion of the `DirectionGroupingView` with surrounding buttons.
/// This particular layout comes from the small Tactical station behind the command
/// chairs on the USS Voyager.
@IBDesignable open class DirectionGroupingView03: DirectionGroupingView {
    
    open lazy var innerRing01: CrescentButton = {
        let half = DPad.arc02.start + ((DPad.arc02.end - DPad.arc02.start) / 2)
        
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc01.start + 1.5, endDegree: half)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc01.start - 2.0, endDegree: half)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: false)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("454", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing08: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc08.start, endDegree: DPad.arc08.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc08.start, endDegree: DPad.arc08.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("81", for: UIControlState())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing09: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc09.start, endDegree: DPad.arc09.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc09.start, endDegree: DPad.arc09.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("77", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing10: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("378", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing11: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("42", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing13: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("25", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing14: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc14.start, endDegree: DPad.arc14.end - 1.0)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc14.start, endDegree: DPad.arc14.end - 1.0)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: false, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("12", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing15: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc15.start - 0.5, endDegree: DPad.arc15.end + 0.5)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc15.start - 0.5, endDegree: DPad.arc15.end + 0.5)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("858", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing16: CrescentButton = {
        let half = DPad.arc17.start + ((DPad.arc17.end - DPad.arc17.start) / 2)
        
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc16.start + 1.0, endDegree: half)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc16.start - 2.0, endDegree: half)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: false)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("453", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing17: CrescentButton = {
        let half = DPad.arc17.start + ((DPad.arc17.end - DPad.arc17.start) / 2) + 1.5
        
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: half, endDegree: DPad.arc19.end - 1.5)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: half, endDegree: DPad.arc19.end + 2.0)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: false, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("2852", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var innerRing20: CrescentButton = {
        let innerArc = Arc(radius: firstRingInteriorRadius, startDegree: DPad.arc20.start, endDegree: DPad.arc20.end)
        let outerArc = Arc(radius: firstRingExteriorRadius, startDegree: DPad.arc20.start, endDegree: DPad.arc20.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("IR20", for: UIControlState())
        button.color = Configuration.theme.inactive
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing09: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc09.start, endDegree: DPad.arc09.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc09.start, endDegree: DPad.arc09.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("16", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing10: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc10.start, endDegree: DPad.arc10.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("51", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing11: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc11.start, endDegree: DPad.arc11.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("23", for: UIControlState())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing12: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc12.start, endDegree: DPad.arc12.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc12.start, endDegree: DPad.arc12.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("38", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing13: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("23", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing18Extended: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc18.start, endDegree: DPad.arc18.end)
        let outerArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.arc18.start, endDegree: DPad.arc18.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("ORE18", for: UIControlState())
        button.color = Configuration.theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing19Extended: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.arc19.start, endDegree: DPad.arc19.end + 2.0)
        let outerArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: DPad.arc19.start, endDegree: DPad.arc19.end + 2.0)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: false, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("ORE19", for: UIControlState())
        button.color = Configuration.theme.tertiaryLight
        button.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing20Extended: CrescentButton = {
        let startDegree = GraphPoint.degree(graphPoint: innerRing20.crescent.outerArc.startPoint) + 0.25
        let endDegree = GraphPoint.degree(graphPoint: innerRing20.crescent.outerArc.endPoint) - 0.25
        
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: startDegree, endDegree: endDegree)
        let outerArc = Arc(radius: secondRingExtendedExteriorRadius, startDegree: startDegree, endDegree: endDegree)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc, boundedStart: true, boundedEnd: true)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("OR20", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var edge04: EdgedCrescentButton = {
        let interiorArc = Arc(radius: self.thirdRingInteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        let exteriorArc = Arc(radius: self.thirdRingExteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        let interiorAngleStart = 270 - interiorArc.startDegree
        let exteriorAngleStart = 180 - 90 - interiorAngleStart
        let edgeLength = (exteriorArc.endPoint.y / sin(exteriorAngleStart.radians)) * sin(interiorAngleStart.radians)
        
        let point01 = CGPoint(x: -edgeLength, y: exteriorArc.endPoint.y)
        let point02 = CGPoint(x: exteriorArc.endPoint.x, y: exteriorArc.endPoint.y)
        
        var arc = Arc(radius: self.thirdRingInteriorRadius, startDegree: DPad.arc13.start, endDegree: DPad.arc13.end)
        var edgedCrescent = EdgedCrescent(arc: arc, additionalPoints: [point01, point02])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: self.bounds, offset: self.offset)
        button.setTitle("Mark", for: UIControlState())
        button.color = Configuration.theme.primaryDark
        button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 40.0, bottom: 20.0, right: 0.0)
        self.addSubview(button)
        return button
    }()
    open lazy var edge05: EdgedCrescentButton = {
        let startDegree = GraphPoint.degree(graphPoint: innerRing15.crescent.outerArc.startPoint) + 0.25
        let endDegree = GraphPoint.degree(graphPoint: innerRing15.crescent.outerArc.endPoint) - 0.25
        let interiorArc = Arc(radius: self.secondRingInteriorRadius, startDegree: startDegree, endDegree: endDegree)
        var exteriorArc = Arc(radius: self.secondRingEdgeExteriorRadius, startDegree: startDegree, endDegree: endDegree)
        exteriorArc.boundedStart = interiorArc.startPoint
        exteriorArc.boundedEnd = interiorArc.endPoint
        let edgedCrescent = EdgedCrescent(arc: interiorArc, additionalPoints: [exteriorArc.startPoint, exteriorArc.endPoint])
        
        let button = EdgedCrescentButton(with: edgedCrescent, rect: self.bounds, offset: self.offset)
        button.setTitle("E05", for: UIControlState())
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
        button.setTitle("T00", for: UIControlState())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 715, height: 520)
    }
    
    // {-27.0, 79.0}
    open override var offset: GraphOriginOffset {
        return GraphOriginOffset(x: -(scaledContentSize.width * 0.0366), y: (scaledContentSize.height * 0.14))
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
