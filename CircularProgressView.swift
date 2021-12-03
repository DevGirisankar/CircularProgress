//
//  CircularProgressView.swift
//  Jombone
//
//  Created by Giri on 03/12/21.
//  Copyright © 2021 Giri. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {
    
    fileprivate var progressLayer = CAShapeLayer() // progress
    fileprivate var trackLayer = CAShapeLayer() // progress track

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    var progressWidth = 4.0 {
        didSet {
            trackLayer.lineWidth = progressWidth
            progressLayer.lineWidth = 1.0
        }
    }
    var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    var trackColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    fileprivate func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                         y: frame.size.height/2),
                                      radius: (frame.size.width - 1.5)/2,
                                      startAngle: CGFloat(-0.5 * .pi),
                                      endAngle: CGFloat(1.5 * .pi), clockwise: true)
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animate")
    }
}
