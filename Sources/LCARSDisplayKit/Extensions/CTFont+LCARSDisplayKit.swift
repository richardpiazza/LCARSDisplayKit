#if canImport(CoreGraphics) && canImport(CoreText)
import CoreGraphics
import CoreText
import Foundation

public extension CTFont {
    static func registerFont(named name: String, with extension: String, in bundle: Bundle = .lcarsDisplayKit) throws {
        guard let url = bundle.url(forResource: name, withExtension: `extension`) else {
            throw URLError(.badURL)
        }

        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) else {
            if let error {
                throw error.takeUnretainedValue()
            } else {
                throw CocoaError(.formatting)
            }
        }
    }

    static func registerLCARSFonts() throws {
        try registerFont(named: "Swiss 911 Ultra Compressed BT", with: "ttf")
    }
}
#endif
