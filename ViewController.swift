//
//  CircularProgressView.swift
//
//  Created by Giri on 03/12/21.
//  Copyright © 2021 Giri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circularProgress: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progress = CircularProgressView(frame: CGRect(x: 0.0, y: 0.0, width: 70.0, height: 70.0))
        progress.trackColor = UIColor.gray
        progress.progressColor = UIColor.green
        progress.tag = 101
        self.view.addSubview(progress)
        progress.center = self.view.center
        
       animateProgress()
        
        circularProgress.trackColor = UIColor.white
        circularProgress.progressColor = UIColor.red
        circularProgress.setProgressWithAnimation(duration: 1, value: 1)
    }

    func animateProgress() {
        let progress = self.view.viewWithTag(101) as! CircularProgressView
        var value = 0.0
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            value += 0.1
            progress.setProgressWithAnimation(duration: 1.0, value: Float(value))
        }

    }
}

