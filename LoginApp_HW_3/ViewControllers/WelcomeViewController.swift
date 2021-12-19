//
//  WelcomeViewController.swift
//  LoginApp_HW_3
//
//  Created by Артем Черненко on 15.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    var welcomeMessage: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "Welcome"
        tabBarItem.image = .checkmark
        welcomeMessageLabel.text = "Welcome \(welcomeMessage ?? "")"
        welcomeMessageLabel.sizeToFit()
    }
    
}
