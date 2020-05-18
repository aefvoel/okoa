//
//  ResultViewController.swift
//  Okoa
//
//  Created by Stevhen on 14/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import AVFoundation
import CoreHaptics

class ResultViewController: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var imageResultView: UIView!
    @IBOutlet weak var imageResult: UIButton!
    @IBOutlet weak var resultNameLabel: UILabel!
    
    var imageName: String = "dog"
    var imageColouredResult: UIImage!
    
    var engine: CHHapticEngine!
    var player: AVAudioPlayer?
    lazy var supportsHaptics: Bool = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.supportsHaptics
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage(named: imageName)
        createEngine()
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
    
    @IBAction func shareBtnDidPressed(_ sender: Any) {
        
    }
    
    @IBAction func backArrowBtnDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func homeBtnDidPressed(_ sender: Any) {
        
    }
    
    @IBAction func imageResultDidPressed(_ sender: Any) {
        playHapticsAndSoundFile(named: "MyResources/\(imageName)")
    }
    
    @IBAction func nextBtnDidPressed(_ sender: Any) {
        
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

extension ResultViewController {
    func loadImage(named filename: String) {
        imageResultView.layer.cornerRadius = 0.3
        imageResult.setImage(UIImage(named: filename), for: .normal)
        resultNameLabel.text = filename.capitalized
    }
    
    override open var shouldAutorotate: Bool {
        return true
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
}

extension ResultViewController {
    func createEngine() {
        do {
            engine = try CHHapticEngine()
        } catch let error {
            print("Engine Creation Error: \(error)")
        }
        
        if engine == nil {
            print("Failed to create engine!")
        } else {
            do {
                try engine.start()
            } catch {
                print("Init fail")
            }
            
            engine.stoppedHandler = { reason in
                print("The engine stopped for reason: \(reason.rawValue)")
                switch reason {
                case .audioSessionInterrupt: print("Audio session interrupt")
                case .applicationSuspended: print("Application suspended")
                case .idleTimeout: print("Idle timeout")
                case .systemError: print("System error")
                case .notifyWhenFinished: print("Playback finished")
                @unknown default:
                    print("Unknown error")
                }
            }
            
            engine.resetHandler = {
                print("The engine reset --> Restarting now!")
                do {
                    try self.engine.start()
                } catch {
                    print("Failed to restart the engine: \(error)")
                }
            }
        }
    }
    
    func playHapticsAndSoundFile(named filename: String) {
        guard let path = Bundle.main.path(forResource: filename, ofType: "ahap") else { return }
        guard let url = Bundle.main.url(forResource: filename, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
            
            if supportsHaptics {
                try engine.start()
                
                try engine.playPattern(from: URL(fileURLWithPath: path))
            }
            
        } catch {
            print("An error occured playing \(filename): \(error).")
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
