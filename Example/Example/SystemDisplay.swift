import GraphPoint
import LCARSDisplayKit
import Swift2D
import SwiftUI

struct SystemDisplay: View {

    static let intrinsicSize: Size = Size(width: 1760, height: 960)

    var size: Size
    var scale: Double
    var clusterScale: Double

    @Environment(\.theme) private var theme

    init(
        size value: Size = Self.intrinsicSize
    ) {
        (size, scale) = Scaler.scale(from: Self.intrinsicSize, to: value)
        (_, clusterScale) = Scaler.scale(
            from: DPadClusterView.intrinsicSize,
            to: Size(width: 760 * scale, height: 760 * scale)
        )
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            DPadClusterView(scale: clusterScale)
                .position(x: 400 * scale, y: 640 * scale)
            
            chrome
            
            fork
                .foregroundStyle(theme.color(for: .quaternaryLight))
            
            ObroundView(
                size: Obround.intrinsicSize.scale(by: clusterScale),
                roundLeading: false,
                roundTrailing: false
            )
            .position(x: 1030 * scale, y: 535 * scale)
            
            ObroundView(
                size: Size(
                    width: 30,
                    height: Obround.intrinsicSize.height * scale
                ),
                roundLeading: false,
                roundTrailing: false
            )
            .position(x: 1205 * scale, y: 535 * scale)
            
            Text(" 44")
                .font(.lcars(size: 65, scale: scale))
                .position(x: 1265 * scale, y: 537 * scale)
            
            ObroundView(
                size: Obround.intrinsicSize.scale(by: clusterScale),
                roundLeading: false
            )
            .position(x: 1375 * scale, y: 535 * scale)
            
            ObroundView(
                size: Obround.intrinsicSize.scale(by: clusterScale)
            )
            .position(x: 1530 * scale, y: 535 * scale)
            
            ObroundView(
                size: Obround.intrinsicSize.scale(by: clusterScale)
            )
            .position(x: 1685 * scale, y: 535 * scale)
            
            ObroundView(
                size: Obround.intrinsicSize.scale(by: clusterScale),
                roundLeading: false,
                roundTrailing: false
            )
            .position(x: 1030 * scale, y: 665 * scale)
            
            ObroundView(
                size: Obround.intrinsicSize.scale(by: clusterScale),
                roundLeading: false,
                roundTrailing: false
            )
            .position(x: 1030 * scale, y: 735 * scale)
        }
        .frame(width: size.width, height: size.height)
    }
    
    private var chrome: some View {
        ZStack(alignment: .topLeading) {
            ObroundView(
                size: Size(
                    width: 210 * scale,
                    height: 300 * scale,
                ),
                roundTrailing: false,
                rounding: .quarter,
                title: "One"
            )
            .position(
                x: 110 * scale,
                y: 150 * scale
            )
            .foregroundStyle(theme.color(for: .quaternaryLight))
            
            ObroundView(
                size: Size(
                    width: 360 * scale,
                    height: 300 * scale
                ),
                roundLeading: false,
                roundTrailing: false,
                rounding: .quarter,
                title: "Two"
            )
            .position(
                x: 410 * scale,
                y: 150 * scale
            )
            .foregroundStyle(theme.color(for: .secondaryLight))
            
            ElbowView(
                size: Size(
                    width: 280 * scale,
                    height: 450 * scale
                ),
                alignment: .topRight,
                interiorRounding: nil,
                bodyHeight: 300 * scale,
                stemWidth: 80 * scale,
                title: "Three"
            )
            .position(
                x: 745 * scale,
                y: 225 * scale
            )
            .foregroundStyle(theme.color(for: .quaternaryLight))
            
            ElbowView(
                size: Size(
                    width: 140 * scale,
                    height: 150 * scale
                ),
                alignment: .topLeft,
                exteriorRounding: nil,
                interiorRounding: nil,
                bodyHeight: 25 * scale,
                stemWidth: 80 * scale,
                closedHeight: 25 * scale,
                title: "Four"
            )
            .position(
                x: 875 * scale,
                y: 535 * scale
            )
            .foregroundStyle(theme.color(for: .quaternaryLight))
            
            ElbowView(
                size: Size(
                    width: 140 * scale,
                    height: 340 * scale
                ),
                alignment: .bottomLeft,
                interiorRounding: nil,
                bodyHeight: 180 * scale,
                stemWidth: 80 * scale,
                title: "Five"
            )
            .position(
                x: 875 * scale,
                y: 790 * scale
            )
            .foregroundStyle(theme.color(for: .quaternaryLight))
            
            ObroundView(
                size: Size(
                    width: 280 * scale,
                    height: 180 * scale
                ),
                roundLeading: false,
                roundTrailing: false,
                title: "Six"
            )
            .position(
                x: 1100 * scale,
                y: 870 * scale
            )
            .foregroundStyle(theme.color(for: .primaryMedium))
            
            ObroundView(
                size: Size(
                    width: 300 * scale,
                    height: 54 * scale
                ),
                roundLeading: false,
                roundTrailing: false,
                title: "Seven"
            )
            .position(
                x: 1400 * scale,
                y: 807 * scale
            )
            .foregroundStyle(theme.color(for: .secondaryLight))
            
            ObroundView(
                size: Size(
                    width: 300 * scale,
                    height: 54 * scale
                ),
                roundLeading: false,
                roundTrailing: false,
                title: "Eight"
            )
            .position(
                x: 1400 * scale,
                y: 870 * scale
            )
            .foregroundStyle(theme.color(for: .tertiaryMedium))
            
            ObroundView(
                size: Size(
                    width: 300 * scale,
                    height: 54 * scale
                ),
                roundLeading: false,
                roundTrailing: false,
                title: "Nine"
            )
            .position(
                x: 1400 * scale,
                y: 933 * scale
            )
            .foregroundStyle(theme.color(for: .secondaryDark))
            
            ObroundView(
                size: Size(
                    width: 195 * scale,
                    height: 180 * scale
                ),
                roundLeading: false,
                rounding: .quarter,
                title: "Ten"
            )
            .position(
                x: 1660 * scale,
                y: 870 * scale
            )
            .foregroundStyle(theme.color(for: .quaternaryLight))
        }
    }
    
    private var fork: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .frame(width: 100 * scale, height: 25 * scale)
                .position(x: 1008 * scale, y: 472 * scale)
            
            Rectangle()
                .frame(width: 100 * scale, height: 25 * scale)
                .position(x: 1008 * scale, y: 598 * scale)
            
            Rectangle()
                .frame(width: 140 * scale, height: 25 * scale)
                .position(x: 1138 * scale, y: 472 * scale)
            
            Rectangle()
                .frame(width: 140 * scale, height: 25 * scale)
                .position(x: 1138 * scale, y: 598 * scale)
            
            Rectangle()
                .frame(width: 100 * scale, height: 25 * scale)
                .position(x: 1268 * scale, y: 472 * scale)
            
            Rectangle()
                .frame(width: 100 * scale, height: 25 * scale)
                .position(x: 1268 * scale, y: 598 * scale)
            
            Rectangle()
                .frame(width: 140 * scale, height: 25 * scale)
                .position(x: 1398 * scale, y: 472 * scale)
            
            Rectangle()
                .frame(width: 140 * scale, height: 25 * scale)
                .position(x: 1398 * scale, y: 598 * scale)
            
            Rectangle()
                .frame(width: 100 * scale, height: 25 * scale)
                .position(x: 1528 * scale, y: 472 * scale)
            
            Rectangle()
                .frame(width: 100 * scale, height: 25 * scale)
                .position(x: 1528 * scale, y: 598 * scale)
            
            Rectangle()
                .frame(width: 160 * scale, height: 25 * scale)
                .position(x: 1668 * scale, y: 472 * scale)
            
            Rectangle()
                .frame(width: 160 * scale, height: 25 * scale)
                .position(x: 1668 * scale, y: 598 * scale)
        }
    }
}

#Preview {
    GeometryReader { geometry in
//        SystemDisplay()
        SystemDisplay(size: Size(geometry.size))
            .border(.red, width: 2)
    }
}

#Preview {
    SystemDisplay(size: Size(width: 1200, height: 720))
        .border(.red, width: 2)
}
