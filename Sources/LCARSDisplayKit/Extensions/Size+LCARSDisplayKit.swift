import Swift2D

public extension Size {
    func scale(by value: Double) -> Size {
        Size(
            width: width * value,
            height: height * value
        )
    }
}
