//
//  ViewController.swift
//  Riffle
//
//  Created by Damouse on 09/25/2015.
//  Copyright (c) 2015 Mickey Barboi. All rights reserved.
//

import UIKit
import Riffle

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Riffle.setLogLevelDebug()
        Riffle.setFabricDev()
        
        print("Starting Tests")

        // This is faking two seperate connections by creating another top level domain
        // Not intended for regular use
        let app = Domain(name: "xs.tester")
        let receiver = Receiver(name: "receiver", superdomain: app)
        
        let app2 = Domain(name: "xs.tester")
        let sender2 = Sender(name: "sender", superdomain: app2)
        let receiver2 = Receiver(name: "receiver", superdomain: app2)
        
        sender2.receiver = receiver2
        
        receiver.joinFinished = {
            sender2.join()
        }
        
        receiver.join()
    }
}
