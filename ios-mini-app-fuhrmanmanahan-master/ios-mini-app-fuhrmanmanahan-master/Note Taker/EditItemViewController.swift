//
//  EditItemViewController.swift
//  Note Taker
//
//  Created by Benjamin Fuhrman on 2/10/18.
//  Copyright © 2018 Mark Sherriff. All rights reserved.
//
//  Benjamin Fuhrman (bdf7kt)
//  Mark Manahan (mmm5ja)

import UIKit

class EditItemViewController: UIViewController {
    
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
    var bucket_item_to_be_edited_index: Int = 0
    var done_status_holder: Bool = false
    
    /*
    @IBAction func Cancel(sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        
    }
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // pre-load the text fields with the attributes of the bucket item to be changed
        name_field.text = name_entered
        longitude_field.text = longitude_entered
        latitude_field.text = latitude_entered
        description_field.text = description_entered
        due_date_field.date = due_date_entered
        
        // retrieve its place in the bucket list
        for i in 1...savedBucketList.count - 1 {
    
            if savedBucketList[i].name == name_entered {
                
                bucket_item_to_be_edited_index = i
                
            }
            
        }
        
    }
    
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
            
            // recreate the item, whether or not it was changed
            let edited_bucket_item = BucketItem(name: name_entered, longitude: longitude_entered, latitude: latitude_entered, description: description_entered, due_date: due_date_entered)
            edited_bucket_item.done_status = done_status_holder
            
            // remove the original bucket item that was changed
            savedBucketList.remove(at: bucket_item_to_be_edited_index)
            
            // insert the bucket item that was/was not changed into its original place in the bucket list
            savedBucketList.insert(edited_bucket_item, at: bucket_item_to_be_edited_index)
            
            /*
            targetController.bucketItemEdit.name = name_entered
            targetController.bucketItemEdit.longitude = longitude_entered
            targetController.bucketItemEdit.latitude = latitude_entered
            targetController.bucketItemEdit.description = description_entered
            targetController.bucketItemEdit.due_date = due_date_entered
            */
            
            targetController.bucketlist = savedBucketList
            // Signifies that the preloaded data does not need to be reappended
            targetController.isFirstTime = false
            
        }
        
    }
    
}
