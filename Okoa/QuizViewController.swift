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
    @IBOutlet weak var categoryLabel: UILabel!
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
        
        categoryLabel.text = labelFromSegue
        
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
        
        // Do any additional setup after loading the view.
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
        playHapticsAndSoundFile(named: "MyResources/\(sender.title(for: .normal) ?? "")")
    }
    
    func randomQuestion() -> String {
        
        let i = Int.random(in: 0 ... choices.count - 1)
        temp = choices[i]
        return choices[i]
        
    }
    
    func answerValidation(isCorrect: Bool){
        if isCorrect {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: "alert_right")
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: "alert_wrong")
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: nil)
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
