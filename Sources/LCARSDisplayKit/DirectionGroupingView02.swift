#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint

/// An expansion on `DirectionGroupingView01` that adds Outer Ring controls to
/// the bottom half, and an additional row of controls to the top.
@IBDesignable open class DirectionGroupingView02: DirectionGroupingView01 {
    open lazy var outerRing01: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.Ring.arc01.start, endDegree: DPad.Ring.arc04.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.Ring.arc01.start, endDegree: DPad.Ring.arc04.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("OR01", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing05: CrescentButton = {
        let innerArc = Arc(radius: secondRingInteriorRadius, startDegree: DPad.Ring.arc05.start, endDegree: DPad.Ring.arc05.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startDegree: DPad.Ring.arc05.start, endDegree: DPad.Ring.arc05.end)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, rect: bounds, offset: offset)
        button.setTitle("OR05", for: UIControlState())
        button.color = Interface.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var top01: RoundedRectangleButton = {
        let e13Points = edge13.edgedCrescent.additionalPoints
        let e13Origin = edge13.frame.origin
        
        let width = e13Points[1].x - e13Points[0].x
        let height = RoundedRectangleButton.defaultSize.height * scaleRatio
        let x = e13Origin.x
        let y = e13Origin.y - height - Interface.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: CGRect(x: x, y: y, width: width, height: height))
        button.setTitle("CALIBRATE", for: UIControlState())
        button.color = Interface.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open lazy var top02: RoundedRectangleButton = {
        var frame = top03.frame
        frame.size.width = (RoundedRectangleButton.defaultSize.width * scaleRatio) * 0.55
        frame.origin.x = frame.origin.x - frame.size.width - Interface.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: frame)
        button.setTitle("T02", for: UIControlState())
        button.color = Interface.theme.primaryLight
        button.roundLeft = true
        self.addSubview(button)
        return button
    }()
    open lazy var top03: RoundedRectangleButton = {
        let e15Points = edge15.edgedCrescent.additionalPoints
        let e15Origin = edge15.frame.origin
        
        let width = e15Points[1].x - e15Points[0].x
        let height = RoundedRectangleButton.defaultSize.height * scaleRatio
        let x = e15Origin.x
        let y = e15Origin.y - height - Interface.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: CGRect(x: x, y: y, width: width, height: height))
        button.setTitle("T03", for: UIControlState())
        button.color = Interface.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var top04: RoundedRectangleButton = {
        var frame = top03.frame
        let top03Width = frame.size.width
        frame.size.width = (RoundedRectangleButton.defaultSize.width * scaleRatio) * 0.55
        frame.origin.x = frame.origin.x + top03Width + Interface.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: frame)
        button.setTitle("T04", for: UIControlState())
        button.color = Interface.theme.primaryDark
        button.roundRight = true
        self.addSubview(button)
        return button
    }()
    open lazy var top05: RoundedRectangleButton = {
        var frame = top00.frame
        frame.origin.y = frame.origin.y - frame.size.height - Interface.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: frame)
        button.setTitle("T05", for: UIControlState())
        button.color = Interface.theme.primaryDark
        button.roundLeft = true
        button.roundRight = true
        self.addSubview(button)
        return button
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 760, height: 755)
    }
    
    // {0.0, 52.0}
    open override var offset: GraphOriginOffset {
        return GraphOriginOffset(x: 0.0, y: (scaledContentSize.height * 0.068))
    }
    
    open override var firstRingEdgeExteriorRadius: CGFloat {
        return secondRingExteriorRadius
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        outerRing01.layoutIfNeeded()
        outerRing05.layoutIfNeeded()
        top01.layoutIfNeeded()
        top02.layoutIfNeeded()
        top03.layoutIfNeeded()
        top04.layoutIfNeeded()
        top05.layoutIfNeeded()
    }
}

#endif
