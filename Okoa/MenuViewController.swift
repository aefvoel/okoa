//
//  MenuViewController.swift
//  Okoa
//
//  Created by Toriq Wahid Syaefullah on 12/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var categorySketch: [UIImage] = []
    var categoryLabel: [String] = []
    var categoryId: Int = 0
    
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = UserDefaults.standard.string(forKey: "childName")
        labelName.text = "Hello, \(name!.capitalizingFirstLetter())"
    }
    

    @IBAction func btnVehicles(_ sender: UIButton) {
        categoryId = 0
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    @IBAction func btnAnimals(_ sender: UIButton) {
        categoryId = 1
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    @IBAction func btnFruits(_ sender: UIButton) {
        categoryId = 2
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColoringViewController {
            destination.categoryId = categoryId
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
