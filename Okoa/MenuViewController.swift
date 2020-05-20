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
        labelName.text = UserDefaults.standard.string(forKey: "childName")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnVehicles(_ sender: UIButton) {
        categorySketch = [#imageLiteral(resourceName: "Sepeda"), #imageLiteral(resourceName: "Pesawat"), #imageLiteral(resourceName: "Bis"), #imageLiteral(resourceName: "Mobil")]
        categoryLabel = ["Bicycle", "Airplane", "Bus", "Car"]
        categoryId = 0
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    @IBAction func btnAnimals(_ sender: UIButton) {
        categorySketch = [#imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "Dolphin"), #imageLiteral(resourceName: "Gajah"), #imageLiteral(resourceName: "Kucing")]
        categoryLabel = ["Dog", "Dolphin", "Elephant", "Cat"]
        categoryId = 1
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    @IBAction func btnFruits(_ sender: UIButton) {
        categorySketch = [#imageLiteral(resourceName: "Brokoli"), #imageLiteral(resourceName: "Banana"), #imageLiteral(resourceName: "Anggur"), #imageLiteral(resourceName: "Apel")]
        categoryLabel = ["Broccoli", "Banana", "Grape", "Apple"]
        categoryId = 2
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColoringViewController {
            destination.categoryId = categoryId
            destination.categoryFromSegue = categorySketch
            destination.categoryLabel = categoryLabel
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
