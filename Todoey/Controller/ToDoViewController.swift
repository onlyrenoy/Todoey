//
//  ViewController.swift
//  Todoey
//
//  Created by Renoy Rahman Chowdhury on 21/08/2018.
//  Copyright © 2018 Renoy Rahman Chowdhury. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var itemsArray = [Item]()
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Item()
        item1.title = "something"
        itemsArray.append(item1)
        
        if let itemsu = defaults.array(forKey: "ToDoListArray") as? [Item]{
            itemsArray = itemsu
        }
    }
    
    //MARK: tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let leItem = itemsArray[indexPath.row]
        
        cell.textLabel?.text = leItem.title
        

        cell.accessoryType = leItem.done ? .checkmark : .none
        
//        if leItem.done == true {
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemsArray[indexPath.row])
        
        itemsArray[indexPath.row].done = !itemsArray[indexPath.row].done
        
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
            
            self.itemsArray.append(newItem)
            self.defaults.set(self.itemsArray, forKey: "ToDoListArray")
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

