#if (os(iOS) || os(tvOS))

import UIKit

public enum Behavior {
    case pulsate
    
    internal struct Timers {
        static var action: Timer?
        static var inverseAction: Timer?
    }
    
    public func begin(_ view: UIView) {
        switch self {
        case .pulsate:
            Timers.action = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true, block: { (timer) in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseOut], animations: {
                    view.alpha = 0.0
                }, completion: nil)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                Timers.inverseAction = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true, block: { (timer) in
                    UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn], animations: {
                        view.alpha = 1.0
                    }, completion: nil)
                })
            })
            break
        }
    }
    
    public func end(_ view: UIView) {
        switch self {
        case .pulsate:
            Timers.inverseAction?.invalidate()
            Timers.inverseAction = nil
            Timers.action?.invalidate()
            Timers.action = nil
            view.alpha = 1.0
            break
        }
    }
}

#endif
