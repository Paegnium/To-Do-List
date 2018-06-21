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
    var isPickerHidden = true
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var dateField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo != nil {
            datePickerView.date = Date().addingTimeInterval(24*60*60)
            updateDateLabel(date: datePickerView.date)
            titleField.text = toDo.title
            descriptionField.text = toDo.description
            categoryField.text = toDo.category
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
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)

        switch(indexPath) {
        case [1,0]: //Date Cell
            return isPickerHidden ? normalCellHeight :
            largeCellHeight

            
        default: return normalCellHeight
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
    func updateDateLabel(date: Date) {
        dateField.text = ToDo.dateFormatter.string(from: date)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [1,0]: //Date Cell
            isPickerHidden = !isPickerHidden
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default: break
        }
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
            let date = datePickerView.date
            let category = categoryField.text ?? ""
            let description = descriptionField.text ?? ""
            let isComplete = false
            if (toDo == nil){ toDo = ToDo(title: title, date: date, category: category, description: description, isComplete: isComplete)
            } else {
                toDo.title = title
                toDo.description = description
                toDo.date = date
                toDo.category = category
                toDo.isComplete = isComplete
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
    
    @IBAction func datePickerChanged(_ sender: Any) {
        updateDateLabel(date: datePickerView.date)
    }
    
}
