//
//  ViewController.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController {

    var todoList = ToDoList()
    
    @IBOutlet weak var addButton: UIBarButtonItem!

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = todoList.items {
            return items.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        cell.todo = (todoList.items?[indexPath.row])!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: CGFloat(238 / 255.0), green: CGFloat(238 / 255.0), blue: CGFloat(238 / 255.0), alpha: 1)
        super.viewDidLoad()

        addButton.target = self
        addButton.action = #selector(ToDoTableViewController.onClickAddButton(sender:))
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            do {
                let realm = try Realm()
                try realm.write {
                    realm.delete((todoList.items?[indexPath.row])!)
                }
            } catch {
                print("realm delete error")
            }

            let indexPaths = NSIndexPath(row: indexPath.row, section: indexPath.section)
            tableView.deleteRows(at: [indexPaths as IndexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func onClickAddButton(sender: UIBarButtonItem) {
//        todoList.items.append(ToDoList.ToDoModel(name: "追加した", date: "hogehoge", body: "hogehogehoge"))
//        tableView.reloadData()
        
        let toDo = ToDo()
        toDo.name = "追加した"
        toDo.body = "hogehogehoge"
        toDo.deadLine = Date() as NSDate
        toDo.isComplete = false
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(toDo)
            }
        } catch {
            print("realm write error")
        }
        tableView.reloadData()
    }
}
