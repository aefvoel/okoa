//
//  GenerateSVGfromCoordinatesViewController.swift
//  Okoa
//
//  Created by Stevhen on 18/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class GenerateSVGfromCoordinatesViewController: UIViewController {

    @IBOutlet weak var imageView: UIView!
    let carrotView: UIView = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = carrotView
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
