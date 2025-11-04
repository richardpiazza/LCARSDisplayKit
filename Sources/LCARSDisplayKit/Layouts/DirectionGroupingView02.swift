import GraphPoint
import Swift2D
#if canImport(UIKit) && !os(watchOS)
import UIKit

/// An expansion on `DirectionGroupingView01` that adds Outer Ring controls to
/// the bottom half, and an additional row of controls to the top.
open class DirectionGroupingView02: DirectionGroupingView01 {
    
    public override func initializeSubviews() {
        super.initializeSubviews()
        
        addSubview(outerRing01)
        addSubview(outerRing05)
        addSubview(top01)
        addSubview(top02)
        addSubview(top03)
        addSubview(top04)
        addSubview(top05)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        outerRing01.frame = frame(forShape: outerRing01Shape)
        outerRing01.shape = outerRing01Shape
        outerRing05.frame = frame(forShape: outerRing05Shape)
        outerRing05.shape = outerRing05Shape
        top01.frame = frameForTop01()
        top01.shape = top01Shape
        top02.frame = frameForTop02()
        top02.shape = top02Shape
        top03.frame = frameForTop03()
        top03.shape = top03Shape
        top04.frame = frameForTop04()
        top04.shape = top04Shape
        top05.frame = frameForTop05()
        top05.shape = top05Shape
    }
    
    // MARK: - Scale & Position
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 760, height: 755)
    }
    
    // {0.0, 52.0}
    open override var cartesianOffset: CartesianFrame.Offset {
        return .init(x: 0.0, y: Float(scaledContentSize.height * 0.068))
    }
    
    open override var firstRingEdgeExteriorRadius: Radius {
        return secondRingExteriorRadius
    }
    
    // MARK: - Shapes
    var outerRing01Shape: Crescent {
        let innerArc = Arc(radius: secondRingInteriorRadius, startingDegree: DPad.Arc.arc01.start, endingDegree: DPad.Arc.arc04.end)
        let outerArc = Arc(radius: secondRingExteriorRadius, startingDegree: DPad.Arc.arc01.start, endingDegree: DPad.Arc.arc04.end)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var outerRing05Shape: Crescent {
        let innerArc = Arc(radius: secondRingInteriorRadius, arc: .arc05)
        let outerArc = Arc(radius: secondRingExteriorRadius, arc: .arc05)
        return Crescent(interiorArc: innerArc, exteriorArc: outerArc)
    }
    
    var top01Shape: RoundedRectangle {
        let e13Points = edge13Shape.edgePoints
        let e13Origin = frame(forShape: edge13Shape).origin
        let width = e13Points[1].x - e13Points[0].x
        let height = Self.defaultControlSize.height * scaleRatio
        let x = e13Origin.x
        let y = e13Origin.y - CGFloat(height) - theme.defaultSpacing
        
        let point1: CartesianPoint = .init(x: x, y: y)
        let point2: CartesianPoint = .init(x: x + width, y: y + height)
        
        return RoundedRectangle(cartesianPoints: [point1, point2])
    }
    
    var top02Shape: RoundedRectangle {
        var frame = frameForTop03()
        frame.size.width = CGFloat(Self.defaultControlSize.width * scaleRatio * 0.55)
        frame.origin.x = frame.origin.x - frame.size.width - theme.defaultSpacing
        
        let point1: CartesianPoint = .init(x: frame.origin.x, y: frame.origin.y)
        let point2: CartesianPoint = .init(x: point1.x + frame.width, y: point1.y + frame.height)
        
        return RoundedRectangle(cartesianPoints: [point1, point2], leftRounded: true)
    }
    
    var top03Shape: RoundedRectangle {
        let e15Points = edge15Shape.edgePoints
        let e15Origin = Point(frame(forShape: edge15Shape).origin)
        
        let width = e15Points[1].x - e15Points[0].x
        let height = Self.defaultControlSize.height * scaleRatio
        let x = e15Origin.x
        let y = e15Origin.y - height - theme.defaultSpacing
        
        let point1: CartesianPoint = .init(x: x, y: y)
        let point2: CartesianPoint = .init(x: point1.x + width, y: point1.y + height)
        
        return RoundedRectangle(cartesianPoints: [point1, point2])
    }
    
    var top04Shape: RoundedRectangle {
        var frame = frameForTop03()
        let top03Width = frame.size.width
        frame.size.width = CGFloat(Self.defaultControlSize.width * scaleRatio * 0.55)
        frame.origin.x = frame.origin.x + top03Width + theme.defaultSpacing
        let rect = Rect(frame)
        
        let point1 = rect.origin
        let point2: CartesianPoint = .init(x: point1.x + rect.width, y: point1.y + rect.height)
        
        return RoundedRectangle(cartesianPoints: [point1, point2], rightRounded: true)
    }
    
    var top05Shape: RoundedRectangle {
        var frame = frameForTop00()
        frame.origin.y = frame.origin.y - frame.size.height - theme.defaultSpacing
        let rect = Rect(frame)
        
        let point1 = rect.origin
        let point2: CartesianPoint = .init(x: point1.x + rect.width, y: point1.y + rect.height)
        
        return RoundedRectangle(cartesianPoints: [point1, point2], leftRounded: true, rightRounded: true)
    }
    
    // MARK: - Components
    
    open lazy var outerRing01: CrescentControl = {
        let button = CrescentControl(shape: outerRing01Shape, delegate: self)
        button.setTitle("OR01", for: .init())
        button.titleEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 0, right: 0)
        button.color = theme.primaryDark
        return button
    }()
    
    open lazy var outerRing05: CrescentControl = {
        let button = CrescentControl(shape: outerRing05Shape, delegate: self)
        button.setTitle("OR05", for: .init())
        button.color = theme.primaryDark
        return button
    }()
    
    open lazy var top01: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: top01Shape, delegate: self)
        button.setTitle("CALIBRATE", for: .init())
        button.color = theme.tertiaryLight
        return button
    }()
    
    open var calibrate: RoundedRectangleControl {
        return top01
    }
    
    open lazy var top02: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: top02Shape, delegate: self)
        button.setTitle("T02", for: .init())
        button.color = theme.primaryLight
        return button
    }()
    
    open lazy var top03: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: top03Shape, delegate: self)
        button.setTitle("T03", for: .init())
        button.color = theme.tertiaryDark
        return button
    }()
    
    open lazy var top04: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: top04Shape, delegate: self)
        button.setTitle("T04", for: .init())
        button.color = theme.primaryDark
        return button
    }()
    
    open lazy var top05: RoundedRectangleControl = {
        let button = RoundedRectangleControl(shape: top05Shape, delegate: self)
        button.setTitle("T05", for: .init())
        button.color = theme.primaryDark
        return button
    }()
    
    // MARK: - Frame Calculations
    
    func frameForTop01() -> CGRect {
        let e13Points = edge13Shape.edgePoints
        let e13Origin = frame(forShape: edge13Shape).origin
        let width = CGFloat(e13Points[1].x - e13Points[0].x)
        let height = CGFloat(Self.defaultControlSize.height * scaleRatio)
        let x = e13Origin.x
        let y = e13Origin.y - height - theme.defaultSpacing
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func frameForTop02() -> CGRect {
        var frame = frameForTop03()
        frame.size.width = CGFloat(Self.defaultControlSize.width * scaleRatio * 0.55)
        frame.origin.x = frame.origin.x - frame.size.width - theme.defaultSpacing
        return frame
    }
    
    func frameForTop03() -> CGRect {
        let e15Points = edge15Shape.edgePoints
        let e15Origin = frame(forShape: edge15Shape).origin
        
        let width = CGFloat(e15Points[1].x - e15Points[0].x)
        let height = CGFloat(Self.defaultControlSize.height * scaleRatio)
        let x = e15Origin.x
        let y = e15Origin.y - height - theme.defaultSpacing
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func frameForTop04() -> CGRect {
        var frame = frameForTop03()
        let top03Width = frame.size.width
        frame.size.width = CGFloat(Self.defaultControlSize.width * scaleRatio * 0.55)
        frame.origin.x = frame.origin.x + top03Width + theme.defaultSpacing
        
        return frame
    }
    
    func frameForTop05() -> CGRect {
        var frame = frameForTop00()
        frame.origin.y = frame.origin.y - frame.size.height - theme.defaultSpacing
        return frame
    }
}

#if canImport(SwiftUI)
import SwiftUI

struct DirectionGroupingView02Representable: UIViewRepresentable {
    func makeUIView(context: Context) -> DirectionGroupingView02 {
        DirectionGroupingView02(frame: .zero)
    }
    
    func updateUIView(_ uiView: DirectionGroupingView02, context: Context) {
    }
}

#Preview {
    DirectionGroupingView02Representable()
        .background(.black)
}
#endif
#endif
