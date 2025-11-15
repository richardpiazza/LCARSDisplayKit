import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

public typealias CrescentView = CartesianShapeView<Crescent>
public typealias CruxView = CartesianShapeView<Crux>
public typealias DirectionView = CartesianShapeView<Direction>
public typealias ElbowView = CartesianShapeView<Elbow>
public typealias EdgedCrescentView = CartesianShapeView<EdgedCrescent>
public typealias ObroundView = CartesianShapeView<Obround>
public typealias WedgeView = CartesianShapeView<Wedge>

public struct CartesianShapeView<T: CartesianShape>: View {
    
    struct PathButtonStyle: ButtonStyle {
        var id: T.ID
        var path: Path
        
        @Environment(\.theme) private var theme
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack {
                if let color = theme.color(for: id) {
                    path
                        .foregroundStyle(color)
                } else {
                    path
                }
                
                configuration
                    .label
                    .foregroundStyle(theme.textColor(on: .primaryLight))
                    .font(.scaledLCARS(for: .title2))
            }
            .clipShape(path)
            .contentShape(path)
            .saturation(configuration.isPressed ? 0.5 : 1.0)
        }
    }
    
    var title: String
    var id: T.ID
    var path: Path
    var rect: CGRect
    var offset: CGPoint
    var action: (T.ID) -> Void
    
    @Environment(\.behaviors) private var behaviors
    
    @State private var behavior: ControlBehavior?
    @State private var timer: Timer?
    @State private var opacity: Double = 1.0
    @State private var disabled: Bool = false
    
    public init(
        _ shape: T,
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset = .zero,
        action: @escaping (T.ID) -> Void = { _ in }
    ) {
        title = ""
        id = shape.id
        self.path = Path(shape.path)
        self.rect = CGRect(plane.rect(for: shape.cartesianFrame))
        self.offset = CGPoint(offset)
        self.action = action
    }
    
    public init(
        _ title: String,
        shape: T,
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset = .zero,
        action: @escaping (T.ID) -> Void = { _ in }
    ) {
        self.title = title
        id = shape.id
        path = Path(shape.path)
        self.rect = CGRect(plane.rect(for: shape.cartesianFrame))
        self.offset = CGPoint(offset)
        self.action = action
    }
    
    public var body: some View {
        Button(title) {
            action(id)
        }
        .buttonStyle(PathButtonStyle(id: id, path: path))
        .frame(
            width: rect.width,
            height: rect.height
        )
        .position(
            x: rect.minX + offset.x + (rect.width / 2.0),
            y: rect.minY + offset.y + (rect.height / 2.0)
        )
        .opacity(opacity)
        .disabled(disabled)
        .onChange(of: behaviors, initial: true) { _, newValue in
            behavior = newValue[id]
        }
        .onChange(of: behavior) { oldValue, newValue in
            disable(behavior: oldValue)
            enable(behavior: newValue)
        }
    }
    
    private func disable(behavior value: ControlBehavior?) {
        switch value {
        case .disabled:
            disabled = false
        case .hidden:
            opacity = 1.0
        case .pulsing:
            timer?.invalidate()
            timer = nil
            withAnimation {
                opacity = 1.0
            }
        default:
            break
        }
    }
    
    private func enable(behavior value: ControlBehavior?) {
        switch value {
        case .disabled:
            disabled = true
        case .hidden:
            opacity = 0.0
        case .pulsing(let timeInterval):
            timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
                withAnimation {
                    opacity = (opacity == 1.0) ? 0.0 : 1.0
                }
            }
        default:
            break
        }
    }
}
#endif
