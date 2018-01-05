#if (os(iOS) || os(tvOS))

import UIKit

public extension UIImage {
    /// Creates a UIImage from a path, filled with the specified color
    static func image(with path: CGMutablePath, fillColor color: UIColor, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil

        guard context != nil else {
            return image
        }

        context?.setLineWidth(0)
        context?.setFillColor(color.cgColor)
        context?.addPath(path)
        context?.fillPath()

        image = UIGraphicsGetImageFromCurrentImageContext()

        return image
    }
    
    /// Creates a UIImage from a path, stroked with the specified color
    static func image(with path: CGMutablePath, strokeColor color: UIColor, strokeWidth: CGFloat, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil
        
        guard context != nil else {
            return image
        }
        
        context?.setLineWidth(strokeWidth)
        context?.setStrokeColor(color.cgColor)
        context?.addPath(path)
        context?.strokePath()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    /// Creates a `UIImage` by filling the provided path.
    static func image(with path: CGMutablePath, size: CGSize, color: UIColor, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil
        
        if size.width == 0 || size.height == 0 {
            return image
        }
        
        if context == nil {
            return image
        }
        
        context?.setLineWidth(0)
        context?.setFillColor(color.cgColor)
        context?.addPath(path)
        context?.fillPath()
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    /// Creates a `UIImage` by filling the provided paths with the provided colors.
    static func image(with subpaths: [CGMutablePath], colors: [UIColor], size: CGSize, context: CGContext?) -> UIImage? {
        var image: UIImage? = nil
        
        guard subpaths.count != 0, subpaths.count == colors.count else {
            return image
        }
        
        guard size.width != 0 && size.height != 0 else {
            return image
        }
        
        guard let ctx = context else {
            return image
        }
        
        ctx.setLineWidth(0)
        
        for i in 0..<subpaths.count {
            ctx.setFillColor(colors[i].cgColor)
            ctx.addPath(subpaths[i])
            ctx.fillPath()
        }
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
}

#endif
