import GraphPoint
import Swift2D
#if canImport(SwiftUI)
import SwiftUI

public struct CartesianShapeView<T: CartesianShape>: View {
    
    struct PathButtonStyle: ButtonStyle {
        var path: Path
        
        @Environment(\.appearance) private var appearance
        
        func makeBody(configuration: Configuration) -> some View {
            ZStack {
                path
                
                configuration
                    .label
                    .foregroundStyle(appearance.text)
                    .font(.scaledLCARS(for: .title2))
            }
            .clipShape(path)
            .contentShape(path)
        }
    }
    
    var title: String
    var path: Path
    var rect: CGRect
    var offset: CGPoint
    var action: () -> Void
    
    public init(
        _ shape: T,
        in plane: CartesianPlane,
        with offset: CartesianFrame.Offset = .zero,
        action: @escaping () -> Void = { }
    ) {
        title = ""
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
        action: @escaping () -> Void = { }
    ) {
        self.title = title
        self.path = Path(shape.path)
        self.rect = CGRect(plane.rect(for: shape.cartesianFrame))
        self.offset = CGPoint(offset)
        self.action = action
    }
    
    public var body: some View {
        Button(title, action: action)
            .buttonStyle(PathButtonStyle(path: path))
            .frame(
                width: rect.width,
                height: rect.height
            )
            .position(
                x: rect.minX + offset.x + (rect.width / 2.0),
                y: rect.minY + offset.y + (rect.height / 2.0)
            )
    }
}

public typealias CrescentView = CartesianShapeView<Crescent>
public typealias CruxView = CartesianShapeView<Crux>
public typealias DirectionView = CartesianShapeView<Direction>
public typealias ElbowView = CartesianShapeView<Elbow>
public typealias EdgedCrescentView = CartesianShapeView<EdgedCrescent>
public typealias ObroundView = CartesianShapeView<Obround>
public typealias WedgeView = CartesianShapeView<Wedge>
#endif
