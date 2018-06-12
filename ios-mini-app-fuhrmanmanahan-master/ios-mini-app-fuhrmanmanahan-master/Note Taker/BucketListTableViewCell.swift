//
//  BucketListTableViewCell.swift
//  Note Taker
//
//  Created by Benjamin Fuhrman on 2/10/18.
//  Copyright © 2018 Mark Sherriff. All rights reserved.
//
//  Benjamin Fuhrman (bdf7kt)
//  Mark Manahan (mmm5ja)

// import Foundation
import UIKit

class BucketListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bucketItemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
