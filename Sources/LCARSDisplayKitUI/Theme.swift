#if (os(iOS) || os(tvOS))

import UIKit
import LCARSDisplayKit
    
public protocol Theme {
    // Colors
    var primaryLight: UIColor { get }
    var primaryMedium: UIColor { get }
    var primaryDark: UIColor { get }
    var secondaryLight: UIColor { get }
    var secondaryMedium: UIColor { get }
    var secondaryDark: UIColor { get }
    var tertiaryLight: UIColor { get }
    var tertiaryMedium: UIColor { get }
    var tertiaryDark: UIColor { get }
    var inactive: UIColor { get }
    // Fonts
    var title: UIFont { get }
    var subtitle: UIFont { get }
    var body: UIFont { get }
    // Sounds
    var neutralBeepURL: URL? { get }
    var successBeepURL: URL? { get }
    var failureBeepURL: URL? { get }
    // Sizes
    var defaultSpacing: CGFloat { get }
}

public extension Theme {
    func randomColor() -> UIColor {
        let colors = [primaryLight, primaryDark, tertiaryLight, tertiaryDark]
        let random = arc4random_uniform(UInt32(colors.count))
        return colors[Int(random)]
    }
    
    var defaultSpacing: CGFloat {
        return CGFloat(8)
    }
}

#endif
