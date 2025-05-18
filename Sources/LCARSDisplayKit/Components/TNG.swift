#if canImport(UIKit)
import UIKit
    
public struct TNG: Theme {
    
    public static var shared: TNG = .init()
    
    public init() {
    }
    
    public let primaryLight: UIColor = .paleCanary
    public let primaryMedium: UIColor = .goldenTainoi
    public let primaryDark: UIColor = .neonCarrot
    public let secondaryLight: UIColor = .cosmic
    public let secondaryMedium: UIColor = .pastelViolet
    public let secondaryDark: UIColor = .darkPurple
    public let tertiaryLight: UIColor = .babyBlueEyes
    public let tertiaryMedium: UIColor = .bahamaBlue
    public let tertiaryDark: UIColor = .mariner
    public let inactive: UIColor = .flatGray
    public let title: UIFont = .large
    public let subtitle: UIFont = .medium
    public let body: UIFont = .small
    public let neutralBeep: Data = .bundleSound(name: "beep3")
    public let successBeep: Data = .bundleSound(name: "beep2")
    public let failureBeep: Data = .bundleSound(name: "beep1")
}

extension UIColor {
    /// A pale-yellow color (#FFFF99)
    static var paleCanary: UIColor {
        UIColor(red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha: 1.0)
    }
    
    /// A medium-yellow color (#FFCC66)
    static var goldenTainoi: UIColor {
        UIColor(red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A dense-orange color (#FF9933)
    static var neonCarrot: UIColor {
        UIColor(red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha: 1.0)
    }
    
    /// A pale-purple color (#664466)
    static var cosmic: UIColor {
        UIColor(red: 102/255.0, green: 68/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    /// A medium-purple color (#CC99CC)
    static var pastelViolet: UIColor {
        UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// Not-used
    static var darkPurple: UIColor {
        UIColor(red: 204/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A pale-blue color (#99CCFF)
    static var babyBlueEyes: UIColor {
        UIColor(red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0)
    }
    
    /// A rich blue color (#006699)
    static var bahamaBlue: UIColor {
        UIColor(red: 0/255.0, green: 102/255.0, blue: 153/255.0, alpha: 1.0)
    }
    
    /// A medium-blue color (#3366CC)
    static var mariner: UIColor {
        UIColor(red: 51/255.0, green: 102/255.0, blue: 204/255.0, alpha: 1.0)
    }
    
    /// A flat gray color (#6E6E6E)
    static var flatGray: UIColor {
        UIColor(red: 177/255.0, green: 149/255.0, blue: 122/255.0, alpha: 1.0)
    }
}

extension UIFont {
    private static var swiss911UltraCompressedBT: Data {
        guard let url = Bundle.lcarsDisplayKit.url(forResource: "Swiss 911 Ultra Compressed BT", withExtension: "ttf") else {
            preconditionFailure("Failed to locate resource: 'Swiss 911 Ultra Compressed BT.ttf'.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            preconditionFailure("Failed to load resource: 'Swiss 911 Ultra Compressed BT.ttf'.")
        }
        
        return data
    }
    
    convenience init?(data: Data, size: CGFloat) {
        guard let dataProvider = CGDataProvider(data: data as CFData) else {
            return nil
        }
        guard let font = CGFont(dataProvider) else {
            return nil
        }
        guard let fontName = font.postScriptName as String? else {
            return nil
        }
        
        if let _ = UIFont(name: fontName, size: size) {
            self.init(name: fontName, size: size)
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            return nil
        }
        
        self.init(name: fontName, size: size)
    }
    
    static var large: UIFont {
        UIFont(data: swiss911UltraCompressedBT, size: 40.0)!
    }
    
    static var medium: UIFont {
        UIFont(data: swiss911UltraCompressedBT, size: 30.0)!
    }
    
    static var small: UIFont {
        UIFont(data: swiss911UltraCompressedBT, size: 20.0)!
    }
}

extension Data {
    static func bundleSound(name: String) -> Data {
        guard let url = Bundle.lcarsDisplayKit.url(forResource: name, withExtension: "m4a") else {
            preconditionFailure("Failed to locate resource: '\(name).m4a'.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            preconditionFailure("Failed to load resource: '\(name).m4a'.")
        }
        
        return data
    }
}
#endif
