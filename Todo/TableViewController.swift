//
//  ViewController.swift
//  Todo
//
//  Created by Apple on 06/08/19.
//  Copyright © 2019 DevRabbit. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var itemsArr = ["Buy Apples", "Oranges", "Grapes"]
//    var itemsArr:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = itemsArr[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add Item to Todo", message: "Please enter item name", preferredStyle: .alert)
        alert.addTextField { (alertTextfield) in
        
            textfield = alertTextfield
            
        }
        let addItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print(textfield.text!)
            self.itemsArr.append(textfield.text!)
            
            self.tableView.reloadData()
            
        }
        
        alert.addAction(addItemAction)
        present(alert, animated: true, completion: nil)
        
    }
    
   

}

