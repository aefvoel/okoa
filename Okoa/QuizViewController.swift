//
//  QuizViewController.swift
//  Okoa
//
//  Created by Toriq Wahid Syaefullah on 18/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import AVFoundation
import CoreHaptics

class QuizViewController: UIViewController {

    @IBOutlet weak var categoryImg: UIButton!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    
    @IBOutlet weak var firstSound: UIButton!
    @IBOutlet weak var secondSound: UIButton!
    
    var imageFromSegue: UIImage!
    var labelFromSegue: String = ""
    var categoryArray: [String] = []
    var newArray: [String] = []
    var choices: [String] = []
    var temp = ""
    var engine: CHHapticEngine!
    var player: AVAudioPlayer?
    lazy var supportsHaptics: Bool = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.supportsHaptics
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = categoryArray.firstIndex(of: labelFromSegue){
            categoryArray.remove(at: index)
        }
        
        choices.append(categoryArray[Int.random(in: 0 ... categoryArray.count - 1)])
        choices.append(labelFromSegue)
        
        categoryImg.setImage(imageFromSegue, for: .normal)
        firstChoice.setTitle(randomQuestion(), for: .normal)
        
        if let i = choices.firstIndex(of: temp){
            choices.remove(at: i)
        }
        
        secondChoice.setTitle(randomQuestion(), for: .normal)
        
        firstSound.setTitle(firstChoice.titleLabel?.text, for: .normal)
        secondSound.setTitle(secondChoice.titleLabel?.text, for: .normal)
        
        createEngine()
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnTapChoices(_ sender: UIButton) {
        if sender.title(for: .normal) == labelFromSegue {
            answerValidation(isCorrect: true)
        }
        else {
            answerValidation(isCorrect: false)
        }
        
    }
    
    @IBAction func btnTapSound(_ sender: UIButton) {
        let pronun = ["grape", "banana", "apple", "carrot", "broccoli"]
        if pronun.contains(sender.title(for: .normal) ?? "") {
            playSound(named: "MyResources/\(sender.title(for: .normal) ?? "")")
        } else {
            playHapticsAndSoundFile(named: "MyResources/\(sender.title(for: .normal) ?? "")")
            
        }
    }
    
    func randomQuestion() -> String {
        
        let i = Int.random(in: 0 ... choices.count - 1)
        temp = choices[i]
        return choices[i]
        
    }
    
    @IBAction func homeBtnDidPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to go back home? Your progress will be lost.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "to_menu", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func answerValidation(isCorrect: Bool){
        if isCorrect {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: "alert_right")
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: {
                sleep(3)
                self.performSegue(withIdentifier: "to_menu", sender: self)
            })
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: "alert_wrong")
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: nil)
        }
    }
}

extension QuizViewController {
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
    
    func playSound(named filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
            
        } catch {
            print("An error occured playing \(filename): \(error).")
        }
    }
}
