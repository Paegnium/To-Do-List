//
//  ToDoTableViewCell.swift
//  To-Do List
//
//  Created by Daniel on 19/6/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    var toDo: ToDo!

    @IBOutlet weak var checkmark: ChekBox!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class ChekBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "checked-checkbox")! as UIImage
    let uncheckedImage = UIImage(named: "unchecked-checkbox")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}

