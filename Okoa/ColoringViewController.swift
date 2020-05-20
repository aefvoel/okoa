//
//  ColoringViewController.swift
//  Okoa
//
//  Created by Evan Renanto on 12/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

struct cellData {
    let color : UIColor!
}

class ColoringViewController: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var sketchPlace: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var category: String!
    var categoryLabel: [String]!
    var categorySketch: [UIImage]!
    var categoryFromSegue: [UIImage]!{
        didSet{
            categorySketch = categoryFromSegue
        }
    }
    
    var arrCellData = [cellData]()
    var warnaEraser = [cellData]()
    var temp = false
    var erase = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrCellData = [cellData(color: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)), cellData(color: #colorLiteral(red: 1, green: 0.9419413527, blue: 0, alpha: 1)), cellData(color: #colorLiteral(red: 0, green: 0.6007654667, blue: 0, alpha: 1)), cellData(color: #colorLiteral(red: 0, green: 0.04544427991, blue: 1, alpha: 1)), cellData(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), cellData(color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), cellData(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),  cellData(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), cellData(color: #colorLiteral(red: 0.5019607843, green: 0.7647058824, blue: 0, alpha: 1)), cellData(color: #colorLiteral(red: 0.4862745098, green: 0.2784313725, blue: 0, alpha: 1)), cellData(color: #colorLiteral(red: 0.9490196078, green: 0.8117647059, blue: 0.6156862745, alpha: 1)), cellData(color: #colorLiteral(red: 1, green: 0.6243972182, blue: 0, alpha: 1)), cellData(color: #colorLiteral(red: 0.5488560796, green: 0.5548830032, blue: 0.604912281, alpha: 1)), cellData(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]
        
        let number = Int.random(in: 0 ... categorySketch.count - 1)
        sketchPlace.image = categorySketch[number]
        category = categoryLabel[number]
    }
    
    @IBAction func btnToResult(_ sender: UIButton) {
        performSegue(withIdentifier: "to_result", sender: self)
    }
    @IBAction func shuffleButton(_ sender: Any) {
        let number = Int.random(in: 0 ... categorySketch.count - 1)
        sketchPlace.image = categorySketch[number]
        category = categoryLabel[number]
        canvasView.clearDraw()
    }
    
    @IBAction func undoButton(_ sender: Any) {
        canvasView.undoDraw()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        canvasView.clearDraw()
    }
    
    @IBAction func redoButton(_ sender: Any) {
        canvasView.redoDraw()
    }
    
    @IBAction func eraserButton(_ sender: Any) {
        erase = true
        self.canvasView.strokeColor = UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        collectionView.reloadData()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension ColoringViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath ) as! ColorCVCell
        
        cell.contentView.backgroundColor = arrCellData[indexPath.row].color
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.canvasView.strokeColor = arrCellData[indexPath.row].color
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultViewController {
            destination.canvasView = canvasView
            destination.imageFromSegue = canvasView.savePic()
            destination.imageName = category
            destination.categoryLabel = categoryLabel
        }
    }
}

extension UIView{
    func savePic() -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil{
            return image!
        }
        return UIImage()
    }
}

