//
//  AppDelegate.swift
//  Hydrate
//
//  Created by Mike Forster on 1/22/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var decreaseAnimationView: HyrdateAnimationUIView!
    @IBOutlet weak var dropletsAnimationView: HydrateAnimationUI2View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
        decreaseAnimationView.isHidden = true
        dropletsAnimationView.isHidden = true
    }

    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
            dropletsAnimationView.isHidden = false
            dropletsAnimationView.addRain1Animation()
            
        } else {
            if counterView.counter > 0 {
                //Trigger decrease animation
                decreaseAnimationView.isHidden = false
                decreaseAnimationView.addSpin1Animation()
                counterView.counter -= 1
                
            }
        }
        counterLabel.text = String(counterView.counter)
    }
    

}



