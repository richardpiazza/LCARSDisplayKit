//
//  ViewController.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

import UIKit
import LCARSDisplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dgroup: DGroupView02?
    var isConditionRed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let dgroup = self.dgroup else {
            return
        }
        
        dgroup.buttonTapHandler = { (button) in
            CommandSequencer.default.didTouch(button ?? Button())
        }
        
        dgroup.outerRing14.isHidden = true
        dgroup.innerRing10.isHidden = true
        dgroup.innerRing16.isHidden = true
        
        let blinkSequence = CommandSequence([dgroup.modeSelect, dgroup.outerRing16]) {
            dgroup.innerRing11.behavior = .pulsate(timeInterval: 2.5)
            dgroup.outerRing16.behavior = .pulsate(timeInterval: 3.0)
            dgroup.outerRing01.behavior = .pulsate(timeInterval: 4.0)
        }
        
        CommandSequencer.default.register(commandSequence: blinkSequence)
        
        let inverseBlink = CommandSequence([dgroup.modeSelect, dgroup.outerRing17]) {
            dgroup.innerRing11.behavior = nil
            dgroup.outerRing16.behavior = nil
            dgroup.outerRing01.behavior = nil
        }
        
        CommandSequencer.default.register(commandSequence: inverseBlink)
        
        let redAlert = CommandSequence([dgroup.outerRing20, dgroup.outerRing20, dgroup.outerRing20]) {
            self.isConditionRed = !self.isConditionRed
            print("Is Condition Red: \(self.isConditionRed)")
        }
        
        CommandSequencer.default.register(commandSequence: redAlert)
    }
}

