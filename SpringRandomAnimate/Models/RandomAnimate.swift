//
//  RandomAnimate.swift
//  SpringRandomAnimate
//
//  Created by ILYA BILARUS on 12.01.2022.
//

import Spring

class RandomAnimate {
    
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

}
