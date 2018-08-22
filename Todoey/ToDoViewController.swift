//
//  ViewController.swift
//  Todoey
//
//  Created by Renoy Rahman Chowdhury on 21/08/2018.
//  Copyright © 2018 Renoy Rahman Chowdhury. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var anArray : [String] = []
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String]{
            anArray = items
        }
    }
    
    //MARK: tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = anArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(anArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: IBActions
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Test", message: "Message", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "test", style: .default) { (action) in
            self.defaults.set(self.anArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
            print(textfield.text)
            print("Success")
        }
        
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "aPlaceholder"
            textfield = alertTextfield
            print(alertTextfield)
        }
        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
        
    }
    

}
