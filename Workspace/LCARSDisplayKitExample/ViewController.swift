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
        
        let commandSequence: CommandSequence = [dgroup.edge07, dgroup.outerRing18, dgroup.top05]
        CommandSequencer.default.register(commandSequence: commandSequence) {
            print("Did Execute Sequence")
        }
    }
}

