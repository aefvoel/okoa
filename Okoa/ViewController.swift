//
//  ViewController.swift
//  Okoa
//
//  Created by Toriq Wahid Syaefullah on 11/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "to_onboarding", sender: self)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }

    override var shouldAutorotate: Bool {
        return true
    }


}

