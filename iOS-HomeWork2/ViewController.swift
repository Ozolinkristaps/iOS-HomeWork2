//
//  ViewController.swift
//  iOS-HomeWork2
//
//  Created by User on 02/05/2020.
//  Copyright © 2020 ViA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundOverlay: UILabel!
    @IBOutlet weak var lightTimePicker: UIDatePicker!
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set background image
        setBackground()
        // set font color for DatePicker to white
        lightTimePicker.setValue(UIColor.white, forKey: "textColor")
        // set default traffic light color
        backgroundOverlay.backgroundColor = UIColor.green
        // when user changes DatePicker value, traffic light gets updated
        lightTimePicker.addTarget(self, action: #selector(switchTrafficLights), for: UIControl.Event.allEvents)
        
    }
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "background-image")
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @objc func switchTrafficLights(){
        
        let timePassed = Int(lightTimePicker.date.timeIntervalSince1970 -  10800) / 60
        
        // logic for switching the lights
        // if (selected time mod 7) is 0 or 1, green light is on
        if (timePassed%7 == 0 || timePassed%7 == 1) {
            backgroundOverlay.backgroundColor = UIColor.green
        }
        // if (selected time mod 7) is 2 or 6, yellow light is on
        else if (timePassed%7 == 2 || timePassed%7 == 6) {
            backgroundOverlay.backgroundColor = UIColor.yellow
        }
        // if (selected time mod 7) is 3 or 4 or 5, red light is on
        else if (timePassed%7 == 3 || timePassed%7 == 4 ||  timePassed%7 == 5){
            backgroundOverlay.backgroundColor = UIColor.red
        }
        else {
            print("Something went wrong")
        }
        
    }
}

