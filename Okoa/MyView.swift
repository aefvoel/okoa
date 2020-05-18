//
//  MyView.swift
//  Okoa
//
//  Created by Stevhen on 18/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class MyView: UIView {

    override func draw(_ rect: CGRect) {
        StyleKitCarrot.drawFoodCanvas(frame: self.bounds)
    }

}
