//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var items: [ListItem] = [
        ListItem(id: "A", title: "A", selected: false),
        ListItem(id: "B", title: "B", selected: false),
        ListItem(id: "C", title: "C", selected: false),
        ListItem(id: "D", title: "D", selected: false),
        ListItem(id: "E", title: "E", selected: false),
        ListItem(id: "F", title: "F", selected: false),
        ListItem(id: "G", title: "G", selected: false),
        ListItem(id: "H", title: "H", selected: false),
        ListItem(id: "I", title: "I", selected: false),
        ListItem(id: "J", title: "J", selected: false),
        ListItem(id: "K", title: "K", selected: false),
        ListItem(id: "L", title: "L", selected: false),
        ListItem(id: "M", title: "M", selected: false),
        ListItem(id: "N", title: "N", selected: false),
        ListItem(id: "O", title: "O", selected: false),
        ListItem(id: "P", title: "P", selected: false),
        ListItem(id: "Q", title: "Q", selected: false),
        ListItem(id: "R", title: "R", selected: false),
        ListItem(id: "S", title: "S", selected: false),
        ListItem(id: "T", title: "T", selected: false),
        ListItem(id: "U", title: "U", selected: false),
        ListItem(id: "V", title: "V", selected: false),
        ListItem(id: "W", title: "W", selected: false),
        ListItem(id: "X", title: "X", selected: false),
        ListItem(id: "Y", title: "Y", selected: false),
        ListItem(id: "Z", title: "Z", selected: false),
        ListItem(id: "A1", title: "A-1", selected: false),
        ListItem(id: "B1", title: "B-1", selected: false),
        ListItem(id: "C1", title: "C-1", selected: false),
        ListItem(id: "D1", title: "D-1", selected: false),
        ListItem(id: "E1", title: "E-1", selected: false),
        ListItem(id: "F1", title: "F-1", selected: false),
        ListItem(id: "G1", title: "G-1", selected: false),
        ListItem(id: "H1", title: "H-1", selected: false),
        ListItem(id: "I1", title: "I-1", selected: false),
        ListItem(id: "J1", title: "J-1", selected: false),
        ListItem(id: "K1", title: "K-1", selected: false),
        ListItem(id: "L1", title: "L-1", selected: false),
        ListItem(id: "M1", title: "M-1", selected: false),
        ListItem(id: "N1", title: "N-1", selected: false),
        ListItem(id: "O1", title: "O-1", selected: false),
        ListItem(id: "P1", title: "P-1", selected: false),
        ListItem(id: "Q1", title: "Q-1", selected: false),
        ListItem(id: "R1", title: "R-1", selected: false),
        ListItem(id: "S1", title: "S-1", selected: false),
        ListItem(id: "T1", title: "T-1", selected: false),
        ListItem(id: "U1", title: "U-1", selected: false),
        ListItem(id: "V1", title: "V-1", selected: false),
        ListItem(id: "W1", title: "W-1", selected: false),
        ListItem(id: "X1", title: "X-1", selected: false),
        ListItem(id: "Y1", title: "Y-1", selected: false),
        ListItem(id: "Z1", title: "Z-1", selected: false),
    ];
    
    let defaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mayBeDefaultItems = defaults.array(forKey: K.todoListDefaultsKey);
        
        if let defaultItems = mayBeDefaultItems {
            items = defaultItems as! [ListItem];
            
            tableView.reloadData();
        }
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableTodoListCellId, for: indexPath);
        
        cell.accessoryType = item.selected ? .checkmark : .none;
        
        cell.textLabel?.text = item.title;
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].toggle();
       
        tableView.reloadData();
        
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    @IBAction func onAddButtonTap(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Item", message: nil, preferredStyle: .alert);
        
        alert.addTextField { tf in
            tf.placeholder = "Create new item...";
        };
        
        let submit = UIAlertAction(title: "Submit", style: .default) { (action) in
            let mayBeAnswer = alert.textFields?[0].text;
            
            if let answer = mayBeAnswer {
                self.addItem(answer)
            }
        }
        
        alert.addAction(submit);
        
        present(alert, animated: true)
    }
    
    func addItem (_ item: String) {
        items.append(contentsOf: [ListItem(id: item, title: item, selected: false)]);
        
//        defaults.setValue(items, forKey: K.todoListDefaultsKey);
        
        self.tableView.reloadData();
    };
}

