//
//  SliderView.swift
//  CircleSlider
//
//  Created by Faheem Hussain on 11/19/16.
//  Copyright © 2016 Faheem Hussain. All rights reserved.
//

import UIKit


class CircleSliderView: UIView {
    var max: CGFloat = 500.0
    var min: CGFloat = 10.0
    var value: CGFloat = 0
    var circleSlider: CircleSlider!
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "CircleSliderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        let smaller = contentView.bounds.width > contentView.bounds.height ? contentView.bounds.height : contentView.bounds.width
        circleSlider = CircleSlider(frame: CGRect(x: 0, y: 0, width: smaller, height: smaller))
        circleSlider.touch_color = UIColor.white
        circleSlider.setSelector(forAction: .touchMoved, target: self, selector: #selector(sliderChanged(_:)))
        circleSlider.setSelector(forAction: .circleCompleted, target: self, selector: #selector(sliderFinished))
        circleSlider.setSelector(forAction: .touchFailed, target: self, selector: #selector(sliderFailed))
        circleSlider.circle_color = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
        circleSlider.makeSlider()
        contentView.addSubview(circleSlider)
        addSubview(contentView)
    }
    func sliderFinished() {
        // one full rotation completed
    }
    
    func sliderChanged(_ rad: AnyObject) {
        let multiplier = (((rad as! CGFloat) + .pi)/(2 * .pi))
        var red: CGFloat = 0
        var green: CGFloat = 0
        value = multiplier * (max - min)
        value += min
        valueLabel.text = "\(Int(value))"
        red = multiplier < 0.5 ? (1 - 2 * multiplier) : (2 * multiplier - 1)
        green = multiplier < 0.5 ? 1.0 : 2 * ( 1 - multiplier)
        circleSlider.circle_color = UIColor(red: red, green: green, blue: 0.0, alpha: 1.0)
    }
    
    func sliderFailed() {
        // while sliding user went out of the tolerance range for slider
    }

}
