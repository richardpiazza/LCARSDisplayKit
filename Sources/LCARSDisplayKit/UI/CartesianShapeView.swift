#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

public typealias CrescentControlView = CartesianShapeView<CrescentControl>
public typealias CruxControlView = CartesianShapeView<CruxControl>
public typealias DirectionControlView = CartesianShapeView<DirectionControl>
public typealias ElbowControlView = CartesianShapeView<ElbowControl>
public typealias EdgedCrescentControlView = CartesianShapeView<EdgedCrescentControl>
public typealias ObroundControlView = CartesianShapeView<ObroundControl>
public typealias WedgeControlView = CartesianShapeView<WedgeControl>

public struct CartesianShapeView<T: CartesianShape>: View {

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
        path = Path(shape.path)
        rect = CGRect(plane.rect(for: shape.cartesianFrame))
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
        rect = CGRect(plane.rect(for: shape.cartesianFrame))
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
