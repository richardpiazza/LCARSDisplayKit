public enum Rounding: Double, Sendable {
    /// Rounding that will always draw a smooth curve from top to bottom of the Obround.
    case half = 0.5
    /// Rounding that will only curve the corner regardless of the height.
    case quarter = 0.25
}
