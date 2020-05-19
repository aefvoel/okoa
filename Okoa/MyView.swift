//
//  UIView.swift
//  Okoa
//
//  Created by Stevhen on 18/05/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var canvas: String?
    
    init(frame: CGRect, canvas: String) {
        self.canvas = canvas
        
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        switch canvas {
            case "grape":
                OkoaSketch.drawGrapeCanvas(frame: self.bounds)
            case "dog":
                OkoaSketch.drawDogCanvas(frame: self.bounds)
            case "apple":
                OkoaSketch.drawAppleCanvas(frame: self.bounds)
            case "banana":
                OkoaSketch.drawBananaCanvas(frame: self.bounds)
            case "bus":
                OkoaSketch.drawBusCanvas(frame: self.bounds)
            case "broccoli":
                OkoaSketch.drawBroccoliCanvas(frame: self.bounds)
            case "dolphin":
                OkoaSketch.drawDolphinCanvas(frame: self.bounds)
            case "elephant":
                OkoaSketch.drawElephantCanvas(frame: self.bounds)
            case "cat":
                OkoaSketch.drawCatCanvas(frame: self.bounds)
            case "car":
                OkoaSketch.drawCarCanvas(frame: self.bounds)
            case "plane":
                OkoaSketch.drawPlaneCanvas(frame: self.bounds)
            case "bike":
                OkoaSketch.drawBikeCanvas(frame: self.bounds)
            case "carrot":
                OkoaSketch.drawCarrotCanvas(frame: self.bounds)
            default:
                print("Failed to generate canvas")
        }
    }
}

//Sub-classes
class Grape: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawGrapeCanvas(frame: self.bounds)
    }
}

class Dog: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawDogCanvas(frame: self.bounds)
    }
}

class Apple: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawAppleCanvas(frame: self.bounds)
    }
}

class Banana: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawBananaCanvas(frame: self.bounds)
    }
}

class Bus: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawBusCanvas(frame: self.bounds)
    }
}

class Broccoli: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawBroccoliCanvas(frame: self.bounds)
    }
}

class Dolphin: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawDolphinCanvas(frame: self.bounds)
    }
}

class Elephant: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawElephantCanvas(frame: self.bounds)
    }
}

class Cat: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawCatCanvas(frame: self.bounds)
    }
}

class Car: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawCarCanvas(frame: self.bounds)
    }
}

class Plane: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawPlaneCanvas(frame: self.bounds)
    }
}

class Bike: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawBikeCanvas(frame: self.bounds)
    }
}

class Carrot: UIView {
    override func draw(_ rect: CGRect) {
        OkoaSketch.drawCarrotCanvas(frame: self.bounds)
    }
}
