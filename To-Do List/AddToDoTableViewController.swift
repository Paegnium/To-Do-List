//
//  AddToDoTableViewController.swift
//  To-Do List
//
//  Created by Daniel on 19/6/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import UIKit

class AddToDoTableViewController: UITableViewController {
    
    var toDo: ToDo!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo != nil {
            titleField.text = toDo.title
            descriptionField.text = toDo.description
            categoryField.text = toDo.category
            dateField.text = toDo.date
            saveButton.isEnabled = false
            titleField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            descriptionField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            categoryField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        } else {
            saveButton.isEnabled = false
            titleField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            descriptionField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            categoryField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 3) {
        return 130
        } else {
            return 45
    }
    }
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.characters.count == 1 {
            if textField.text?.characters.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let title = titleField.text, !title.isEmpty,
            let description = descriptionField.text, !description.isEmpty,
            let category = categoryField.text, !category.isEmpty
            else {
                saveButton.isEnabled = false
                return
        }
        saveButton.isEnabled = true
    }
    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveUnwind"{
            let title = titleField.text ?? ""
            let date = dateField.text ?? ""
            let category = categoryField.text ?? ""
            let description = descriptionField.text ?? ""
            let finishChecker = false
            if (toDo == nil){ toDo = ToDo(title: title, date: date, category: category, description: description, finishChecker: finishChecker)
            } else {
                toDo.title = title
                toDo.description = description
                toDo.date = date
                toDo.category = category
                toDo.finishChecker = false
            }
        }
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func returnPressedCat(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func returnPressedDesc(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
}
