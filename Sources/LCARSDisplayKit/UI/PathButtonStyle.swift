#if canImport(SwiftUI)
import SwiftUI

struct PathButtonStyle: ButtonStyle {
    var id: CartesianIdentifier
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
#endif
