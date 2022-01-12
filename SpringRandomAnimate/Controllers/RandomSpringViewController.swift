//
//  ViewController.swift
//  SpringRandomAnimate
//
//  Created by ILYA BILARUS on 11.01.2022.
//

import Spring
import CoreGraphics

class RandomSpringViewController: UIViewController {
    
    @IBOutlet weak var springView: SpringView!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var animateButton: UIButton!
    
    private let randomAnimate = RandomAnimate()
    
    
    override func viewWillAppear(_ animated: Bool) {
        animateButtonPressed()
    }
    
    @IBAction func animateButtonPressed() {
        springView.animation = randomAnimate.currentRandomAnimation.rawValue
        springView.curve = randomAnimate.randomCurve.rawValue
        springView.force = randomAnimate.randomForce
        springView.duration = randomAnimate.randomDuration
        springView.delay = randomAnimate.randomDelay
        
        animateButton.setTitle(randomAnimate.nextRandomAnimation.rawValue, for: .normal)
        
        
        updateUI()
        springView.animate()
    }
    
    private func updateUI() {
        animationLabel.text = "animation: " + springView.animation
        curveLabel.text = "curve: " + springView.curve
        forceLabel.text = "force: " + String(Float(springView.force))
        durationLabel.text = "duration: " + String(Float(springView.duration))
        delayLabel.text = "delay: " + String(Float(springView.delay))
    }
    
}

