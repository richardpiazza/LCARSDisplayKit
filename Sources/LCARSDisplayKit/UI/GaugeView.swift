#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

public struct GaugeView: View {
    
    public static let intrinsicSize: Size = Size(width: 100.0, height: 340.0)

    var size: Size
    var steps: Int
    var majorEvery: Int
    var capSteps: Int
    var value: CGFloat
    var color: Color

    private var scale: CGFloat
    private var step: CGFloat
    private var majorSteps: Int
    private var majorSpace: CGFloat { CGFloat((steps + 1) / majorEvery) }
    private var indices: [Int]
    
    public init(
        size: Size = Self.intrinsicSize,
        steps: Int = 20,
        majorEvery: Int = 3,
        capSteps: Int = 6,
        value: CGFloat = 0.5,
        color: Color = .blue
    ) {
        let (_, scale) = Self.intrinsicSize.aspectFit(to: size)
        self.size = size
        self.steps = steps
        self.majorEvery = majorEvery
        self.capSteps = capSteps
        self.value = value
        self.color = color
        self.scale = scale
        step = size.height / CGFloat(steps + 1)
        majorSteps = (steps + 1) / majorEvery
        indices = Array(1..<majorSteps)
    }
    
    public init(
        scale: CGFloat,
        steps: Int = 20,
        majorEvery: Int = 3,
        capSteps: Int = 6,
        value: CGFloat = 0.5,
        color: Color = .blue,
    ) {
        size = Self.intrinsicSize.scale(by: scale)
        self.steps = steps
        self.majorEvery = majorEvery
        self.capSteps = capSteps
        self.value = value
        self.color = color
        self.scale = scale
        step = size.height / CGFloat(steps + 1)
        majorSteps = (steps + 1) / majorEvery
        indices = Array(1..<majorSteps)
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color.clear, location: 0.0),
                    Gradient.Stop(color: color, location: value),
                    Gradient.Stop(color: Color.clear, location: value),
                ],
                startPoint: .bottom,
                endPoint: .top
            )
            
            GaugeScale(
                steps: steps,
                majorEvery: majorEvery
            )
            .stroke(color, lineWidth: 2.0)
            
            Rectangle()
                .frame(width: 6.0, height: step * CGFloat(capSteps))
                .position(
                    x: 6,
                    y: (step * CGFloat(capSteps)) / 2,
                )
                .foregroundStyle(color)
            
            Rectangle()
                .frame(width: 6.0, height: step * CGFloat(capSteps))
                .position(
                    x: size.width - 6,
                    y: (step * CGFloat(capSteps)) / 2,
                )
                .foregroundStyle(color)
            
            Rectangle()
                .frame(height: 4)
                .position(
                    x: size.width / 2,
                    y: size.height - (size.height * value)
                )
                .foregroundStyle(color)
            
            ForEach(indices, id: \.self) { index in
                Text("\(index)")
                    .font(.lcars(size: 20, scale: scale))
                    .position(
                        x: size.width / 2,
                        y: size.height - (size.height / majorSpace * CGFloat(index))
                    )
            }
        }
        .frame(width: size.width, height: size.height)
        .border(color, width: 4.0)
    }
}

private struct GaugeCap: Shape {
    
    var indicatorInset: CGFloat
    var strokeWidth: CGFloat
    
    private var padding: CGFloat { strokeWidth / 2 }
    
    init(
        indicatorInset: CGFloat = 0.35,
        strokeWidth: CGFloat = 4.0,
    ) {
        self.indicatorInset = indicatorInset
        self.strokeWidth = strokeWidth
    }

    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.width * indicatorInset, y: rect.height))
            path.addLine(to: CGPoint(x: 0 + padding, y: rect.height))
            path.addLine(to: CGPoint(x: 0 + padding, y: 0 + padding))
            path.addLine(to: CGPoint(x: rect.width - padding, y: 0 + padding))
            path.addLine(to: CGPoint(x: rect.width - padding, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width - padding - (rect.width * indicatorInset), y: rect.height))
            path.addLine(to: CGPoint(x: rect.width - padding, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width - padding, y: 0 + padding))
            path.addLine(to: CGPoint(x: 0 + padding, y: 0 + padding))
            path.addLine(to: CGPoint(x: 0 + padding, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width * indicatorInset, y: rect.height))
            path.closeSubpath()
        }
    }
}

private struct GaugeScale: Shape {
    
    var steps: Int
    var majorEvery: Int
    var majorStepInset: CGFloat
    var minorStepInset: CGFloat
    
    init(
        steps: Int,
        majorEvery: Int,
        majorStepInset: CGFloat = 0.30,
        minorStepInset: CGFloat = 0.20,
    ) {
        self.steps = steps
        self.majorEvery = majorEvery
        self.majorStepInset = majorStepInset
        self.minorStepInset = minorStepInset
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        let gap = rect.height / CGFloat(steps + 1)
        
        let path = CGMutablePath()
        
        for step in 1..<(steps + 1) {
            let y = gap * CGFloat(step)
            let major = CGFloat(step).truncatingRemainder(dividingBy: CGFloat(majorEvery)) == 0
            
            if major {
                path.move(to: CGPoint(x: 0, y: y))
                path.addLine(to: CGPoint(x: rect.width * majorStepInset, y: y))
                path.closeSubpath()
                
                path.move(to: CGPoint(x: rect.width - (rect.width * majorStepInset), y: y))
                path.addLine(to: CGPoint(x: rect.width, y: y))
                path.closeSubpath()
            } else {
                path.move(to: CGPoint(x: 0, y: y))
                path.addLine(to: CGPoint(x: rect.width * minorStepInset, y: y))
                path.closeSubpath()
                
                path.move(to: CGPoint(x: rect.width - (rect.width * minorStepInset), y: y))
                path.addLine(to: CGPoint(x: rect.width, y: y))
                path.closeSubpath()
            }
        }
        
        return Path(path)
    }
}

#Preview {
    GaugeView()
}

#Preview {
    GaugeView(scale: 1.5)
}
#endif
