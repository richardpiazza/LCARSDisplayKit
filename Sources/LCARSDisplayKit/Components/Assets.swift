import Foundation
    
public enum Assets {
    
    public enum Fonts {
        
        public static var swiss911UltraCompressedBT: Data {
            guard let url = Bundle.module.url(forResource: "Swiss 911 Ultra Compressed BT", withExtension: "ttf") else {
                preconditionFailure("Failed to locate resource: 'Swiss 911 Ultra Compressed BT.ttf'.")
            }
            
            guard let data = try? Data(contentsOf: url) else {
                preconditionFailure("Failed to load resource: 'Swiss 911 Ultra Compressed BT.ttf'.")
            }
            
            return data
        }
    }
    
    public enum Sounds {
        
        public static var beep1: Data {
            guard let url = Bundle.module.url(forResource: "beep1", withExtension: "m4a") else {
                preconditionFailure("Failed to locate resource: 'beep1.m4a'.")
            }
            
            guard let data = try? Data(contentsOf: url) else {
                preconditionFailure("Failed to load resource: 'beep1.m4a'.")
            }
            
            return data
        }
        
        public static var beep2: Data {
            guard let url = Bundle.module.url(forResource: "beep2", withExtension: "m4a") else {
                preconditionFailure("Failed to locate resource: 'beep2.m4a'.")
            }
            
            guard let data = try? Data(contentsOf: url) else {
                preconditionFailure("Failed to load resource: 'beep2.m4a'.")
            }
            
            return data
        }
        
        public static var beep3: Data {
            guard let url = Bundle.module.url(forResource: "beep3", withExtension: "m4a") else {
                preconditionFailure("Failed to locate resource: 'beep3.m4a'.")
            }
            
            guard let data = try? Data(contentsOf: url) else {
                preconditionFailure("Failed to load resource: 'beep3.m4a'.")
            }
            
            return data
        }
    }
}
