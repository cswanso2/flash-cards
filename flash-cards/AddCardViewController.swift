//
//  AddCardViewController.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/31/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import UIKit
import CoreData

class AddCardViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        set = Set.getSet(setTitle!)
        println(set?.title)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var setTitle: String?
    var set: Set?
    
    @IBOutlet weak var frontCard1: UITextField!
    @IBOutlet weak var backCard1: UITextField!
    @IBOutlet weak var frontCard2: UITextField!
    @IBOutlet weak var backCard2: UITextField!
    @IBOutlet weak var frontCard3: UITextField!
    @IBOutlet weak var backCard3: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    /*
    If any filled in front/back does not have a corresponding front back card filled in
    this will return false. Otherwise true
    */
    func validFields()-> Bool
    {
        return (frontCard1.text.isEmpty == backCard1.text.isEmpty)  && (frontCard2.text.isEmpty == backCard2.text.isEmpty) && (frontCard3.text.isEmpty == backCard3.text.isEmpty)
    }
    
    
    /*
    Checks if all fields are filled. True if all are filled false if not.
    */
    func allFilled() -> Bool
    {
        return !frontCard1.text.isEmpty && !backCard1.text.isEmpty && !frontCard3.text.isEmpty && !backCard3.text.isEmpty && !frontCard3.text.isEmpty && !backCard3.text.isEmpty
    }
    
    /*
    If card 1 has a valid value in both create a card
    */
    func validateCard1()
    {
        if frontCard1.text.isEmpty || backCard1.text.isEmpty
        {
            return
        }
        let cardFrontText = frontCard1.text
        let cardBackText = backCard1.text
        Card.createCard(cardFrontText, back: cardBackText, views: 0, right: 0, wrong: 0, holdingSet: set!)
    }
    
    /*
    If card 2 has a valid value in both create a card
    */
    func validateCard2()
    {
        if frontCard2.text.isEmpty || backCard2.text.isEmpty
        {
            return
        }
        let cardFrontText = frontCard2.text
        let cardBackText = backCard2.text
        Card.createCard(cardFrontText, back: cardBackText, views: 0, right: 0, wrong: 0, holdingSet: set!)
    }
    
    /*
    If card 3 has a valid value in both create a card
    */
    func validateCard3()
    {
        if frontCard3.text.isEmpty || backCard3.text.isEmpty
        {
            return
        }
        let cardFrontText = frontCard3.text
        let cardBackText = backCard3.text
        Card.createCard(cardFrontText, back: cardBackText, views: 0, right: 0, wrong: 0, holdingSet: set!)
    }
    
    /*
    Clear all the fields and allow the user to create more cards
    */
    func clearScreen()
    {
        frontCard1.text = ""
        backCard1.text = ""
        frontCard2.text = ""
        backCard2.text = ""
        frontCard3.text = ""
        backCard3.text = ""
        warningLabel.text = ""
    }
    
    /*
    Creates cards for all 3 fields, and clears all the fields allowing the user to create more.
    */
    @IBAction func addMoreCards(sender: AnyObject) {
        if !allFilled()
        {
            warningLabel.text = "If you are adding all cards fill all fields"
            return
        }
        validateCard1()
        validateCard2()
        validateCard3()
        clearScreen()
    }
    
    
    
    /*
    Clicked when the user is done adding cards. Any field that has both filled in will 
    have cards created. If any fron/back does not have a corresponding card the user
    will be prompted to finish. Not all cards are required to be filled
    */
    @IBAction func finishButtonPressed(sender: UIButton) {
        if(!validFields()){
            warningLabel.text = "Please make sure all cards are balanced"
            return
        }
    }
}
