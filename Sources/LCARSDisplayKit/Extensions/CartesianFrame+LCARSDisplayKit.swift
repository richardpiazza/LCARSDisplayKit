import GraphPoint
import Swift2D

extension CartesianFrame {
    /// Translates a cartesian point that is contained within the frame to a non-cartesian point relative to the frame.
    ///
    /// This is used in 'crescent' `CGPath` calculations to determine **non-arc** points within the frame. Arcs are
    /// drawn using a center point reference which exist outside of the frame. When drawing other points within the
    /// frame, those points must be translated relative to the frame itself.
    ///
    /// The output of this function is only a `Point`, because it no longer has any relation to the Cartesian 'frame' or
    /// 'plane'.
    func relativePointForCartesianPoint(_ cartesianPoint: CartesianPoint) -> Point {
        return CartesianPoint(
            x: abs(origin.x - cartesianPoint.x),
            y: abs(origin.y - cartesianPoint.y)
        )
    }
}
