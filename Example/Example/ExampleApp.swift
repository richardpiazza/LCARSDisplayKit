import LCARSDisplayKit
import SwiftUI

@main
struct ExampleApp: App {
    
    init() {
        do {
            try CTFont.registerLCARSFonts()
        } catch {
            print(error)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
