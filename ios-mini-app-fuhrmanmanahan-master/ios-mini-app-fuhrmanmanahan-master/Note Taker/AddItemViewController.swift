//
//  AddItemViewController.swift
//  Note Taker
//
//  Created by Benjamin Fuhrman on 2/10/18.
//  Copyright © 2018 Mark Sherriff. All rights reserved.
//
//  Benjamin Fuhrman (bdf7kt)
//  Mark Manahan (mmm5ja)

/*
 References:
 
 Retrieving input from a text field (2/10):
 https://stackoverflow.com/questions/25859986/getting-info-from-uitextfield
 
*/
import UIKit


 
class AddItemViewController: UIViewController {
    
    @IBOutlet weak var name_field: UITextField!
    @IBOutlet weak var longitude_field: UITextField!
    @IBOutlet weak var latitude_field: UITextField!
    @IBOutlet weak var description_field: UITextField!
    @IBOutlet weak var due_date_field: UIDatePicker!
    
    var name_entered: String = ""
    
    // note that these have to be numerical inputs only, casting?
    var longitude_entered: String = ""
    var latitude_entered: String = ""
    
    var description_entered: String = ""
    var due_date_entered: Date = Date()
    
    var savedBucketList = [BucketItem]()
    
    /*
    @IBAction func Cancel(sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        
    }
    */
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "SaveBucketItem") {
            let destinationVC = segue.destination as! UINavigationController
            let targetController = destinationVC.topViewController as! BucketListTableViewController
            
            
            name_entered = name_field.text!
            longitude_entered = longitude_field.text!
            latitude_entered = latitude_field.text!
            description_entered = description_field.text!
            due_date_entered = due_date_field.date
            
            let toSendBucketItem = BucketItem(name: name_entered, longitude: longitude_entered, latitude: latitude_entered, description: description_entered, due_date: due_date_entered)
            
            savedBucketList.append(toSendBucketItem)
            
            targetController.bucketlist = savedBucketList
            // Signifies that the preloaded data does not need to be reappended
            targetController.isFirstTime = false
            
        }
        
    }
    
    
}
 

