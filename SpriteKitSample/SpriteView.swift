//
//  SpriteView.swift
//  SpriteKitSample
//
//  Created by shoji on 2017/03/06.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit
import SpriteKit

final class SpriteView: SKView {
    
    enum ParticleType: EnumEnumerable {
        case spark
        case rain
        
        func fileName() -> String {
            switch self {
            case .spark:
                return "MyParticle"
            case .rain:
                return "MyParticle2"
            }
        }
        
        func emitterNodeName() -> String {
            return fileName()
        }
    }
    let skScene = SKScene()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        allowsTransparency = true
        skScene.size = frame.size
        skScene.backgroundColor = UIColor.clear
        presentScene(skScene)
    }
    
    func animation(type: ParticleType) {
        if let emitterNode = skScene.childNode(withName: type.emitterNodeName()) as? SKEmitterNode {
            emitterNode.resetSimulation()
        } else {
            let particle = SKEmitterNode.set(forResource: type.fileName())!
            particle.name = type.emitterNodeName()
            particle.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
            skScene.addChild(particle)
        }
    }
    
}
