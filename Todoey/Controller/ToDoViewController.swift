//
//  ViewController.swift
//  Todoey
//
//  Created by Renoy Rahman Chowdhury on 21/08/2018.
//  Copyright © 2018 Renoy Rahman Chowdhury. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var items = [Item]()
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Item()
        item1.title = "something"
        items.append(item1)
        
//        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{
//            items = items
        }
    
    //MARK: tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].title
        
        if items[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        

        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
        
        items[indexPath.row].done = !items[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: IBActions
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Test", message: "Message", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "test", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textfield.text!
            
            self.items.append(newItem)
            self.defaults.set(self.items, forKey: "ToDoListArray")
            self.tableView.reloadData()
            
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
