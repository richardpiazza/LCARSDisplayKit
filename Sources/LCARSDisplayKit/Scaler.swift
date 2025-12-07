import Swift2D

public enum Scaler {
    /// The default spacing used between control elements
    public static let intrinsicSpacing: Double = 8.0

    /// Determines the maximum size and scale at which an element can be presented.
    ///
    /// - parameters:
    /// - intrinsicSize: The default `Size` at which an element was designed.
    /// - providedSize: The space available/provided for presentation
    /// - returns: The proposed `Size` and scale ratio to the default intrinsic size.
    public static func scale(
        from intrinsicSize: Size,
        to providedSize: Size
    ) -> (size: Size, scale: Double) {
        // TODO: There _must_ be a better way or formula for this.
        let scaledSize: Size
        let scale: Double

        if intrinsicSize.width >= intrinsicSize.height {
            switch (providedSize.width >= intrinsicSize.width, providedSize.height >= intrinsicSize.height) {
            case (true, true):
                let widthRatio = providedSize.width / intrinsicSize.width
                let proposedHeight = intrinsicSize.height * widthRatio
                if proposedHeight > providedSize.height {
                    let heightRatio = providedSize.height / intrinsicSize.height
                    let proposedWidth = intrinsicSize.width * heightRatio
                    scaledSize = Size(width: proposedWidth, height: providedSize.height)
                    scale = heightRatio
                } else {
                    scaledSize = Size(width: providedSize.width, height: proposedHeight)
                    scale = widthRatio
                }
            case (true, false):
                let heightRatio = intrinsicSize.height / providedSize.height
                let proposedWidth = intrinsicSize.width * heightRatio
                scaledSize = Size(width: proposedWidth, height: providedSize.height)
                scale = heightRatio
            case (false, true):
                let widthRatio = intrinsicSize.width / providedSize.width
                let proposedHeight = intrinsicSize.height * widthRatio
                scaledSize = Size(width: providedSize.width, height: proposedHeight)
                scale = widthRatio
            case (false, false):
                let widthRatio = providedSize.width / intrinsicSize.width
                let proposedHeight = intrinsicSize.height * widthRatio
                if proposedHeight > providedSize.height {
                    let heightRatio = providedSize.height / intrinsicSize.height
                    let proposedWidth = intrinsicSize.width * heightRatio
                    scaledSize = Size(width: proposedWidth, height: providedSize.height)
                    scale = heightRatio
                } else {
                    scaledSize = Size(width: providedSize.width, height: proposedHeight)
                    scale = widthRatio
                }
            }
        } else {
            switch (providedSize.height >= intrinsicSize.height, providedSize.width >= intrinsicSize.width) {
            case (true, true):
                let heightRatio = providedSize.height / intrinsicSize.height
                let proposedWidth = intrinsicSize.width * heightRatio
                if proposedWidth > providedSize.width {
                    let widthRatio = providedSize.width / intrinsicSize.width
                    let proposedHeight = intrinsicSize.height * widthRatio
                    scaledSize = Size(width: providedSize.width, height: proposedHeight)
                    scale = widthRatio
                } else {
                    scaledSize = Size(width: proposedWidth, height: providedSize.height)
                    scale = heightRatio
                }
            case (true, false):
                let widthRatio = intrinsicSize.width / providedSize.width
                let proposedHeight = intrinsicSize.height * widthRatio
                scaledSize = Size(width: providedSize.width, height: proposedHeight)
                scale = widthRatio
            case (false, true):
                let heightRatio = providedSize.height / intrinsicSize.height
                let proposedWidth = intrinsicSize.width * heightRatio
                scaledSize = Size(width: proposedWidth, height: providedSize.height)
                scale = heightRatio
            case (false, false):
                let heightRatio = providedSize.height / intrinsicSize.height
                let proposedWidth = intrinsicSize.width * heightRatio
                if proposedWidth > providedSize.width {
                    let widthRatio = providedSize.width / intrinsicSize.width
                    let proposedHeight = intrinsicSize.height * widthRatio
                    scaledSize = Size(width: providedSize.width, height: proposedHeight)
                    scale = widthRatio
                } else {
                    scaledSize = Size(width: proposedWidth, height: providedSize.height)
                    scale = heightRatio
                }
            }
        }

        return (scaledSize, scale)
    }
}
