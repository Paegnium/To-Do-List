//
//  ToDosTableViewController.swift
//  To-Do List
//
//  Created by Daniel on 19/6/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//


import UIKit
let defaults = UserDefaults.standard


class ToDosTableViewController: UITableViewController, ToDoCellDelegate {
    func checkMarkTapped(sender: ToDoTableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = toDos[indexPath.row]
            todo.isComplete = !todo.isComplete
            toDos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToFile(toDos: toDos)
        }
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var toDos : [ToDo] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        if let loadedToDos = ToDo.loadFromFile() {
            toDos = loadedToDos
        }
        var retrievedTitle = defaults.object(forKey: "tviewTitle") as? String ?? "My To-Do List"
        titleTextField.text = retrievedTitle
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        ToDo.saveToFile(toDos: toDos)
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoTableViewCell
        cell.delegate = self
        let selectedToDo = toDos[indexPath.row]
        cell.titleLabel.text = selectedToDo.title
        cell.dateLabel.text = "\(selectedToDo.date)"
        cell.categoryLabel.text = selectedToDo.category
        cell.checkmark.isSelected = selectedToDo.isComplete
        return cell
    }
    
 

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBAction func titleDidHitEnter(_ sender: UITextField) {
        defaults.set(titleTextField.text, forKey: "tviewTitle")
        var myText = titleTextField.text
        
        UserDefaults.standard.set(myText, forKey: "tviewTitle")
        sender.resignFirstResponder()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
            ToDo.saveToFile(toDos: toDos)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let toDo = toDos.remove(at: fromIndexPath.row)
        toDos.insert(toDo, at: to.row)
        tableView.reloadData()
        ToDo.saveToFile(toDos: toDos)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let dest = segue.destination as! DetailsViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedToDo = toDos[indexPath.row]
                dest.toDo = selectedToDo
            }

        }
    }
    
    @IBAction func backToToDoList (with segue: UIStoryboardSegue) {
        if segue.identifier == "saveUnwind" {
            if tableView.indexPathForSelectedRow == nil {
            let source = segue.source as! AddToDoTableViewController
            toDos.insert(source.toDo, at: 0)
                ToDo.saveToFile(toDos: toDos)
        }
            tableView.reloadData()
        }
    }
    

}
