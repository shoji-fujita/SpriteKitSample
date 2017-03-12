//
//  SKEmitterNode+FileName.swift
//  SpriteKitSample
//
//  Created by shoji on 2017/03/07.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import SpriteKit

extension SKEmitterNode {
    
    class func set(forResource: String) -> SKEmitterNode? {
        guard let path = Bundle.main.path(forResource: forResource, ofType: "sks") else {
            return nil
        }
        guard let node = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? SKEmitterNode else {
            return nil
        }
        return node
    }
    
}
