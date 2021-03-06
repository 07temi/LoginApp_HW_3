//
//  PersonViewController.swift
//  LoginApp_HW_3
//
//  Created by Артем Черненко on 17.12.2021.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var personAgeLabel: UILabel!
    @IBOutlet weak var personAboutLabel: UILabel!
    @IBOutlet weak var personContactLabel: UILabel!
    @IBOutlet weak var photoButton: UIButton!
    
    var personFirstame: String!
    var personLastname: String!
    var personAge: Int!
    var personAbout: String!
    var contact: String!
    var contactType: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ("\(personFirstame ?? "") \(personLastname ?? "")")
        personAgeLabel.text = "Возраст: \(personAge ?? 0)"
        personAboutLabel.text = personAbout
        personContactLabel.text = ("\(contactType ?? ""): \(contact ?? "")")
    }
    
}
