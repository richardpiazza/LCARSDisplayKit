import GraphPoint
#if canImport(UIKit)
import UIKit

/// An expansion on `DirectionGroupingView01` that adds Outer Ring controls to
/// the bottom half, and an additional row of controls to the top.
@IBDesignable open class DirectionGroupingView02: DirectionGroupingView01 {
    open lazy var outerRing01: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), startDegree: Degree(DPad.arc01.start), endDegree: Degree(DPad.arc04.end))
        let outerArc = ModifiedArc(radius: Radius(secondRingExteriorRadius), startDegree: Degree(DPad.arc01.start), endDegree: Degree(DPad.arc04.end))
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR01", for: UIControl.State())
        button.titleEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 0, right: 0)
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var outerRing05: CrescentButton = {
        let innerArc = ModifiedArc(radius: Radius(secondRingInteriorRadius), dPad: .arc05)
        let outerArc = ModifiedArc(radius: Radius(secondRingExteriorRadius), dPad: .arc05)
        
        let crescent = Crescent(innerArc: innerArc, outerArc: outerArc)
        
        let button = CrescentButton(with: crescent, inBounds: bounds, offset: offset)
        button.setTitle("OR05", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var top01: RoundedRectangleButton = {
        let e13Points = edge13Shape.additionalPoints
        let e13Origin = edge13.frame.origin
        
        let width = e13Points[1].x - e13Points[0].x
        let height = RoundedRectangleButton.defaultSize.height * scaleRatio
        let x = e13Origin.x
        let y = e13Origin.y - height - Configuration.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: CGRect(x: x, y: y, width: width, height: height))
        button.setTitle("CALIBRATE", for: UIControl.State())
        button.color = Configuration.theme.tertiaryLight
        self.addSubview(button)
        return button
    }()
    open var calibrate: RoundedRectangleButton {
        return top01
    }
    open lazy var top02: RoundedRectangleButton = {
        var frame = top03.frame
        frame.size.width = (RoundedRectangleButton.defaultSize.width * scaleRatio) * 0.55
        frame.origin.x = frame.origin.x - frame.size.width - Configuration.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: frame)
        button.setTitle("T02", for: UIControl.State())
        button.color = Configuration.theme.primaryLight
        button.roundLeft = true
        self.addSubview(button)
        return button
    }()
    open lazy var top03: RoundedRectangleButton = {
        let e15Points = edge15Shape.additionalPoints
        let e15Origin = edge15.frame.origin
        
        let width = e15Points[1].x - e15Points[0].x
        let height = RoundedRectangleButton.defaultSize.height * scaleRatio
        let x = e15Origin.x
        let y = e15Origin.y - height - Configuration.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: CGRect(x: x, y: y, width: width, height: height))
        button.setTitle("T03", for: UIControl.State())
        button.color = Configuration.theme.tertiaryDark
        self.addSubview(button)
        return button
    }()
    open lazy var top04: RoundedRectangleButton = {
        var frame = top03.frame
        let top03Width = frame.size.width
        frame.size.width = (RoundedRectangleButton.defaultSize.width * scaleRatio) * 0.55
        frame.origin.x = frame.origin.x + top03Width + Configuration.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: frame)
        button.setTitle("T04", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        button.roundRight = true
        self.addSubview(button)
        return button
    }()
    open lazy var top05: RoundedRectangleButton = {
        var frame = top00.frame
        frame.origin.y = frame.origin.y - frame.size.height - Configuration.theme.defaultSpacing
        
        let button = RoundedRectangleButton(frame: frame)
        button.setTitle("T05", for: UIControl.State())
        button.color = Configuration.theme.primaryDark
        button.roundLeft = true
        button.roundRight = true
        self.addSubview(button)
        return button
    }()
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 760, height: 755)
    }
    
    // {0.0, 52.0}
    open override var cartesianOffset: CartesianFrame.Offset {
        return .init(x: 0.0, y: Float(scaledContentSize.height * 0.068))
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
