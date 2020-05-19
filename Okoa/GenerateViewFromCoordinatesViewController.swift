//
//  GenerateSVGfromCoordinatesViewController.swift
//  Okoa
//
//  Created by Stevhen on 18/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class GenerateViewFromCoordinatesViewController: UIViewController {

    @IBOutlet weak var imageView: UIView!
    
    var canvas = "carrot"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let canvasView = MyView(frame: imageView.bounds, canvas: canvas)
        canvasView.tag = 100
        imageView.addSubview(canvasView)
    }
    
    @IBAction func updateImageDidPressed(_ sender: Any) {
        imageView.viewWithTag(100)?.removeFromSuperview()
        let canvasView = MyView(frame: imageView.bounds, canvas: "dog")
        imageView.addSubview(canvasView)
    }
}
