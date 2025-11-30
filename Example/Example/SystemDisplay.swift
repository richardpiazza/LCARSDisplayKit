import GraphPoint
import LCARSDisplayKit
import Swift2D
import SwiftUI

struct SystemDisplay: View {

    static let intrinsicSize: Size = Size(width: 1760, height: 960)

    var plane: CartesianPlane
    var scaledSize: Size
    var scale: Double

    @Environment(\.theme) private var theme

    init(size: Size = Self.intrinsicSize) {
        plane = CartesianPlane(size: size)
        (scaledSize, scale) = Scaler.scale(from: Self.intrinsicSize, to: size)
    }

    var body: some View {
        ZStack {
            ElbowView(
                Elbow(
                    size: Size(width: 400, height: 960),
                    left: false,
                    horizontalHeight: 200,
                    verticalWidth: 100,
                    shouldMatchRadius: true
                )
            ) { _ in
            }
            .offset(x: 0)
            .foregroundStyle(theme.color(for: .quaternaryLight))

            ElbowView(
                Elbow(
                    size: Size(width: 400, height: 960),
                    horizontalHeight: 200,
                    verticalWidth: 100,
                    shouldMatchRadius: true
                )
            ) { _ in
            }
            .offset(x: 420)
            .foregroundStyle(theme.color(for: .quaternaryLight))

            ObroundView(
                Obround(),
                id: .top00,
                title: "Hello"
            ) { _ in
            }
            .foregroundStyle(theme.color(for: .primaryLight))
            .offset(x: -100, y: 200)
        }
    }
}

#Preview {
    GeometryReader { geometry in
        SystemDisplay(size: Size(geometry.size))
            .overlay {
                Text(geometry.size.debugDescription)
            }
    }
    .background(.black)
}
