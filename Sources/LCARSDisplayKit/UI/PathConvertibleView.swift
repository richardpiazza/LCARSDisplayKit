#if canImport(SwiftUI)
import GraphPoint
import Swift2D
import SwiftUI

public struct PathConvertibleView<T: PathConvertible & SizeConvertible>: View {

    var path: Path
    var size: Size
    var id: CartesianIdentifier
    var title: String
    var action: (CartesianIdentifier) -> Void

    @Environment(\.behaviors) private var behaviors

    @State private var behavior: ControlBehavior?
    @State private var timer: Timer?
    @State private var opacity: Double = 1.0
    @State private var disabled: Bool = false

    public init(
        path: Path,
        size: Size,
        id: CartesianIdentifier = "",
        title: String = "",
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        self.id = id
        self.title = title
        self.path = path
        self.size = size
        self.action = action
    }

    public init(
        _ t: T,
        id: CartesianIdentifier = "",
        title: String = "",
        action: @escaping (CartesianIdentifier) -> Void = { _ in }
    ) {
        path = Path(t.path)
        size = t.size
        self.id = id
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(title) {
            action(id)
        }
        .buttonStyle(PathButtonStyle(id: id, path: path))
        .frame(
            width: size.width,
            height: size.height
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
