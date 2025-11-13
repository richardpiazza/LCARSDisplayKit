import GraphPoint
import LCARSDisplayKit
import Swift2D
import SwiftUI

struct ContentView: View {
    
    @Environment(\.appearance) private var appearance
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { geometry in
                ElbowView(
                    "",
                    shape: Elbow(
                        size: Size(geometry.size),
                        horizontalHeight: 140,
                        verticalWidth: 40,
                        closedHeight: 30
                    ),
                    in: CartesianPlane(origin: .zero, size: Size(geometry.size)),
                )
                .foregroundStyle(appearance.inactive)
            }
            
            DPadClusterExtendedView()
                .offset(x: 50, y: -40)
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
