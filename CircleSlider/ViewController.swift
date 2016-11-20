//
//  ViewController.swift
//  CircleSlider
//
//  Created by Faheem Hussain on 11/19/16.
//  Copyright © 2016 Faheem Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sliderFinished() {
        print("\n\nthe circle was completed\n\n")
    }
    
    func sliderChanged(_ rad: AnyObject) {
        print("moved to rad: \(rad)")
        
    }
    
    func sliderFailed() {
        print("\n\ncircle circling has failed user messed up\n\n")
    }


}

