//
//  ColorCVCell.swift
//  Okoa
//
//  Created by Evan Renanto on 19/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ColorCVCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    override var isSelected: Bool{
        didSet{
            print(isSelected)
            if !isSelected {
                layer.cornerRadius = 10
                
            } else {
                layer.cornerRadius = 50
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
