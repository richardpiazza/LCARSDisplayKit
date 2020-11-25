#if canImport(UIKit)
import UIKit
 
public enum Behavior {
    case pulsate(timeInterval: TimeInterval)
    
    static var activationTimers: [UIControl : Timer] = [UIControl : Timer]()
    static var inverseTimers: [UIControl : Timer] = [UIControl : Timer]()
    
    public func begin(_ control: UIControl) {
        switch self {
        case .pulsate(let timeInterval):
            Behavior.activationTimers[control] = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { (timer) in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseOut], animations: {
                    control.alpha = 0.0
                }, completion: nil)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + (timeInterval / 2), execute: {
                Behavior.inverseTimers[control] = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { (timer) in
                    UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn], animations: {
                        control.alpha = 1.0
                    }, completion: nil)
                })
            })
        }
    }
    
    public func end(_ control: UIControl) {
        Behavior.activationTimers[control]?.invalidate()
        Behavior.activationTimers[control] = nil
        Behavior.inverseTimers[control]?.invalidate()
        Behavior.inverseTimers[control] = nil
        
        switch self {
        case .pulsate:
            control.alpha = 1.0
        }
    }
}
#endif
