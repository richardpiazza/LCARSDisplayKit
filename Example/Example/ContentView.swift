import GraphPoint
import LCARSDisplayKit
import Swift2D
import SwiftUI

struct ContentView: View {
    
    private let commandSequencer = CommandSequencer()
    
    @Environment(\.theme) private var theme
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { geometry in
                ElbowView(
                    "",
                    shape: Elbow(
                        size: geometry.size,
                        horizontalHeight: 140,
                        verticalWidth: 40,
                        closedHeight: 30
                    ),
                    in: CartesianPlane(origin: .zero, size: Size(geometry.size)),
                )
                .foregroundStyle(theme.color(for: .quaternaryLight))
            }
            
            DPadClusterExtendedView { id in
                commandSequencer.didActivate(id)
            }
            .offset(x: 50, y: -40)
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
