//
//  CreateSetViewController.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/29/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import UIKit
import CoreData

class CreateSetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    var setTitle: String?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "createSet"{
            let newView = segue.destinationViewController as AddCardViewController
            newView.setTitle = setTitle
        }
    }
    
    @IBAction func createButtonPressed(sender: UIButton) {
        var title = nameField.text
        Set.createSet(title, views: 0, selfCreated: 0, numberOfCards: 0)
        setTitle = title
    }

    @IBOutlet weak var nameField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
