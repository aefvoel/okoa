//
//  ColoringViewController.swift
//  Okoa
//
//  Created by Evan Renanto on 12/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ColoringViewController: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var sketchPlace: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fruitSketch: [UIImage] = [#imageLiteral(resourceName: "Anggur"), #imageLiteral(resourceName: "Apel"), #imageLiteral(resourceName: "Banana"), #imageLiteral(resourceName: "Brokoli")]
    var animalSketch: [UIImage] = [#imageLiteral(resourceName: "Anjing"), #imageLiteral(resourceName: "Dolphin"), #imageLiteral(resourceName: "Gajah"), #imageLiteral(resourceName: "Kucing")]
    var vehicleSketch: [UIImage] = [#imageLiteral(resourceName: "Bis"), #imageLiteral(resourceName: "Mobil"), #imageLiteral(resourceName: "Pesawat"), #imageLiteral(resourceName: "Sepeda")]
    
    var items: [UIColor] = [#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0, green: 0.04544427991, blue: 1, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0, green: 0.6007654667, blue: 0, alpha: 1), #colorLiteral(red: 0.3371880651, green: 1, blue: 0.4706221223, alpha: 1), #colorLiteral(red: 1, green: 0.6243972182, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9899911284, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    var cobaCOlor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //sketchPlace.image = #imageLiteral(resourceName: "Anjing2")
    }
    
    @IBAction func shuffleButton(_ sender: Any) {
        let number = Int.random(in: 0 ... 3)
        sketchPlace.image = fruitSketch[number]
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
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        let image = canvasView.savePic()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imagesaved(_:didFinishSavingWithError:contextType:)), nil)
    }
    
    @objc func imagesaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer){
        if error != nil {
            print("Unable to save image.")
        }else{
            print("Image saved!")
        }
    }
}

extension ColoringViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath )
        //if let view = cell.viewWithTag(1){
        cell.contentView.backgroundColor = items[indexPath.row]
        cell.layer.cornerRadius = 20
        //}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //canvasView.strokeColor = items[indexPath.row]
        self.canvasView.strokeColor = items[indexPath.row]
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
