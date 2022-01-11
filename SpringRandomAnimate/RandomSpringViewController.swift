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
    
    let animations = Spring.AnimationPreset.allCases
    let animationCurves = Spring.AnimationCurve.allCases
    
    var nextRandomAnimation: Spring.AnimationPreset {
        let animation = animations.randomElement() ?? Spring.AnimationPreset.fall
        currentRandomAnimation = animation
        return animation
    }
    
    var currentRandomAnimation: Spring.AnimationPreset = Spring.AnimationPreset.fall
    
    var randomCurve: Spring.AnimationCurve {
        animationCurves.randomElement() ?? Spring.AnimationCurve.spring
    }
    
    var randomForce: CGFloat {
        (CGFloat.random(in: 1...1.5) * 100).rounded(.down) / 100
    }
    
    var randomDuration: CGFloat {
        (CGFloat.random(in: 1...3) * 100).rounded(.down) / 100
    }
    
    var randomDelay: CGFloat {
        (CGFloat.random(in: 0...0.3) * 100).rounded(.down) / 100
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateButtonPressed(animateButton)
    }
    
    @IBAction func animateButtonPressed(_ sender: UIButton) {
        springView.animation = currentRandomAnimation.rawValue
        springView.curve = randomCurve.rawValue
        springView.force = randomForce
        springView.duration = randomDuration
        springView.delay = randomDelay
        
        sender.setTitle(nextRandomAnimation.rawValue, for: .normal)
        
        
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

