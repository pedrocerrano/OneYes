//
//  ConfettiView.swift
//  MyConfetti
//
//  Created by iMac Pro on 4/23/23.
//

import UIKit

class ConfettiView: UIView {
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public
    public func startAnimating() {
        for layer in [createForegroundConfettiLayer(), createBackgroundConfettiLayer()] {
            self.layer.addSublayer(layer)
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                layer.removeFromSuperlayer()
            }
        }
    }

    // MARK: Internal
    lazy var confettiTypes: [Confetti] = {
        let colors: [UIColor] = [
            UIColor(red: 255/255, green: 0, blue: 0, alpha: 1),         // RED
            UIColor(red: 255/255, green: 164/255, blue: 0, alpha: 1),   // ORANGE
            UIColor(red: 255/255, green: 233/255, blue: 0, alpha: 1),   // YELLOW
            UIColor(red: 0/255, green: 200/255, blue: 0/255, alpha: 1), // GREEN
            .systemBlue,
            .systemPurple
        ]
        
        return [ConfettiPosition.foreground, ConfettiPosition.background].flatMap { position in
            return [ConfettiShape.rectangle, ConfettiShape.circle].flatMap { shape in
                return colors.map { color in
                    return Confetti(color: color, shape: shape, position: position)
                }
            }
        }
    }()

    func createForegroundConfettiLayer() -> CAEmitterLayer {
        let emitterLayer = createConfettiLayer()
        
        addBehaviors(to: emitterLayer)
        addAnimations(to: emitterLayer)
        return emitterLayer
    }
    
    func createBackgroundConfettiLayer() -> CAEmitterLayer {
        let emitterLayer = createConfettiLayer()
        
        for emitterCell in emitterLayer.emitterCells ?? [] {
            emitterCell.scale = 0.5
        }

        emitterLayer.opacity = 0.5
        emitterLayer.speed   = 0.95
        
        addBehaviors(to: emitterLayer)
        addAnimations(to: emitterLayer)
        return emitterLayer
    }

    func createConfettiCells() -> [CAEmitterCell] {
        return confettiTypes.map { confettiType in
            let cell = CAEmitterCell()

            cell.name          = confettiType.name
            cell.beginTime     = 0.1
            cell.birthRate     = 100
            cell.contents      = confettiType.image.cgImage
            cell.emissionRange = CGFloat(Double.pi)
            cell.lifetime      = 10
            cell.spin          = 4
            cell.spinRange     = 8
            cell.velocityRange = 0
            cell.yAcceleration = 0
            
            cell.setValue("plane", forKey: "particleType")
            cell.setValue(Double.pi, forKey: "orientationRange")
            cell.setValue(Double.pi / 2, forKey: "orientationLongitude")
            cell.setValue(Double.pi / 2, forKey: "orientationLatitude")
            
            return cell
        }
    }
    
    func createConfettiLayer() -> CAEmitterLayer {
        let emitterLayer = CAEmitterLayer()
        
        emitterLayer.birthRate       = 0
        emitterLayer.emitterCells    = createConfettiCells()
        emitterLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.minY - bounds.size.width / 5)
        emitterLayer.emitterSize     = CGSize(width: bounds.size.width / 5, height: bounds.size.width / 5)
        emitterLayer.emitterShape    = .sphere
        emitterLayer.frame           = bounds
        emitterLayer.beginTime       = CACurrentMediaTime()
        
        return emitterLayer
    }
    
    
    func createBehavior(type: String) -> NSObject {
        let behaviorClass          = NSClassFromString("CAEmitterBehavior") as! NSObject.Type
        let behaviorWithType       = behaviorClass.method(for: NSSelectorFromString("behaviorWithType:"))!
        let castedBehaviorWithType = unsafeBitCast(behaviorWithType, to: (@convention(c) (Any?, Selector, Any?) -> NSObject).self)
        
        return castedBehaviorWithType(behaviorClass, NSSelectorFromString("behaviorWithType"), type)
    }
    
    func horizontalWaveBehavior() -> Any {
        let behavior = createBehavior(type: "wave")
        behavior.setValue([100, 0, 0], forKeyPath: "force")
        behavior.setValue(0.5, forKeyPath: "frequency")
        return behavior
    }
    
    func verticalWaveBehavior() -> Any {
        let behavior = createBehavior(type: "wave")
        behavior.setValue([0, 500, 0], forKeyPath: "force")
        behavior.setValue(3, forKeyPath: "frequency")
        return behavior
    }
    
    func attractorBehavior(for emitterLayer: CAEmitterLayer) -> Any {
        let behavior = createBehavior(type: "attractor")
        behavior.setValue("attractor", forKeyPath: "name")
        
        behavior.setValue(-290, forKey: "falloff")
        behavior.setValue(300, forKey: "radius")
        behavior.setValue(10, forKey: "stiffness")
        
        behavior.setValue(CGPoint(x: emitterLayer.emitterPosition.x,
                                  y: emitterLayer.emitterPosition.y),
                          forKey: "position")
        behavior.setValue(-70, forKey: "zPosition")
        
        return behavior
    }
    
    func addBehaviors(to layer: CAEmitterLayer) {
        layer.setValue([
            horizontalWaveBehavior(),
            verticalWaveBehavior(),
            attractorBehavior(for: layer),
        ], forKey: "emitterBehaviors")
    }
    
    func addAttractorAnimation(to layer: CALayer) {
        let animation = CAKeyframeAnimation()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.duration = 3
        animation.keyTimes = [0, 0.4]
        animation.values = [80, 5]
        
        layer.add(animation, forKey: "emitterBehaviors.attractor.stiffness")
    }
    
    func addBirthrateAnimation(to layer: CALayer) {
        let animation = CABasicAnimation()
        animation.duration = 1
        animation.fromValue = 1
        animation.toValue = 0

        layer.add(animation, forKey: "birthRate")
    }
    
    func addAnimations(to layer: CAEmitterLayer) {
        addAttractorAnimation(to: layer)
        addBirthrateAnimation(to: layer)
        addGravityAnimation(to: layer)
        addDragAnimation(to: layer)
    }
    
    func dragBehavior() -> Any {
        let behavior = createBehavior(type: "drag")
        behavior.setValue("drag", forKey: "name")
        behavior.setValue(2, forKey: "drag")

        return behavior
    }
    
    func addDragAnimation(to layer: CALayer) {
        let animation = CABasicAnimation()
        animation.duration = 0.35
        animation.fromValue = 0
        animation.toValue = 2

        layer.add(animation, forKey: "emitterBehaviors.drag.drag")
    }
    
    func addGravityAnimation(to layer: CALayer) {
        let animation = CAKeyframeAnimation()
        animation.duration = 6
        animation.keyTimes = [0.05, 0.1, 0.5, 1]
        animation.values = [0, 100, 2000, 4000]

        for image in confettiTypes {
            layer.add(animation, forKey: "emitterCells.\(image.name).yAcceleration")
        }
    }
}
