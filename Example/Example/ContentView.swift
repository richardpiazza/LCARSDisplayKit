import GraphPoint
import LCARSDisplayKit
import Swift2D
import SwiftUI

struct ContentView: View {

    private let commandSequencer = CommandSequencer()

    @Environment(\.theme) private var theme
    @State private var behaviors: [CartesianIdentifier: ControlBehavior] = [
        .innerRing10: .hidden,
        .innerRing16: .hidden,
        .outerRing14: .hidden,
    ]

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { geometry in
                ElbowControlView(
                    "",
                    shape: ElbowControl(
                        elbow: Elbow(
                            size: Size(geometry.size),
                            horizontalHeight: 140,
                            verticalWidth: 40,
                            closedHeight: 30
                        ),
                        identifier: nil
                    ),
                    in: CartesianPlane(origin: .zero, size: Size(geometry.size))
                )
                .foregroundStyle(theme.color(for: .quaternaryLight))
            }

            DPadClusterExtendedView { id in
                commandSequencer.didActivate(id)
            }
            .offset(x: 50, y: -40)
        }
        .background(.black)
        .environment(\.behaviors, behaviors)
        .task {
            commandSequencer.register(commandSequence: [.edge07, .outerRing16]) {
                behaviors[.innerRing11] = .pulsing(timeInterval: 1.5)
                behaviors[.outerRing16] = .pulsing(timeInterval: 1.75)
                behaviors[.outerRing01] = .pulsing(timeInterval: 2.0)
            }

            commandSequencer.register(commandSequence: [.edge07, .outerRing17]) {
                behaviors[.innerRing11] = nil
                behaviors[.outerRing16] = nil
                behaviors[.outerRing01] = nil
            }
        }
    }
}

#Preview {
    ContentView()
}
