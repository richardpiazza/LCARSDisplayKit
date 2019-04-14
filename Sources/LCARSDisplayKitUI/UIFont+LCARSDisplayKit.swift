#if (os(iOS) || os(tvOS))

import UIKit

public extension UIFont {
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
}

#endif
