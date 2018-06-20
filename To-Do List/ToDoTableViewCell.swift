//
//  ToDoTableViewCell.swift
//  To-Do List
//
//  Created by Daniel on 19/6/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkMarkTapped(sender: ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {
    var toDo: ToDo!
    var delegate: ToDoCellDelegate?

    @IBOutlet weak var checkmark: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func checkMarkTicked(_ sender: Any) {
        delegate?.checkMarkTapped(sender: self)
    }
    func checkMarkTapped (sender: ToDoTableViewCell) {
 
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


