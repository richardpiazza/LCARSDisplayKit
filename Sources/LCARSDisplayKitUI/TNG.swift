#if canImport(LCARSDisplayKit)
import LCARSDisplayKit
#endif
#if (os(iOS) || os(tvOS))
import UIKit
    
public struct TNG: Theme {
    
    /// A pale-yellow color (Pale Canary)
    /// - HEX #FFFF99
    public var primaryLight: UIColor {
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha: 1.0)
    }
    
    /// A medium-yellow color (Golden Tainoi)
    /// - HEX #FFCC66
    public var primaryMedium: UIColor {
        return UIColor(red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A dense-orange color (Neon Carrot)
    /// - HEX #FF9933
    public var primaryDark: UIColor {
        return UIColor(red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha: 1.0)
    }
    
    /// A pale-purple color (Cosmic)
    /// - HEX #664466;
    public var secondaryLight: UIColor {
        return UIColor(red: 102/255.0, green: 68/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A medium-purple color (Pastel Violet)
    /// - HEX #CC99CC;
    public var secondaryMedium: UIColor {
        return UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// Not-used
    public var secondaryDark: UIColor {
        return UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A pale-blue color (Baby Blue Eyes)
    /// - HEX #99CCFF
    public var tertiaryLight: UIColor {
        return UIColor(red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
    }
    
    /// A rich blue color (Bahama Blue)
    /// = HEX #006699
    public var tertiaryMedium: UIColor {
        return UIColor(red: 0/255.0, green: 102/255.0, blue: 153/255.0, alpha: 1.0)
        
    }
    
    /// A medium-blue color (Mariner)
    /// - HEX #3366CC
    public var tertiaryDark: UIColor {
        return UIColor(red: 51/255.0, green: 102/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A flat gray color
    /// - HEX #6E6E6E
    public var inactive: UIColor {
        return UIColor(red: 177/255.0, green: 149/255.0, blue: 122/255.0, alpha: 1.0)
    }
    
    public var title: UIFont {
        return UIFont(data: Assets.Fonts.data, size: 40.0)!
    }
    
    public var subtitle: UIFont {
        return UIFont(data: Assets.Fonts.data, size: 30.0)!
    }
    
    public var body: UIFont {
        return UIFont(data: Assets.Fonts.data, size: 20.0)!
    }
    
    public var neutralBeepURL: URL? {
        return Assets.Sounds.beep3URL
    }
    
    public var successBeepURL: URL? {
        return Assets.Sounds.beep2URL
    }
    
    public var failureBeepURL: URL? {
        return Assets.Sounds.beep1URL
    }
}

#endif
