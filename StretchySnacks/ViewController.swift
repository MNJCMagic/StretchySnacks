//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Mike Cameron on 2018-05-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func plusIconPressed(_ sender: UIButton) {
        var trans: CGAffineTransform!
        if navHeightConstraint.constant == 66 {
            self.navHeightConstraint.constant = 200
            
            trans = CGAffineTransform(rotationAngle: -.pi/2)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                    self.plusButton.transform = trans
                

            }, completion: nil)
        }
    }
    

}

