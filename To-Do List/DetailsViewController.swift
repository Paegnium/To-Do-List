//
//  ViewController.swift
//  To-Do List
//
//  Created by Wylie Quah on 19/6/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var toDo: ToDo!

    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsDate: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.numberOfLines = 0
        detailsTitle.text = toDo.title
        detailsDate.text = "\(toDo.date)"
        categoryLabel.text = toDo.category
        descriptionLabel.text = toDo.description
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editToDo" {
            let nav = segue.destination as! UINavigationController
            let dest = nav.viewControllers[0] as! AddToDoTableViewController
            dest.toDo = toDo
        }
    }


}

