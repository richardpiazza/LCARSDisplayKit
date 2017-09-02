//
//  ViewController.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topFrame: LDKButton!
    @IBOutlet weak var middleFrame: LDKButton!
    @IBOutlet weak var bottomFrame: LDKButton!
    @IBOutlet weak var topInnerFrame: LDKButton!
    @IBOutlet weak var middleInnerFrame: LDKButton!
    @IBOutlet weak var round1: LDKButton!
    @IBOutlet weak var rect1: LDKButton!
    @IBOutlet weak var round2: LDKButton!
    @IBOutlet weak var rect2: LDKButton!
    @IBOutlet weak var round3: LDKButton!
    @IBOutlet weak var rect3: LDKButton!
    @IBOutlet weak var round4: LDKButton!
    @IBOutlet weak var rect4: LDKButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        topFrame.color = Interface.theme.primaryMedium
        middleFrame.color = Interface.theme.tertiaryLight
        bottomFrame.color = Interface.theme.primaryMedium
        topInnerFrame.color = Interface.theme.primaryMedium
        middleInnerFrame.color = Interface.theme.primaryLight
        round2.color = Interface.theme.tertiaryLight
        rect2.color = Interface.theme.tertiaryLight
        rect4.color = Interface.theme.tertiaryLight
        round1.color = Interface.theme.tertiaryDark
        rect1.color = Interface.theme.tertiaryDark
        round3.color = Interface.theme.tertiaryDark
        rect3.color = Interface.theme.tertiaryDark
        round4.color = Interface.theme.tertiaryDark
    }
}

