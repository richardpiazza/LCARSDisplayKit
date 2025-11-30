import Swift2D

public protocol Scalable {
    static var intrinsicSize: Size { get }
}

public extension Scalable {
    static func scale(to size: Size) -> (size: Size, scale: Double) {
        Scaler.scale(from: intrinsicSize, to: size)
    }
}
