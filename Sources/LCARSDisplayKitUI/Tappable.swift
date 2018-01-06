#if (os(iOS) || os(tvOS))

import UIKit
import GraphPoint
import LCARSDisplayKit

/// Protocol defining methods of an interactive item backed by a `Graphable` element.
public protocol Tappable {
    /// The base Graphable type
    var graphable: Graphable { get set }
    /// The color of the element
    var color: UIColor { get set }
    /// A color used during active touching
    var touchedColor: UIColor { get }
    /// Path representing the image.
    /// Also used to determine if a touch falls within a path (not just within the frame).
    var path: CGMutablePath { get }
    /// An image generated using the `path`
    func image(_ context: CGContext?) -> UIImage?
    /// An image generated using the `path` and substituting the `touchedColor`.
    func touchedImage(_ context: CGContext?) -> UIImage?
    
    /// A collection of paths that make up the `path`
    var subpaths: [CGMutablePath]? { get }
    /// Colors that are used for each of the `subpaths`
    var colors: [UIColor]? { get }
    /// Colors used for each `subpath` used during active touching
    var touchedColors: [UIColor]? { get }
}

public extension Tappable {
    var touchedColor: UIColor {
        return self.color.adaptingSaturation(by: 0.8)
    }
    
    var path: CGMutablePath {
        return graphable.path
    }

    func image(_ context: CGContext?) -> UIImage? {
        if let paths = self.subpaths, let colors = self.colors {
            return UIImage.image(with: paths, colors: colors, size: graphable.size, context: context)
        }

        return UIImage.image(with: self.path, fillColor: self.color, context: context)
    }

    func touchedImage(_ context: CGContext?) -> UIImage? {
        if let paths = self.subpaths, let colors = self.touchedColors {
            return UIImage.image(with: paths, colors: colors, size: graphable.size, context: context)
        }

        return UIImage.image(with: self.path, fillColor: self.touchedColor, context: context)
    }

    var subpaths: [CGMutablePath]? {
        return graphable.subpaths
    }

//    var colors: [UIColor]? {
//        return nil
//    }
//
//    var touchedColors: [UIColor]? {
//        return nil
//    }
}

#endif
