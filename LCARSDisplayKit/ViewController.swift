//
//  ViewController.swift
//  LCARSDisplayKit
//
//  Created by Richard Piazza on 10/2/15.
//  Copyright © 2015 Richard Piazza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullView: LDKDPadFullView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fullView.top01.addTarget(self, action: #selector(type(of: self).didTapCalibrate(_:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapCalibrate(_ sender: LDKButton) {
        if let _ = sender.behavior {
            sender.behavior = nil
        } else {
            sender.behavior = .pulsate
        }
    }
}

