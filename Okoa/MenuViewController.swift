//
//  MenuViewController.swift
//  Okoa
//
//  Created by Toriq Wahid Syaefullah on 12/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var childName: String = ""
    var categorySketch: [UIImage] = []
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = childName
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnVehicles(_ sender: UIButton) {
        categorySketch = [#imageLiteral(resourceName: "Anggur"), #imageLiteral(resourceName: "Apel"), #imageLiteral(resourceName: "Banana"), #imageLiteral(resourceName: "Brokoli")]
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    @IBAction func btnAnimals(_ sender: UIButton) {
        categorySketch = [#imageLiteral(resourceName: "Pesawat"), #imageLiteral(resourceName: "Dolphin"), #imageLiteral(resourceName: "Gajah"), #imageLiteral(resourceName: "Kucing")]
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    @IBAction func btnFruits(_ sender: UIButton) {
        categorySketch = [#imageLiteral(resourceName: "Bis"), #imageLiteral(resourceName: "Mobil"), #imageLiteral(resourceName: "Pesawat"), #imageLiteral(resourceName: "Sepeda")]
        performSegue(withIdentifier: "to_coloring", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColoringViewController {
            destination.categoryFromSegue = categorySketch
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
