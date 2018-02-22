//
//  ViewController.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

import UIKit
import LCARSDisplayKitUI

class ViewController: UIViewController {
    
    @IBOutlet weak var dgroup: DGroupView02?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let dgroup = self.dgroup else {
            return
        }
        
        let blinkSequence = CommandSequence([dgroup.top01, dgroup.outerRing12, dgroup.outerRing18]) {
            dgroup.innerRing11.behavior = .pulsate(timeInterval: 2.5)
            dgroup.outerRing16.behavior = .pulsate(timeInterval: 3.0)
            dgroup.outerRing01.behavior = .pulsate(timeInterval: 4.0)
        }
        
        CommandSequencer.default.register(commandSequence: blinkSequence)
        
        let inverseBlink = CommandSequence([dgroup.top01, dgroup.outerRing12, dgroup.outerRing19]) {
            dgroup.innerRing11.behavior = nil
            dgroup.outerRing16.behavior = nil
            dgroup.outerRing01.behavior = nil
        }
        
        CommandSequencer.default.register(commandSequence: inverseBlink)
    }
}

