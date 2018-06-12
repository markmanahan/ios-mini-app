//
//  BucketListTableViewController.swift
//  Note Taker
//
//  Created by Benjamin Fuhrman on 2/10/18.
//  Copyright © 2018 Mark Sherriff. All rights reserved.
//
//  Benjamin Fuhrman (bdf7kt)
//  Mark Manahan (mmm5ja)

/*
 References:
 
 Creating the background color of the bucketlist items (2/10):
 https://stackoverflow.com/questions/24089999/how-do-you-create-a-swift-date-object
 http://uicolor.xyz/#/hex-to-ui
 
 Initializing a data via a string(2/10):
 https://stackoverflow.com/questions/24089999/how-do-you-create-a-swift-date-object
 
 UITableViewCell Edit Button Segue (2/14):
 https://stackoverflow.com/questions/22759167/how-to-make-a-push-segue-when-a-uitableviewcell-is-selected
 
 */

import UIKit

extension Date {
    
    // Allow for initializing dates with a string in the format of year, month, day
    init?(dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        if let d = dateStringFormatter.date(from: dateString) {
            self.init(timeInterval: 0, since: d)
        } else {
            return nil
        }
    }
}

class BucketListTableViewController: UITableViewController {
    
    //MARK: Properties - Notes
    
    var tmpBucketItem = BucketItem(name: "Should not appear", longitude: "999", latitude: "999", description: "Should not appear", due_date: Date(dateString: "2012-12-12")!)
    var bucketlist = [BucketItem]()
    let sampleDateTime1 = Date(dateString: "2018-03-09")
    let sampleDateTime2 = Date(dateString: "2018-03-01")
    let sampleDateTime3 = Date(dateString: "2019-05-21")
    
    var bucketItemEdit = BucketItem(name: "", longitude: "", latitude: "", description: "", due_date: Date(dateString: "2012-12-12")!)
    
    // Signifies first time loading the application
    var isFirstTime = true
    
    // Get the bucket list data holder
    @IBOutlet var bucketListData: UITableView!
    
    // Preloading of data
    func loadSampleBucketItems() {
        let bucketItem1 = BucketItem(name: "Go to Lighting of the Lawn", longitude: "12.1", latitude: "25.2", description: "At the Rotunda", due_date: sampleDateTime1!)
        bucketItem1.done_status = true
        bucketlist += [bucketItem1]
        let bucketItem2 = BucketItem(name: "Visit Ohill's telescope", longitude: "13.1", latitude: "26.2", description: "At nightime", due_date: sampleDateTime2!)
        bucketlist += [bucketItem2]
        let bucketItem3 = BucketItem(name: "Steam Tunneling", longitude: "14.1", latitude: "27.2", description: "Very quietly", due_date: sampleDateTime3!)
        bucketlist += [bucketItem3]
    }
    
    //MARK: Button Actions
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Code for you to write!", message: "You can add code here to open a new ViewController to add a new note!", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    //MARK: Basic ViewController Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isFirstTime){
            loadSampleBucketItems()
        }
        reloadBucketList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Call this function after updating the bucketlist
    func reloadBucketList(){
        bucketlist.sort(by: compareTo)
        bucketListData.reloadData()
    }
    
    // MARK: TableView Functions
    
    // Override to show how many lists there should be
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Override to show how many notes are in the list
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucketlist.count
    }
    
    // Override to show what each cell should have in it based on the note in the list
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BucketListTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BucketListTableViewCell
        
        // Fetches the appropriate note for the data source layout.
        let bucketItem = bucketlist[indexPath.row]
        
        // Changes the item's background depending on its done status
        if(bucketItem.done_status){
            cell.backgroundColor = UIColor(red:0.68, green:0.96, blue:0.80, alpha:1.0)
        } else {
            cell.backgroundColor = UIColor(red:0.72, green:0.73, blue:0.73, alpha:1.0)
        }
        
        cell.bucketItemNameLabel.text = bucketItem.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let convertedDate = dateFormatter.string(from: bucketItem.due_date)
        cell.dateLabel.text = convertedDate
        
        return cell
    }
    
    // Override to support tapping on an element in the table view.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath[1]
        let currentBucketItem = bucketlist[index]
        let alertController = UIAlertController(title: currentBucketItem.name, message: currentBucketItem.description + "\nsaved at: " + currentBucketItem.due_date.description, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //    // Override to support editing the table view if you wanted just a delete button
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        if editingStyle == .delete {
    //            // Delete the row from the data source
    //            notes.remove(at: indexPath.row)
    //            // Delete the row from the view
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //        } else if editingStyle == .insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //        }
    //    }
    
    // Lets you add various buttons when you swipe
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let done = UITableViewRowAction(style: .normal, title: "Done") { action, index in
            let bucketItemDone = self.bucketlist[index.row]
            bucketItemDone.done_status = !bucketItemDone.done_status
            self.reloadBucketList()
        }
        done.backgroundColor = .green
        
        // when the edit button is clicked
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            self.bucketItemEdit = self.bucketlist[index.row] // obtain the bucket item the edit button is for
            self.performSegue(withIdentifier: "toEditItemSegue", sender: self) // segue into the edit view controller
            // print(bucketItemEdit.name)
            
            
        }
        edit.backgroundColor = .orange
        
        
        return [done, edit]
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }
    
    // MARK: Segue
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "toAddItemSegue") {
            let destinationVC = segue.destination as! UINavigationController
            let targetController = destinationVC.topViewController as! AddItemViewController
            
            // Pass over the bucketlist
            targetController.savedBucketList = bucketlist
            
        }
        
        else if (segue.identifier == "toEditItemSegue") {
            
            let targetController = segue.destination as! EditItemViewController
            // let targetController = destinationVC.topViewController as! EditItemViewController
            
            // pass over the attributes of the bucket item to be changed
            targetController.name_entered = bucketItemEdit.name
            targetController.longitude_entered = bucketItemEdit.longitude
            targetController.latitude_entered = bucketItemEdit.latitude
            targetController.description_entered = bucketItemEdit.description
            targetController.due_date_entered = bucketItemEdit.due_date
            targetController.done_status_holder = bucketItemEdit.done_status
            targetController.savedBucketList = bucketlist
            
        }
        
    }
    
    
}
