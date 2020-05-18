//
//  StyleKitCarrot.swift
//  ProjectName
//
//  Created by AuthorName on 18/05/20.
//  Copyright © 2020 CompanyName. All rights reserved.
//
//



import UIKit

public class StyleKitCarrot : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawFoodCanvas(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 512, height: 512), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 512, height: 512), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 512, y: resizedFrame.height / 512)


        //// Color Declarations
        let fillColor = UIColor(red: 1.000, green: 0.667, blue: 0.361, alpha: 1.000)
        let fillColor2 = UIColor(red: 1.000, green: 0.596, blue: 0.220, alpha: 1.000)
        let fillColor3 = UIColor(red: 0.596, green: 0.859, blue: 0.486, alpha: 1.000)
        let fillColor4 = UIColor(red: 0.510, green: 0.827, blue: 0.380, alpha: 1.000)
        let fillColor5 = UIColor(red: 0.910, green: 0.514, blue: 0.302, alpha: 1.000)
        let fillColor6 = UIColor(red: 0.839, green: 0.431, blue: 0.255, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 329.89, y: 317.96))
        bezierPath.addCurve(to: CGPoint(x: 301.2, y: 342.91), controlPoint1: CGPoint(x: 324.42, y: 323.45), controlPoint2: CGPoint(x: 314.42, y: 332.15))
        bezierPath.addCurve(to: CGPoint(x: 289.05, y: 352.66), controlPoint1: CGPoint(x: 297.42, y: 346), controlPoint2: CGPoint(x: 293.35, y: 349.26))
        bezierPath.addCurve(to: CGPoint(x: 241.3, y: 389.08), controlPoint1: CGPoint(x: 275.21, y: 363.64), controlPoint2: CGPoint(x: 258.94, y: 376.08))
        bezierPath.addCurve(to: CGPoint(x: 228.64, y: 398.3), controlPoint1: CGPoint(x: 237.15, y: 392.12), controlPoint2: CGPoint(x: 232.93, y: 395.21))
        bezierPath.addCurve(to: CGPoint(x: 4.9, y: 507.1), controlPoint1: CGPoint(x: 141.69, y: 461.2), controlPoint2: CGPoint(x: 29.1, y: 531.3))
        bezierPath.addCurve(to: CGPoint(x: 33.79, y: 405.72), controlPoint1: CGPoint(x: -8.43, y: 493.78), controlPoint2: CGPoint(x: 6.85, y: 453.62))
        bezierPath.addCurve(to: CGPoint(x: 41.79, y: 391.82), controlPoint1: CGPoint(x: 36.35, y: 401.15), controlPoint2: CGPoint(x: 39.02, y: 396.51))
        bezierPath.addCurve(to: CGPoint(x: 70.36, y: 346.09), controlPoint1: CGPoint(x: 50.55, y: 376.95), controlPoint2: CGPoint(x: 60.24, y: 361.52))
        bezierPath.addCurve(to: CGPoint(x: 79.1, y: 332.93), controlPoint1: CGPoint(x: 73.24, y: 341.71), controlPoint2: CGPoint(x: 76.15, y: 337.32))
        bezierPath.addCurve(to: CGPoint(x: 159.34, y: 222.95), controlPoint1: CGPoint(x: 106.54, y: 292.05), controlPoint2: CGPoint(x: 136.21, y: 252.12))
        bezierPath.addCurve(to: CGPoint(x: 169.09, y: 210.8), controlPoint1: CGPoint(x: 162.74, y: 218.65), controlPoint2: CGPoint(x: 166, y: 214.58))
        bezierPath.addCurve(to: CGPoint(x: 194.04, y: 182.11), controlPoint1: CGPoint(x: 179.85, y: 197.58), controlPoint2: CGPoint(x: 188.56, y: 187.58))
        bezierPath.addCurve(to: CGPoint(x: 329.89, y: 182.11), controlPoint1: CGPoint(x: 231.55, y: 144.6), controlPoint2: CGPoint(x: 292.38, y: 144.6))
        bezierPath.addCurve(to: CGPoint(x: 329.89, y: 317.96), controlPoint1: CGPoint(x: 367.4, y: 219.62), controlPoint2: CGPoint(x: 367.4, y: 280.45))
        bezierPath.close()
        fillColor.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 329.89, y: 182.11))
        bezier2Path.addCurve(to: CGPoint(x: 323, y: 175.86), controlPoint1: CGPoint(x: 327.67, y: 179.9), controlPoint2: CGPoint(x: 325.37, y: 177.81))
        bezier2Path.addCurve(to: CGPoint(x: 316.75, y: 304.82), controlPoint1: CGPoint(x: 354.13, y: 213.6), controlPoint2: CGPoint(x: 352.05, y: 269.53))
        bezier2Path.addCurve(to: CGPoint(x: 0.56, y: 498.3), controlPoint1: CGPoint(x: 281.45, y: 340.12), controlPoint2: CGPoint(x: 58.08, y: 509.65))
        bezier2Path.addCurve(to: CGPoint(x: 4.9, y: 507.1), controlPoint1: CGPoint(x: 1.27, y: 501.92), controlPoint2: CGPoint(x: 2.68, y: 504.88))
        bezier2Path.addCurve(to: CGPoint(x: 329.89, y: 317.96), controlPoint1: CGPoint(x: 42.41, y: 544.61), controlPoint2: CGPoint(x: 292.37, y: 355.48))
        bezier2Path.addCurve(to: CGPoint(x: 329.89, y: 182.11), controlPoint1: CGPoint(x: 367.4, y: 280.45), controlPoint2: CGPoint(x: 367.4, y: 219.63))
        bezier2Path.close()
        fillColor2.setFill()
        bezier2Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 500.45, y: 142.81))
        bezier3Path.addCurve(to: CGPoint(x: 500.45, y: 87.05), controlPoint1: CGPoint(x: 515.85, y: 127.41), controlPoint2: CGPoint(x: 515.85, y: 102.45))
        bezier3Path.addCurve(to: CGPoint(x: 488.36, y: 78.8), controlPoint1: CGPoint(x: 496.86, y: 83.46), controlPoint2: CGPoint(x: 492.75, y: 80.72))
        bezier3Path.addCurve(to: CGPoint(x: 484.59, y: 27.41), controlPoint1: CGPoint(x: 499.85, y: 63.36), controlPoint2: CGPoint(x: 498.6, y: 41.43))
        bezier3Path.addCurve(to: CGPoint(x: 433.2, y: 23.64), controlPoint1: CGPoint(x: 470.57, y: 13.4), controlPoint2: CGPoint(x: 448.63, y: 12.14))
        bezier3Path.addCurve(to: CGPoint(x: 424.95, y: 11.55), controlPoint1: CGPoint(x: 431.28, y: 19.25), controlPoint2: CGPoint(x: 428.54, y: 15.14))
        bezier3Path.addCurve(to: CGPoint(x: 369.19, y: 11.55), controlPoint1: CGPoint(x: 409.55, y: -3.85), controlPoint2: CGPoint(x: 384.59, y: -3.85))
        bezier3Path.addCurve(to: CGPoint(x: 368.41, y: 12.37), controlPoint1: CGPoint(x: 368.92, y: 11.82), controlPoint2: CGPoint(x: 368.67, y: 12.1))
        bezier3Path.addCurve(to: CGPoint(x: 320.12, y: 18.23), controlPoint1: CGPoint(x: 353.24, y: 3.18), controlPoint2: CGPoint(x: 333.22, y: 5.13))
        bezier3Path.addCurve(to: CGPoint(x: 320.12, y: 73.99), controlPoint1: CGPoint(x: 304.72, y: 33.63), controlPoint2: CGPoint(x: 304.72, y: 58.59))
        bezier3Path.addCurve(to: CGPoint(x: 326.03, y: 78.85), controlPoint1: CGPoint(x: 321.96, y: 75.83), controlPoint2: CGPoint(x: 323.95, y: 77.45))
        bezier3Path.addCurve(to: CGPoint(x: 334.7, y: 121.54), controlPoint1: CGPoint(x: 320.27, y: 93.08), controlPoint2: CGPoint(x: 323.16, y: 110))
        bezier3Path.addCurve(to: CGPoint(x: 341.93, y: 127.24), controlPoint1: CGPoint(x: 336.93, y: 123.77), controlPoint2: CGPoint(x: 339.36, y: 125.66))
        bezier3Path.addLine(to: CGPoint(x: 308.53, y: 166.02))
        bezier3Path.addCurve(to: CGPoint(x: 329.89, y: 182.11), controlPoint1: CGPoint(x: 316.18, y: 170.27), controlPoint2: CGPoint(x: 323.39, y: 175.61))
        bezier3Path.addCurve(to: CGPoint(x: 345.98, y: 203.47), controlPoint1: CGPoint(x: 336.39, y: 188.61), controlPoint2: CGPoint(x: 341.73, y: 195.82))
        bezier3Path.addLine(to: CGPoint(x: 384.75, y: 170.07))
        bezier3Path.addCurve(to: CGPoint(x: 390.46, y: 177.3), controlPoint1: CGPoint(x: 386.34, y: 172.64), controlPoint2: CGPoint(x: 388.23, y: 175.07))
        bezier3Path.addCurve(to: CGPoint(x: 433.15, y: 185.97), controlPoint1: CGPoint(x: 402, y: 188.84), controlPoint2: CGPoint(x: 418.92, y: 191.73))
        bezier3Path.addCurve(to: CGPoint(x: 438.01, y: 191.88), controlPoint1: CGPoint(x: 434.55, y: 188.05), controlPoint2: CGPoint(x: 436.17, y: 190.04))
        bezier3Path.addCurve(to: CGPoint(x: 493.77, y: 191.88), controlPoint1: CGPoint(x: 453.41, y: 207.28), controlPoint2: CGPoint(x: 478.37, y: 207.28))
        bezier3Path.addCurve(to: CGPoint(x: 499.63, y: 143.6), controlPoint1: CGPoint(x: 506.87, y: 178.78), controlPoint2: CGPoint(x: 508.82, y: 158.76))
        bezier3Path.addCurve(to: CGPoint(x: 500.45, y: 142.81), controlPoint1: CGPoint(x: 499.9, y: 143.33), controlPoint2: CGPoint(x: 500.18, y: 143.08))
        bezier3Path.close()
        fillColor3.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 499.62, y: 143.6))
        bezier4Path.addCurve(to: CGPoint(x: 500.45, y: 142.81), controlPoint1: CGPoint(x: 499.9, y: 143.34), controlPoint2: CGPoint(x: 500.18, y: 143.08))
        bezier4Path.addCurve(to: CGPoint(x: 500.45, y: 87.05), controlPoint1: CGPoint(x: 515.85, y: 127.41), controlPoint2: CGPoint(x: 515.85, y: 102.45))
        bezier4Path.addCurve(to: CGPoint(x: 493.1, y: 81.27), controlPoint1: CGPoint(x: 498.19, y: 84.79), controlPoint2: CGPoint(x: 495.71, y: 82.86))
        bezier4Path.addCurve(to: CGPoint(x: 488.76, y: 128.39), controlPoint1: CGPoint(x: 506.26, y: 106.69), controlPoint2: CGPoint(x: 494.15, y: 122.91))
        bezier4Path.addCurve(to: CGPoint(x: 487.49, y: 133.45), controlPoint1: CGPoint(x: 487.45, y: 129.72), controlPoint2: CGPoint(x: 486.95, y: 131.66))
        bezier4Path.addCurve(to: CGPoint(x: 478.9, y: 180.37), controlPoint1: CGPoint(x: 489.9, y: 141.58), controlPoint2: CGPoint(x: 494.77, y: 164.49))
        bezier4Path.addCurve(to: CGPoint(x: 429.35, y: 182.6), controlPoint1: CGPoint(x: 465.84, y: 193.45), controlPoint2: CGPoint(x: 444.22, y: 193.57))
        bezier4Path.addCurve(to: CGPoint(x: 422.09, y: 175.65), controlPoint1: CGPoint(x: 426.55, y: 180.53), controlPoint2: CGPoint(x: 424.14, y: 178.19))
        bezier4Path.addCurve(to: CGPoint(x: 416.71, y: 174), controlPoint1: CGPoint(x: 420.81, y: 174.06), controlPoint2: CGPoint(x: 418.66, y: 173.41))
        bezier4Path.addCurve(to: CGPoint(x: 377.32, y: 164.16), controlPoint1: CGPoint(x: 403.23, y: 178.1), controlPoint2: CGPoint(x: 387.98, y: 174.82))
        bezier4Path.addCurve(to: CGPoint(x: 374.69, y: 161.26), controlPoint1: CGPoint(x: 376.39, y: 163.23), controlPoint2: CGPoint(x: 375.51, y: 162.26))
        bezier4Path.addCurve(to: CGPoint(x: 367.34, y: 160.62), controlPoint1: CGPoint(x: 372.86, y: 159.02), controlPoint2: CGPoint(x: 369.54, y: 158.73))
        bezier4Path.addLine(to: CGPoint(x: 335.4, y: 188.13))
        bezier4Path.addCurve(to: CGPoint(x: 345.98, y: 203.47), controlPoint1: CGPoint(x: 339.47, y: 192.97), controlPoint2: CGPoint(x: 343, y: 198.11))
        bezier4Path.addLine(to: CGPoint(x: 384.75, y: 170.07))
        bezier4Path.addCurve(to: CGPoint(x: 390.46, y: 177.3), controlPoint1: CGPoint(x: 386.34, y: 172.64), controlPoint2: CGPoint(x: 388.23, y: 175.07))
        bezier4Path.addCurve(to: CGPoint(x: 433.15, y: 185.97), controlPoint1: CGPoint(x: 402, y: 188.84), controlPoint2: CGPoint(x: 418.91, y: 191.73))
        bezier4Path.addCurve(to: CGPoint(x: 442.49, y: 195.74), controlPoint1: CGPoint(x: 435.59, y: 189.6), controlPoint2: CGPoint(x: 438.68, y: 192.92))
        bezier4Path.addCurve(to: CGPoint(x: 492.04, y: 193.51), controlPoint1: CGPoint(x: 457.35, y: 206.71), controlPoint2: CGPoint(x: 478.23, y: 205.79))
        bezier4Path.addCurve(to: CGPoint(x: 499.62, y: 143.6), controlPoint1: CGPoint(x: 506.68, y: 180.49), controlPoint2: CGPoint(x: 509.21, y: 159.41))
        bezier4Path.close()
        fillColor4.setFill()
        bezier4Path.fill()


        //// Group
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 222.16, y: 274.82))
        bezier5Path.addCurve(to: CGPoint(x: 211.21, y: 274.82), controlPoint1: CGPoint(x: 219.17, y: 277.79), controlPoint2: CGPoint(x: 214.2, y: 277.81))
        bezier5Path.addLine(to: CGPoint(x: 159.34, y: 222.94))
        bezier5Path.addCurve(to: CGPoint(x: 169.09, y: 210.79), controlPoint1: CGPoint(x: 162.74, y: 218.65), controlPoint2: CGPoint(x: 166, y: 214.58))
        bezier5Path.addLine(to: CGPoint(x: 222.16, y: 263.86))
        bezier5Path.addCurve(to: CGPoint(x: 222.16, y: 274.82), controlPoint1: CGPoint(x: 225.19, y: 266.89), controlPoint2: CGPoint(x: 225.19, y: 271.79))
        bezier5Path.close()
        fillColor5.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 241.3, y: 389.08))
        bezier6Path.addCurve(to: CGPoint(x: 228.64, y: 398.3), controlPoint1: CGPoint(x: 237.15, y: 392.12), controlPoint2: CGPoint(x: 232.93, y: 395.21))
        bezier6Path.addLine(to: CGPoint(x: 142.17, y: 311.83))
        bezier6Path.addCurve(to: CGPoint(x: 142.17, y: 300.88), controlPoint1: CGPoint(x: 139.14, y: 308.81), controlPoint2: CGPoint(x: 139.14, y: 303.91))
        bezier6Path.addCurve(to: CGPoint(x: 153.11, y: 300.88), controlPoint1: CGPoint(x: 145.19, y: 297.86), controlPoint2: CGPoint(x: 150.09, y: 297.86))
        bezier6Path.addLine(to: CGPoint(x: 241.3, y: 389.08))
        bezier6Path.close()
        fillColor5.setFill()
        bezier6Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 149.47, y: 414.26))
        bezier7Path.addCurve(to: CGPoint(x: 138.53, y: 414.26), controlPoint1: CGPoint(x: 146.5, y: 417.24), controlPoint2: CGPoint(x: 141.51, y: 417.24))
        bezier7Path.addLine(to: CGPoint(x: 70.36, y: 346.09))
        bezier7Path.addCurve(to: CGPoint(x: 79.09, y: 332.93), controlPoint1: CGPoint(x: 73.24, y: 341.71), controlPoint2: CGPoint(x: 76.15, y: 337.32))
        bezier7Path.addLine(to: CGPoint(x: 149.47, y: 403.31))
        bezier7Path.addCurve(to: CGPoint(x: 149.47, y: 414.26), controlPoint1: CGPoint(x: 152.5, y: 406.34), controlPoint2: CGPoint(x: 152.5, y: 411.24))
        bezier7Path.close()
        fillColor5.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 68, y: 428.98))
        bezier8Path.addCurve(to: CGPoint(x: 57.05, y: 428.98), controlPoint1: CGPoint(x: 65.02, y: 431.97), controlPoint2: CGPoint(x: 60.03, y: 431.95))
        bezier8Path.addLine(to: CGPoint(x: 33.79, y: 405.72))
        bezier8Path.addCurve(to: CGPoint(x: 41.79, y: 391.82), controlPoint1: CGPoint(x: 36.35, y: 401.15), controlPoint2: CGPoint(x: 39.02, y: 396.51))
        bezier8Path.addLine(to: CGPoint(x: 68, y: 418.03))
        bezier8Path.addCurve(to: CGPoint(x: 68, y: 428.98), controlPoint1: CGPoint(x: 71.02, y: 421.06), controlPoint2: CGPoint(x: 71.02, y: 425.96))
        bezier8Path.close()
        fillColor5.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 289.05, y: 352.66))
        bezier9Path.addLine(to: CGPoint(x: 255.16, y: 318.77))
        bezier9Path.addCurve(to: CGPoint(x: 255.16, y: 307.82), controlPoint1: CGPoint(x: 252.14, y: 315.74), controlPoint2: CGPoint(x: 252.14, y: 310.84))
        bezier9Path.addCurve(to: CGPoint(x: 266.12, y: 307.82), controlPoint1: CGPoint(x: 258.19, y: 304.8), controlPoint2: CGPoint(x: 263.09, y: 304.8))
        bezier9Path.addLine(to: CGPoint(x: 301.2, y: 342.91))
        bezier9Path.addLine(to: CGPoint(x: 289.05, y: 352.66))
        bezier9Path.close()
        fillColor5.setFill()
        bezier9Path.fill()




        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 241.3, y: 389.08))
        bezier10Path.addCurve(to: CGPoint(x: 228.64, y: 398.3), controlPoint1: CGPoint(x: 237.15, y: 392.12), controlPoint2: CGPoint(x: 232.93, y: 395.21))
        bezier10Path.addLine(to: CGPoint(x: 215.5, y: 385.16))
        bezier10Path.addCurve(to: CGPoint(x: 228.15, y: 375.92), controlPoint1: CGPoint(x: 219.78, y: 382.07), controlPoint2: CGPoint(x: 224, y: 378.99))
        bezier10Path.addLine(to: CGPoint(x: 241.3, y: 389.08))
        bezier10Path.close()
        fillColor6.setFill()
        bezier10Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 275.91, y: 339.52))
        bezier11Path.addLine(to: CGPoint(x: 289.05, y: 352.66))
        bezier11Path.addLine(to: CGPoint(x: 300.27, y: 343.67))
        bezier11Path.addLine(to: CGPoint(x: 301.2, y: 342.91))
        bezier11Path.addLine(to: CGPoint(x: 288.06, y: 329.76))
        bezier11Path.addLine(to: CGPoint(x: 275.91, y: 339.52))
        bezier11Path.close()
        fillColor6.setFill()
        bezier11Path.fill()
        
        context.restoreGState()

    }




    @objc(StyleKitCarrotResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
