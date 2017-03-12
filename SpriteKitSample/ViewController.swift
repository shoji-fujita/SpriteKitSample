//
//  ViewController.swift
//  SpriteKitSample
//
//  Created by shoji on 2017/03/06.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var spriteView: SpriteView!
    
    @IBAction func tappedButton(_ sender: UIButton) {
        spriteView.animation(type: .spark)
    }
    
}
