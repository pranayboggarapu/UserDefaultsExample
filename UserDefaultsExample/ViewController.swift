//
//  ViewController.swift
//  UserDefaultsExample
//
//  Created by Pranay Boggarapu on 8/14/19.
//  Copyright © 2019 Pranay Boggarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nightImageString: String = "astronomy-constellations-milky-way-127577"
    var sunnyImageString: String = "beach-bright-clouds-301599"
    
    
    var imageView: UIImageView = {
        var iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    

    var myAppPreferencesPage: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var midnightThemeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var themeSwitch: UISwitch = {
        var mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageView)
        
        imageView.backgroundColor = .red
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(myAppPreferencesPage)
        
        myAppPreferencesPage.text = "My App's Preferences Page"
        
        myAppPreferencesPage.backgroundColor = .white
        myAppPreferencesPage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myAppPreferencesPage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        self.view.addSubview(midnightThemeLabel)
        
        midnightThemeLabel.text = "Midnight theme"
        
        midnightThemeLabel.leftAnchor.constraint(equalTo: myAppPreferencesPage.leftAnchor, constant: -40).isActive = true
        midnightThemeLabel.topAnchor.constraint(equalTo: myAppPreferencesPage.bottomAnchor, constant: 80).isActive = true
        
        self.view.addSubview(themeSwitch)
        
        themeSwitch.leftAnchor.constraint(equalTo: myAppPreferencesPage.leftAnchor, constant: 120).isActive = true
        themeSwitch.topAnchor.constraint(equalTo: myAppPreferencesPage.bottomAnchor, constant: 80).isActive = true
        
        themeSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        if UserDefaults.standard.bool(forKey: "isMidNightSavingOn") {
            imageView.image = UIImage(imageLiteralResourceName: nightImageString)
            themeSwitch.isOn = true
        } else {
            imageView.image = UIImage(imageLiteralResourceName: sunnyImageString)
            themeSwitch.isOn = false
        }
        
        
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        
        if mySwitch.isOn {
            imageView.image = UIImage(imageLiteralResourceName: nightImageString)
            UserDefaults.standard.set(true, forKey: "isMidNightSavingOn")
        } else {
            imageView.image = UIImage(imageLiteralResourceName: sunnyImageString)
            UserDefaults.standard.set(false, forKey: "isMidNightSavingOn")
        }
        
    }


}

