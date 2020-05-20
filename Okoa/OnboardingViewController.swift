//
//  OnboardingViewController.swift
//  Okoa
//
//  Created by Toriq Wahid Syaefullah on 12/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBAction func onLetsGoBtn(_ sender: UIButton) {
        UserDefaults.standard.set(tfName.text, forKey: "childName")
        performSegue(withIdentifier: "to_menu", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func leggo(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? MenuViewController {
//            destination.childName = tfName.text ?? "Child Name"
//        }
//    }

}
