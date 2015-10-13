//
//  PersonDetailViewController.swift
//  RosterApp
//
//  Created by Francisco Ragland Jr on 10/13/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate {
    
    var selectedName = "None"
    var selectedPerson = Person!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        firstNameTextField.text = selectedPerson.firstName
        lastNameTextField.text = selectedPerson.lastname

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let firstNameText = firstNameTextField.text {
            selectedPerson.firstName = firstNameText
        }
        
        if let lastNameText = lastNameTextField.text {
            selectedPerson.lastname = lastNameText
        }
        
        textField.resignFirstResponder()
        return true
    }


}
