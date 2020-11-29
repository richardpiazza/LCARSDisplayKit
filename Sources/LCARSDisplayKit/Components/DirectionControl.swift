import GraphPoint
import Swift2D
#if canImport(UIKit)
import UIKit

#if !os(watchOS)
open class DirectionControl: InteractiveControl<Direction> {
    
    override open var colors: [UIColor]? {
        return [theme.primaryDark, theme.primaryLight]
    }
    
    override open var touchedColors: [UIColor]? {
        guard let c = self.colors else {
            return nil
        }
        
        var colors = c
        for (index, color) in colors.enumerated() {
            colors[index] = color.adaptingSaturation(by: 0.8)
        }
        return colors
    }
}
#endif

extension Direction: ExpressibleByPath {
    public var path: CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        subpaths?.forEach { path.addPath($0) }
        return path
    }
    
    public var subpaths: [CGMutablePath]? {
        var paths: [CGMutablePath] = [CGMutablePath]()
        
        let frame = cartesianFrame
        let center = frame.offsetToCartesianOrigin
        let unit = max(frame.width, frame.height) / 2
        let size = self.size
        
        switch cardinal {
        case .right:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcX = size.width + center.x - frame.width
            arrowPath.addArc(arc: exteriorArc, center: CartesianPoint(x: arcX, y: center.y), clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: size.width - unit, y: size.height))
            arrowPath.addLine(to: CartesianPoint(x: size.width - unit, y: 0))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: size.width - (unit * 1.25), y: unit))
            arrowPath.addLine(to: CartesianPoint(x: size.width - (unit * 1.75), y: size.height * 0.1))
            arrowPath.addLine(to: CartesianPoint(x: size.width - (unit * 1.75), y: size.height * 0.9))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: 0, width: size.width - (unit * 2.0), height: size.height))
            paths.append(remainingPath)
        case .down:
            let arrowPath: CGMutablePath = CGMutablePath()
            let arcY = size.height + center.y - frame.height
            arrowPath.addArc(arc: exteriorArc, center: CartesianPoint(x: center.x, y: arcY), clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: 0.0, y: size.height - unit))
            arrowPath.addLine(to: CartesianPoint(x: size.width, y: size.height - unit))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: unit, y: size.height - (unit * 1.25)))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.1, y: size.height - (unit * 1.75)))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.9, y: size.height - (unit * 1.75)))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: 0, width: size.width, height: size.height - (unit * 2)))
            paths.append(remainingPath)
        case .left:
            let arrowPath: CGMutablePath = CGMutablePath()
            arrowPath.addArc(arc: exteriorArc, center: center, clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: unit, y: 0))
            arrowPath.addLine(to: CartesianPoint(x: unit, y: size.height))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: unit * 1.25, y: unit))
            arrowPath.addLine(to: CartesianPoint(x: unit * 1.75, y: size.height * 0.1))
            arrowPath.addLine(to: CartesianPoint(x: unit * 1.75, y: size.height * 0.9))
            arrowPath.closeSubpath()
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: (unit * 2), y: 0, width: size.width - (unit * 2.0), height: size.height))
            paths.append(remainingPath)
        case .up:
            let arrowPath: CGMutablePath = CGMutablePath()
            arrowPath.addArc(arc: exteriorArc, center: center, clockwise: false)
            arrowPath.addLine(to: CartesianPoint(x: size.width, y: unit))
            arrowPath.addLine(to: CartesianPoint(x: 0, y: unit))
            arrowPath.closeSubpath()
            
            arrowPath.move(to: CartesianPoint(x: unit, y: unit * 1.25))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.1, y: unit * 1.75))
            arrowPath.addLine(to: CartesianPoint(x: size.width * 0.9, y: unit * 1.75))
            arrowPath.closeSubpath()
            
            arrowPath.addRect(Rect(x: 0, y: (unit * 2.0), width: size.width, height: (unit * 0.5)))
            paths.append(arrowPath)
            
            let remainingPath: CGMutablePath = CGMutablePath()
            remainingPath.addRect(Rect(x: 0, y: (unit * 2.75), width: size.width, height: unit))
            remainingPath.addRect(Rect(x: 0, y: (unit * 4.0), width: size.width, height: size.height - (unit * 4.0)))
            paths.append(remainingPath)
        }
        
        return paths
    }
}
#endif
