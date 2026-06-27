import Swift2D

public protocol SizeConvertible {
    static var intrinsicSize: Size { get }
    var size: Size { get }
}

public extension SizeConvertible {
    static func scale(to size: Size) -> (size: Size, scale: Double) {
        intrinsicSize.aspectFit(to: size)
    }
}
