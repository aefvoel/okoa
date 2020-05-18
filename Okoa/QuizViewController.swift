//
//  QuizViewController.swift
//  Okoa
//
//  Created by Toriq Wahid Syaefullah on 18/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var categoryImg: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    
    var imageFromSegue: UIImage!
    var labelFromSegue: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryLabel.text = labelFromSegue
        categoryImg.setImage(imageFromSegue, for: .normal)
        firstChoice.setTitle(labelFromSegue, for: .normal)
        secondChoice.setTitle(labelFromSegue, for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnTapChoices(_ sender: UIButton) {
        answerValidation(isCorrect: true)
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
