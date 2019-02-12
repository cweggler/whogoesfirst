//
//  ViewController.swift
//  Who Goes First
//
//  Created by Cara on 2/6/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // This label shows the title at first but will change to show the team after a button is pushed
    @IBOutlet var whoGoesFirst: UILabel!
    
    // This is the label for Team 1
    @IBOutlet var teamOneLabel: UILabel!
    
    // This is the label for Team 2
    @IBOutlet var teamTwoLabel: UILabel!
    
    // This is the UITextField for Team 1
    @IBOutlet var teamOneText: UITextField!
    
    // This is the UITextField for Team 2
    @IBOutlet var teamTwoText: UITextField!
    
    // This is the Button for selecting a random team to go first
    @IBOutlet var selectRandomTeam: UIButton!
    
    // function for the initial load of the app
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* disable the Select Random Team button and show "Enter Both Team Names" when
        the app first loads */
        selectRandomTeam.isEnabled = false
        selectRandomTeam.setTitle("Enter Both Team Names", for: UIControl.State.disabled)
        
    }
    
    // This method defines the action the Select Random Team button does
    @IBAction func selectRandomTeam(_sender: UIButton){
        
        //read both names from teamOneText and teamTwoText
        let teamOne = teamOneText.text
        let teamTwo = teamTwoText.text
        
        //Check that user has typed something into both UITextFields
        if teamOne != nil, teamTwo != nil {
            
            /* The Bool.random() function simulates a coin toss with True/False
             If true is selected then TeamOne will display to go first
             If false is selected then TeamTwo will display to go first */
            let randomBoolean = Bool.random()
            if randomBoolean == true {
                // force unwrap is used because we already checked for nil in the if statement
                whoGoesFirst.text = "\(teamOne!) goes first!"
            }
            else{
                whoGoesFirst.text = "\(teamTwo!) goes first!"
            }
        }
        
        // If there is not something in both textfields, do nothing
       
    }
    
    // Method for the teamOneText field when changing the text
    @IBAction func teamOneTextEditingChanged(_ textField: UITextField){
        updateButton()
        
    }
    
    // Method for the teamTwoText field when changing the text
    @IBAction func teamTwoTextEditingChanged(_ textField: UITextField){
        updateButton()
        
    }
    
    // Allows the user to tap away from the text fields and update the button
    // Also dismisses the keyboard
    @IBAction func tapAway(_ sender: UITapGestureRecognizer){
        updateButton()
        teamOneText.resignFirstResponder()
        teamTwoText.resignFirstResponder()
    }
    
    /* Method that checks whether both text fields: teamOneText and teamTwoText
     have text, if they both do then it updates the button by enabling selectRandomTeam */
    func updateButton() {
        if teamOneText.hasText && teamTwoText.hasText {
            selectRandomTeam.isEnabled = true
        } else {
            selectRandomTeam.isEnabled = false
        }
    }


}

