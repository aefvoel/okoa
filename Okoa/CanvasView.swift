//
//  CanvasView.swift
//  Canvas Project
//
//  Created by Andrew Novansky Ignatius on 06/03/20.
//  Copyright © 2020 Andrew Novansky Ignatius. All rights reserved.
//

import UIKit

struct TouchPointAndColor  {
    var color: UIColor?
    var width: CGFloat?
    var opacity: CGFloat?
    var points: [CGPoint]?
    

    
    init(color: UIColor, points: [CGPoint]){
        self.color = color
        self.points = points
    }
    
}
class CanvasView: UIView {
    
    var lines = [TouchPointAndColor]()
    var temp = [TouchPointAndColor]()
    var strokeWidth: CGFloat = 10.0
    var strokeColor: UIColor = .black
    var strokeOpacity:  CGFloat = 10.0
    private var drawingPath: UIBezierPath?
    private var widthRatio: CGFloat?
    private var heightRatio: CGFloat?
    private var resizeFrame: CGRect?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else{return}
        
        lines.forEach{(line) in
            for(i,p) in (line.points?.enumerated())! {
                if i == 0 {
                    context.move(to: p)
                } else{
                    context.addLine(to: p)
                }
                context.setStrokeColor(line.color?.withAlphaComponent(line.opacity ?? 10.0).cgColor ?? UIColor.black.cgColor)
                context.setLineWidth(line.width ?? 10.0)
            }
            context.setLineCap(.round)
            context.strokePath()
        }
    }
    
    func originalTouch(touchPosition: CGPoint) -> CGPoint{
        var xScale = resizeFrame!.width / widthRatio!
        var yScale = resizeFrame!.height / heightRatio!
        
        var xTranslate = resizeFrame?.minX
        var yTranslate = resizeFrame?.minY
        
        var newPoint = CGPoint(
            x: (touchPosition.x / xScale) - xTranslate!,
            y: (touchPosition.y / yScale) - yTranslate!
        )
        return newPoint
    }
    
    
    
    func setDrawing(path: UIBezierPath,resizeFrame: CGRect,widthRatio: CGFloat,heighRatio: CGFloat){
        self.drawingPath = path
        self.resizeFrame = resizeFrame
        self.widthRatio = widthRatio
        self.heightRatio = heighRatio
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(TouchPointAndColor(color: UIColor(), points: [CGPoint]()))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else {
            return
        }
        
//        if drawingPath!.contains(originalTouch(touchPosition: touch)){
//            guard var lastPoint = lines.popLast() else{
//                return
//            }
//            lastPoint.points?.append(touch)
//            lastPoint.color = strokeColor
//            lastPoint.width = strokeWidth
//            lastPoint.opacity = strokeOpacity
//            lines.append(lastPoint)
//        }
        
        guard var lastPoint = lines.popLast() else{
            return
        }
        lastPoint.points?.append(touch)
        lastPoint.color = strokeColor
        lastPoint.width = strokeWidth
        lastPoint.opacity = strokeOpacity
        lines.append(lastPoint)
        
        setNeedsDisplay()
        

    }
    
    func clearDraw(){
        if lines.count > 0 {
            lines.removeAll()
            setNeedsDisplay()
        }
    }
    
    func undoDraw(){
        if lines.count > 0 {
            temp.append(lines[lines.endIndex-1])
            lines.removeLast()
            setNeedsDisplay()
        }
    }
    
    func redoDraw() {
        if lines.count > 0 {
            lines.append(temp[temp.endIndex-1])
            setNeedsDisplay()
        }
    }
}
